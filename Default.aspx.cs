using System;
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
using System.Drawing;
using System.Data.SqlClient;
using System.Data.Common;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Text1.Attributes.Add("Value", "请输入用户名");
            Text1.Attributes.Add("OnFocus", "if(this.value=='请输入用户名'){this.value=''}");
            Text1.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入用户名'}");
            Text2.Attributes.Add("Value", "请输入密码");
            Text2.Attributes.Add("OnFocus", "if(this.value=='请输入密码'){this.value=''}");
            Text2.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入密码'}");

            //this.Text1.Value = "";
            //this.text2.value = "";
        }

    }
    public static bool CheckCode(string text)
    {
        string txt = System.Web.HttpContext.Current.Session["strIdentify"] as string;
        return text == txt;
    }
    protected void Submit1_ServerClick(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "server=localhost;uid=test;pwd=123456;database=Homework";
        con.Open();
        string l_strUserName = Text1.Text;
        string l_strPassPort = Text2.Text;
        string l_sqlTemp = "select * from Users where UserName = '" + l_strUserName + "' and UserPassWord = '" + l_strPassPort + "'";
        Session["stname"] = Text1.Text;

        SqlCommand comm = new SqlCommand(l_sqlTemp,con);

        //登录的判断
        if (comm.ExecuteScalar() != null )
        {
            //记住密码的实现
            Session["username"] = Text1.Text.Trim();
            Response.Cookies["usname"].Value = Text1.Text.Trim();
            
            if (baocunmima.Checked)
            {
                if (Request.Cookies["username"] == null)
                {
                    Response.Cookies["username"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["userpwd"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["username"].Value = Text1.Text.Trim();
                    Response.Cookies["userpwd"].Value = Text2.Text.Trim();
                }
            
            }
            this.lblResult.Text = "登陆成功";
            CheckUser();

        }

        else
        {
            //this.lblResult.Text = System.Web.HttpContext.Current.Session["strIdentify"] as string;

            this.lblResult.Text = "用户登录信息错误，请重新输入";

        }
        con.Close();
    }



    //public void DBConnect()
    //{
    //    string conn = System.Configuration.ConfigurationSettings.AppSettings["DBConnectString"];// "Server=127.0.0.1;user id=sa;password=sa;DataBase=test";

    //    m_Sqlconn = new SqlConnection(conn);

    //    try

    //    {
    //        m_Sqlconn.Open();
    //    }

    //    catch(Exception e)

    //    {
    //        this.lblResult.Text = e.ToString();
    //    }
    ////CheckUser();
    //}
    public void CheckUser() {
        //if (Text1.Value == "201226010518" && Text2.Value == "123456" )
        //{
            
            //ShowInfo.InnerHtml = "身份认证符合";
            if(drop1.SelectedItem.Text == "学生")
                Server.Transfer("student.aspx");
            else if(drop1.SelectedItem.Text == "教师")
                Server.Transfer("teacher.aspx");
            else if(drop1.SelectedItem.Text == "管理员")
                Server.Transfer("manager.aspx");
            else
                {
                    //ShowInfo.InnerHtml = "身份认证失败，请重新输入！";
                    Text1.Text  = "";
                    Text2.Text = "";
            
                }
           
        }
       
    
    //}

    //记住密码的密码显示
    protected void Text1_TextChanged(object sender, EventArgs e)
    {

        if (Request.Cookies["username"] != null) {

            if (Request.Cookies["username"].Value.Equals(Text1.Text.Trim()))
            {

                Text2.Attributes["value"] = Request.Cookies["userpwd"].Value;

            }
            else {

                Text2.Attributes["value"] = "";
            }
        
        }

    }


}