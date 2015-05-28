using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;

public partial class test : System.Web.UI.Page
{

        SqlConnection con = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
       con.ConnectionString = "server=localhost;user id=test;password=123456;database=homework";
       con.Open();

        Label1.Text = "数据库已成功打开";
        Button2.Visible = true;
        Button1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        con.Close();
        Label1.Text = "数据库已经关闭";
        Button2.Visible = false;
        Button1.Visible = true;
    }
}