using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

public partial class GetPassword : System.Web.UI.Page
{
    //OracleConnection sc = new OracleConnection("Data Source = ORCL; User ID = SYSTEM; Password = Sys17917");
    OracleConnection sc = new OracleConnection("Data Source = (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = Lenovo-PC)(PORT = 1521))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = orcl))); User ID = SYSTEM; Password = Sys17917");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    bool IsValidLogin(string strIn)
    {
        bool res = false;
        string log;
        try
        {
            //Looking for login in OutAccess
            sc.Open();
            using (OracleCommand command = new OracleCommand("FindLogin_2", sc) { CommandType = CommandType.StoredProcedure })
            {
                OracleParameter param = new OracleParameter();
                param.ParameterName = "str";
                param.DbType = DbType.String;
                param.Value = strIn;
                command.Parameters.Add(param);

                param = new OracleParameter("kol", OracleDbType.Int32);
                param.Direction = ParameterDirection.Output;
                command.Parameters.Add(param);

                command.ExecuteNonQuery();

                var log2 = (OracleDecimal)command.Parameters["kol"].Value;
                log = log2.ToString();
                if (log == "1")
                {
                    res = true;
                }
            }
            sc.Close();
        }
        catch(Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Source + ": " + ex.Message);
            Response.Redirect("Default.aspx");
        }
        return res;
    }
    bool IsValidPassword(string str)
    {
        return Regex.IsMatch(str, @"([0-9 A-Z a-z]{8})$");
    }
    protected void button1_Click(object sender, EventArgs e)
    {
        if (!IsValidLogin(textBox1.Text))
        {
            textBox1.Text = "Enter a valid login.";
            textBox1.BackColor = System.Drawing.Color.DarkRed;
        }
        else
        {
            textBox1.Enabled = false;
            textBox1.BackColor = System.Drawing.Color.DarkGreen;
            if(textBox2.Text == textBox3.Text)
            {
                if (!IsValidPassword(textBox2.Text))
                {
                    label1.Visible = true;
                    textBox1.BackColor = System.Drawing.Color.DarkRed;
                }
                else
                {
                    label1.Visible = false;
                    textBox1.BackColor = System.Drawing.Color.White;
                    textBox2.BackColor = System.Drawing.Color.White;
                    try
                    {
                        ChangePassword();
                    }
                    catch(Exception ex)
                    {
                        System.Windows.Forms.MessageBox.Show(ex.Source + ": " + ex.Message);
                    }
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
    private void ChangePassword()
    {
        sc.Open();
        using (OracleCommand command = new OracleCommand("UpdatePassword", sc) { CommandType = CommandType.StoredProcedure })
        {
            OracleParameter param = new OracleParameter();
            param.ParameterName = "log1";
            param.DbType = DbType.String;
            param.Value = textBox1.Text;
            command.Parameters.Add(param);

            param = new OracleParameter();
            param.ParameterName = "par1";
            param.DbType = DbType.String;
            param.Value = textBox2.Text;
            command.Parameters.Add(param);
            
            command.ExecuteNonQuery();
        }
        sc.Close();
    }
    protected void textBox1_TextChanged(object sender, EventArgs e)
    {
        textBox1.Enabled = true;
        textBox1.BackColor = System.Drawing.Color.White;
    }
    protected void textBox2_TextChanged(object sender, EventArgs e)
    {
        textBox2.BackColor = System.Drawing.Color.White;
    }
    protected void textBox3_TextChanged(object sender, EventArgs e)
    {
        textBox3.BackColor = System.Drawing.Color.White;
    }
}