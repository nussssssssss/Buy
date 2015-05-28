

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

public partial class test2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //文件原名
        string fileName = Path.GetFileName(this.homeworkFile.FileName);
        //文件新名字=文件原名+当前时间
        string newFileName = fileName.Substring(0, fileName.IndexOf('.')) + DateTime.Now.ToString("yyyyMMddhhmmss");
        //给文件名加后缀名
        newFileName += fileName.Substring(fileName.IndexOf('.'), fileName.Length - fileName.IndexOf('.'));
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
    //下载方法一
    protected void btndownfile_Click(object sender, EventArgs e)
    {
        /* 微软为Response对象提供了一个新的方法TransmitFile来解决使用Response.BinaryWrite 下载超过400mb的文件时导致Aspnet_wp.exe进程回收而无法成功下载的问题。 代码如下： */

        Response.ContentType = "application/x-zip-compressed";
        Response.AddHeader("Content-Disposition", "attachment;filename=DBintegrate20120521030107.txt");
        string filename = Server.MapPath("BJNetwork/Data/DBintegrate20120521030107.txt");
        Response.TransmitFile(filename);
    }
    //下载方法二
    protected void btndownfilebyWriteFile_Click(object sender, EventArgs e)
    {
        /* using System.IO; */
        string fileName = "DBintegrate20120521030107.txt";//客户端保存的文件名 
        string filePath = Server.MapPath("BJNetwork/Data/DBintegrate20120521030107.txt");//路径 
        FileInfo fileInfo = new FileInfo(filePath);
        Response.Clear();
        Response.ClearContent();
        Response.ClearHeaders();
        Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
        Response.AddHeader("Content-Length", fileInfo.Length.ToString());
        Response.AddHeader("Content-Transfer-Encoding", "binary");
        Response.ContentType = "application/octet-stream";
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
        Response.WriteFile(fileInfo.FullName);
        Response.Flush();
        Response.End();

    }
    //下载方法三
    protected void btndownfilebyWriteFile2_Click(object sender, EventArgs e)
    {
        string fileName = "前台老师和学生界面对比20120521034329.rar";//客户端保存的文件名 
        string filePath = Server.MapPath("BJNetwork/Data/前台老师和学生界面对比20120521034329.rar");//路径 
        System.IO.FileInfo fileInfo = new System.IO.FileInfo(filePath);
        if (fileInfo.Exists == true)
        {
            const long ChunkSize = 102400;//100K 每次读取文件，只读取100K，这样可以缓解服务器的压力 
            byte[] buffer = new byte[ChunkSize];
            Response.Clear();
            System.IO.FileStream iStream = System.IO.File.OpenRead(filePath);
            long dataLengthToRead = iStream.Length;//获取下载的文件总大小 
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(fileName));
            while (dataLengthToRead > 0 && Response.IsClientConnected)
            {
                int lengthRead = iStream.Read(buffer, 0, Convert.ToInt32(ChunkSize));//读取的大小 Response.OutputStream.Write(buffer, 0, lengthRead); 
                Response.Flush();
                dataLengthToRead = dataLengthToRead - lengthRead;
            }
            Response.Close();
        }

    }
    //下载方法四
    protected void btndownfilebystream_Click(object sender, EventArgs e)
    {
        string fileName = "前台老师和学生界面对比20120521034329.rar";//客户端保存的文件名 
        string filePath = Server.MapPath("BJNetwork/Data/前台老师和学生界面对比20120521034329.rar");//路径 //以字符流的形式下载文件 
        FileStream fs = new FileStream(filePath, FileMode.Open);
        byte[] bytes = new byte[(int)fs.Length];
        fs.Read(bytes, 0, bytes.Length);
        fs.Close();
        Response.ContentType = "application/octet-stream";
        //通知浏览器下载文件而不是打开 
        Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }
}