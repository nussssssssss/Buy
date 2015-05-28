﻿using System;
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

public partial class manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //新的代码
        if (!IsPostBack)
        {
            Bind();
        }
        string t = Response.Cookies["usname"].Value;
        N.Text = t;

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
        SqlDataAdapter adq = new SqlDataAdapter("Select*from Users", con);
        DataSet dataset = new DataSet();
        adq.Fill(dataset, "Users");
        GridView1.DataSource = dataset;
        GridView1.DataKeyNames = new String[] { "Username" };
        GridView1.DataBind();
        con.Close();

    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        Bind();
    }
    //更新数据记录操作
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        this.link_db();
 
        //string Id = ((TextBox)GridView1.Rows[e.RowIndex].Cells[0].Controls[0]).Text.ToString().Trim();
        string Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[0].Controls[0]).Text.ToString().Trim();
        string UserName = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text.ToString().Trim();
        string UserPassWord = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text.ToString().Trim();
        string Iden = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text.ToString().Trim();
        SqlCommand comm = new SqlCommand("update Users set Name='" + Name + "',UserName='" + UserName + "',UserPassWord='" + UserPassWord + "',Iden='" + Iden + "'where  Username='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "';update Students set Name='" + Name + "',UserPassWord='" + UserPassWord + "',Id='" + UserName  + "'where  Id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'", con);
        con.Open();
        try
        {
            int i = Convert.ToInt32(comm.ExecuteNonQuery());
            if (i > 0)
            {
                Response.Write("<script language=javascript>alert('保存成功！')</script>");


            }
            else
            {
                Response.Write("<script language=javascript>alert('保存失败！')</script>");

            }
            GridView1.EditIndex = -1;
            Bind();

        }
        catch (Exception erro)
        {
            Response.Write("错误信息：" + erro.Message);

        }
        finally
        {
            con.Close();
        }

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Bind();
    }
    //删除记录操作
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        this.link_db();
        SqlCommand comm = new SqlCommand("delete from Users where UserName='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "';delete from Students where Id = '" + GridView1.DataKeys[e.RowIndex].Value.ToString() +" '", con);
        con.Open();
        try
        {
            int i = Convert.ToInt32(comm.ExecuteNonQuery());
            if (i > 0)
            {
                Response.Write("<script language=javascript>alert('删除成功！')</script>");


            }
            else
            {
                Response.Write("<script language=javascript>alert('删除失败！')</script>");

            }
            Bind();

        }
        catch (Exception erro)
        {
            Response.Write("错误信息：" + erro.Message);

        }
        finally
        {
            con.Close();
        }
    }
}