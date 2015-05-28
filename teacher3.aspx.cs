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

public partial class teacher3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string t = Response.Cookies["usname"].Value;
        //N.Text = t;

    }
    protected void Submit1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "server=localhost;uid=test;pwd=123456;database=Homework";
        con.Open();
        //string Id =((TextBox)GridView1.Rows[e.RowIndex].Cells[0].Controls[0]).Text.ToString().Trim();
        //string Grade =((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text.ToString().Trim();
        //string Name =((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text.ToString().Trim();
        //string Class =((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text.ToString().Trim();
        string id1 = TextBox1.Text.ToString ().Trim ();
        string pwd = TextBox2.Text.ToString().Trim();
        string name = TextBox4.Text.ToString().Trim();
        string cla = drop1 .SelectedValue.ToString ();
        SqlCommand cmd = new SqlCommand("insert into Students(Id,UserPassword,Name,Class)values('" + id1 + "','" + pwd + "','" + name + "','" + cla + "');insert into Users(UserPassword,Name,UserName,Iden)values('" + pwd +"','" + name  + "','" +id1 + "','学生')", con);
        cmd.ExecuteNonQuery();
    }
}