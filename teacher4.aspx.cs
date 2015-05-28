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

public partial class teacher4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string t = Response.Cookies["usname"].Value;
        //N.Text = t;
        //TextBox5.Text = ;

    } 
    


    //protected  void Calendar1_SelectionChanged(object sender, EventArgs e)
   // {

        //dt = Calendar1.SelectedDate;
        //Response.Cookies["time"].Expires = DateTime.Now.AddDays(30);
        //Response.Cookies["time"].Value =  Calendar1.SelectedDate.ToString("yyyy-MM-dd");
        //label5.Text = Response.Cookies["time"].Value;
        
        //dt = Calendar1.SelectedDate.Year.ToString() + '-' + Calendar1.SelectedDate.Month.ToString() + '-' + Calendar1.SelectedDate.Day.ToString();



    //}
 
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection();
        con.ConnectionString  = "server=localhost;uid=test;pwd=123456;database=Homework";
        con.Open();
        //string Id =((TextBox)GridView1.Rows[e.RowIndex].Cells[0].Controls[0]).Text.ToString().Trim();
        //string Grade =((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text.ToString().Trim();
        //string Name =((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text.ToString().Trim();
        //string Class =((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text.ToString().Trim();
        string id1 = TextBox2.Text.ToString().Trim();
        string name = TextBox1.Text.ToString().Trim();
        string cla = drop2.SelectedValue.ToString();
        string text = TextBox6.Text.ToString().Trim();
        //CONVERT(DATETIME, '2011-03-13 00:00:00:000', 121)CONVERT(DATETIME,'"+dt+"',120))"
        //string dt = null;//定义存储日期的变量
        //dt = this.A1.InnerText;
        string test = this.Calendar1.SelectedDate.ToString("yyyy-MM-dd");

        string sql = "insert into HM(Id,Name,Class,Text,Time)values('" + id1 + "','" + name + "','" + cla + "','"+text+ "','"+test+"')";
      
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
    }
}