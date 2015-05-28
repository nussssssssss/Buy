using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Data.SqlClient;

public partial class Student2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = "server=localhost;uid=test;pwd=123456;database=Homework;MultipleActiveResultSets=True";
                con.Open();

                using (SqlCommand cmd = new SqlCommand("select * from Students", con))
                {

                    string b = Session["stname"].ToString();
                    string c = "select Name from Students where Id = '" + b + "' ";
                    SqlCommand comm = new SqlCommand(c, con);
                    string d = comm.ExecuteScalar().ToString();


                } 

                using (SqlCommand cmd1 = new SqlCommand("select * from HM", con))
                {
                    SqlDataReader dr1 = cmd1.ExecuteReader();


                    while (dr1.Read())
                    {



                        Label3.Text += " <a class='list-group-item list-group-item-success'><p>" + dr1["Id"].ToString() + "号作业（" + dr1["Name"].ToString() + ")</p>" + "<p>" + dr1["Class"].ToString() + "的同学:</p>" + "<p>请于" + dr1["Time"].ToString() + "前完</p>" + dr1["Text"].ToString() + "</a>";


                    }
                    dr1.Close();
                }
                con.Close();
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //文件原名
        string fileName = Path.GetFileName(this.homeworkFile.FileName);
        //文件新名字=文件原名+当前时间
        string newFileName = fileName.Substring(0, fileName.IndexOf('.')) + DateTime.Now.ToString("yyyyMMddhhmmss");
        //给文件名加后缀名



        newFileName += fileName.Substring(fileName.IndexOf('.'), fileName.Length - fileName.IndexOf('.'));
        SqlConnection con = new SqlConnection("server=localhost;user id=test;password=123456;database=Homework");
        con.Open();

        string i=null;
        i = Session["stname"].ToString();
        SqlCommand ad = new SqlCommand("insert into Files (Id,Name)values('"+i+"','"+newFileName+"')", con);
        ad.ExecuteNonQuery();
        con.Close();
        //获得文件存储的路径名
        string Url = ConfigurationManager.AppSettings["ResoursePath"] + ConfigurationManager.AppSettings["RESHomeworkContentPath"] + @"\" + newFileName;
        //验证文件大小
        if (this.IsFileSizeLessMax())
        {  //验证文件的类型
            if (this.isTypeOk(Url))
            {
                //验证文件存储的路径是否存在
                string pathStr = ConfigurationManager.AppSettings["ResoursePath"] + ConfigurationManager.AppSettings["RESHomeworkContentPath"];
                if (!Directory.Exists(pathStr))  //如果不存在路径
                {
                    Directory.CreateDirectory(pathStr);    //创建路径
                }
                if (!Url.Equals(""))    //如果有上传文件
                {
                    FileUpload fileUpLoad = new FileUpload();
                    //1.存放文件 
                    // fileUpLoad.SaveAs(Url);
                    homeworkFile.PostedFile.SaveAs(Url);
                }
            }
        }
    }
    /// <summary>
    /// 验证上传文件是否超过规定的最大值
    /// </summary>
    /// <returns></returns>
    private bool IsFileSizeLessMax()
    {
        //返回值
        bool result = false;
        if (this.homeworkFile.HasFile)    //如果上传了文件
        {
            //获取上传文件的允许最大值
            long fileMaxSize = 1024 * 1024;
            try
            {
                fileMaxSize *= int.Parse(ConfigurationManager.AppSettings["FileUploadMaxSize"].Substring(0, ConfigurationManager.AppSettings["FileUploadMaxSize"].Length - 1));
            }
            catch (Exception ex)
            {
                //this.WriteException("UserPotal:Homework", ex);
            }
            if (this.homeworkFile.PostedFile.ContentLength > int.Parse(fileMaxSize.ToString()))    //如果文件大小超过规定的最大值
            {
                //this.ShowMessage("文件超过规定大小。");
            }
            else
            {
                result = true;
            }
        }
        else    //如果没有上传的文件
        {
            result = true;
        }
        return result;
    }

    /// <summary>
    /// 验证文件类型的方法
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    private bool isTypeOk(string fileName)
    {
        //返回结果
        bool endResult = false;
        //验证结果
        int result = 0;
        if (!fileName.Equals(""))    //如果有上传文件
        {
            //允许的文件类型
            string[] fileType = null;
            try
            {
                fileType = ConfigurationManager.AppSettings["FileType"].Split(',');
            }
            catch (Exception ex)
            {
                //this.ShowMessage("获取配置文件信息出错");
                //this.WriteException("AdminProtal:Homework", ex);
            }
            fileName = fileName.Substring(fileName.LastIndexOf('.'), fileName.Length - fileName.LastIndexOf('.'));
            for (int i = 0; i < fileType.Length; i++)
            {
                if (fileType[i].Equals(fileName))    //如果是合法文件类型
                {
                    result++;
                }
            }
            if (result > 0)
            {
                endResult = true;
            }
        }
        else    //如果没有上传文件
        {
            endResult = true;
        }
        return endResult;
    }
        
   

    
}