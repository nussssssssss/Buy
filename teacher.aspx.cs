using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Xml.Linq;
using System.IO;

public partial class teacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string t = Response.Cookies["usname"].Value;
        N.Text = t;

        //DataClassesDataContext data = new DataClassesDataContext();//使用Linq类
        //var s = from n in data.Students orderby n.Id select n;//执行查询
        //foreach (var t in s)
        //{
        //    Label2.Text += "<tr><th>" + t.Id + "</th><th>" + dr["Grade"].ToString() + "<span class='label label-info'>Normal</span></th></tr>";
        
        
        //}
        //新的代码
        if (!IsPostBack)
        {
            Bind();
        }
    }
    //定义Con连接变量 
    SqlConnection con = null;
    public SqlConnection link_db()
    {
        con = new SqlConnection("server=localhost;user id=test;password=123456;database=Homework");
        return con;
    }
    //添加GridView控件
    private void Bind()
    {
        this.link_db();
        SqlDataAdapter adq = new SqlDataAdapter("Select*from Students", con);
        DataSet dataset = new DataSet();
        adq.Fill(dataset, "Students");
        SqlDataAdapter adq1 = new SqlDataAdapter("Select*from Files", con);
        adq.Fill(dataset, "Files");
        
        GridView1.DataSource = dataset;
        GridView1.DataKeyNames = new String[] { "Id" };
        GridView1.DataBind();
        con.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {


            string ID = ((Button)sender).CommandArgument;
            Button btn = (Button)sender;
            Panel pan = (Panel)btn.Parent;
            TextBox tb = (TextBox)pan.FindControl("TextBox6");
            SqlConnection con = new SqlConnection("server=localhost;user id=test;password=123456;database=Homework");
            con.Open();

            SqlCommand  ad = new SqlCommand (" update Students set Grade=" + tb.Text + " where Id="+ID, con);
            ad.ExecuteNonQuery();

            //Label1.Text = ID;
            con.Close();
     }

    //protected void Unnamed_Command1(object sender, CommandEventArgs e)
    //{
    //    switch (e.CommandName )
    //    {
    //        case "Button2":


    //    Response.ContentType = "application/x-zip-compressed";
    //    Response.AddHeader("Content-Disposition", "attachment;filename=sgasha 20141230030055.txt");
    //    string filename = Server.MapPath("test/Data/sgasha 20141230030055.txt");
    //    Response.TransmitFile(filename);
   
    //            break;
        
        
    //    }
    //}
    protected void Button2_Click(object sender, EventArgs e)
    {
        //Response.ContentType = "application/x-zip-compressed";
        //Response.AddHeader("Content-Disposition", "attachment;filename=z.zip");
        //string filename = "E:/test/Data/sgasha 20141230030055.txt";
        ////Response.TransmitFile(filename);

        string ID = ((Button)sender).CommandArgument.ToString ().Trim ();
        Button btn = (Button)sender;
        ss(ID);
        }
    public void  ss(string x)
        {
        string filepach = "E:/新建/test/Data";    
     if (Directory.Exists(filepach))      
        {
        Bind();
        this.link_db();
        con.Open();
        using (SqlCommand cmd = new SqlCommand("select * from Files", con))
        {

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                
                string a = dr["Id"].ToString().Trim();
                //int t = 0;
                //int.TryParse(dr["Grade"].ToString().Trim(), out t);
                
                if (a == x)
                {
                Response.ContentType = "application/x-msword";
                Response.AddHeader("Content-Disposition", "attachment;filename='"+a+"'的作业.doc");
                string filename = filepach + "/" + dr["Name"].ToString().Trim();       
                Response.TransmitFile(filename);

                }
            }

            dr.Close();
        }
        

        //con.Close();
        }       
    else       
        {           
         Response.Write("<script type='text/javascript'> alert('没有找到文件!')</script>");            
         Response.End();       
         }    
}

}


        
        
       
    




    //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    this.link_db();
    //    Button btn = (Button)sender;
    //    Panel pan = (Panel)btn.Parent;
    //    TextBox tb = (TextBox)pan.FindControl("TextBox6");
        
    //    SqlConnection conn = new SqlConnection("server=localhost;user id=test;password=123456;database=Homework");
    //    conn.Open();
    //    string Id = ((TextBox)GridView1.Rows[e.RowIndex].Cells[0].Controls[0]).Text.ToString().Trim();
    //    SqlCommand cmd = new SqlCommand("insert into Students(Grade)values('tb.Text') where Id='" + Id + "'", conn);
    //    Label1.Text = tb.Text;
    //    try
    //    {
    //        int i = Convert.ToInt32(cmd.ExecuteNonQuery());
    //        if (i > 0)
    //        {
    //            Response.Write("<script language=javascript>alert('保存成功！')</script>");


    //        }
    //        else
    //        {
    //            Response.Write("<script language=javascript>alert('保存失败！')</script>");

    //        }
    //        GridView1.EditIndex = -1;
    //        Bind();

    //    }
    //    catch (Exception erro)
    //    {
    //        Response.Write("错误信息：" + erro.Message);

    //    }
    //    finally
    //    {
    //        conn.Close();
    //    }






