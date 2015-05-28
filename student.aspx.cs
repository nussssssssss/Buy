using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;


public partial class index : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = "server=localhost;uid=test;pwd=123456;database=Homework;MultipleActiveResultSets=True";
            con.Open();
            using (SqlCommand cmd = new SqlCommand("select * from Students", con))
            {

                SqlDataReader dr = cmd.ExecuteReader();
                string b = Response.Cookies["usname"].Value;
                
                
                string c = "select Name from Students where Id = '" + b + "' ";
                SqlCommand comm = new SqlCommand(c, con);
                string d = comm.ExecuteScalar().ToString();
                N.Text = d;
                Response.Cookies["stuname"].Value = N.Text;
                
                while (dr.Read())
                {

                    string a = dr["Grade"].ToString().Trim();
                    int t = 0;
                    int.TryParse(dr["Grade"].ToString().Trim(), out t);
                    if (a != "")
                    {
                        if (t >= 80)
                        {
                            Label01.Text += "<tr><th>" + dr["Name"].ToString() + "</th><th>" + dr["Grade"].ToString() + "<span class='label-success'>Great</span></th></tr>";
                        }
                        else if (t >= 60)
                        {
                            Label01.Text += "<tr><th>" + dr["Name"].ToString() + "</th><th>" + dr["Grade"].ToString() + "<span class='label label-info'>Normal</span></th></tr>";
                        }
                        else
                        {
                            Label01.Text += "<tr><th>" + dr["Name"].ToString() + "</th><th>" + dr["Grade"].ToString() + "<span class='label-danger'>Terrible!</span></th></tr>";

                        }


                    }
                }

                dr.Close();
            }



            using (SqlCommand cmd1 = new SqlCommand("select * from HM", con))
            {
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {



                    Label2.Text += " <a class='list-group-item list-group-item-success'><p>" + dr1["Id"].ToString() + "号作业（" + dr1["Name"].ToString() + ")</p>" + "<p>" + dr1["Class"].ToString() + "的同学:</p>" + "<p>请于" + dr1["Time"].ToString() + "前完成以下作业</p>" + dr1["Text"].ToString() + "</a>";


                }
            }
        
        con.Close();
        }

    }
}