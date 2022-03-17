using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

public partial class _Default : System.Web.UI.Page
{
    //OracleConnection sc = new OracleConnection("Data Source = ORCL; User ID = SYSTEM; Password = Sys17917");
    OracleConnection sc = new OracleConnection("Data Source = (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = Lenovo-PC)(PORT = 1521))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = orcl))); User ID = SYSTEM; Password = Sys17917");
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        Image1.ImageUrl = "/Images/novosti_lg-quantum-dot-tv.jpg";
        ImageMap1.ImageUrl = "/Images/Team.jpeg";
        ImageMap2.ImageUrl = "/Images/TelAndHand1.jpg";
        ImageMap3.ImageUrl = "/Images/TelAndHand2.jpg";
        Login1.PasswordRecoveryUrl = "GetPassword.aspx";
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
                param.Value = strIn;
                param.DbType = DbType.String;
                param.Direction = ParameterDirection.Input;
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
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Source + ": " + ex.Message);
        }
        return res;
    }
    bool Authentication(string log1, string par1)
    {
        bool res = false;
        string log;
        try
        {
            //Looking for login and password in OutAccess
            sc.Open();
            using (OracleCommand command = new OracleCommand("FindLoginAndPassword_2", sc) { CommandType = CommandType.StoredProcedure })
            {
                OracleParameter param = new OracleParameter();
                param.ParameterName = "str1";
                param.Value = log1;
                param.DbType = DbType.String;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "str2";
                param.Value = par1;
                param.DbType = DbType.String;
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
        catch (Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Source + ": " + ex.Message);
        }
        return res;
    }
    protected void Login1_LoggingIn(object sender, LoginCancelEventArgs e)
    {
        if(!IsValidLogin(Login1.UserName))
        {
            Login1.InstructionText = "Enter a valid login.";
            e.Cancel = true;
        }
        else
        {
            Login1.InstructionText = string.Empty;
        }
    }
    protected void Login1_LoginError(object sender, EventArgs e)
    {
        Login1.HelpPageText = "Help with logging in...";
        Login1.PasswordRecoveryText = "Forgot your password?";
        if(ViewState["LoginErrors"] == null)
        {
            ViewState["LoginErrors"] = 0;
        }
        int ErrorCount = (int)ViewState["LoginErrors"] + 1;
        ViewState["LoginErrors"] = ErrorCount;
        if((ErrorCount > 3) && (Login1.PasswordRecoveryUrl != string.Empty))
        {
            Response.Redirect(Login1.PasswordRecoveryUrl);
        }
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        bool Authenticated = false;
        Authenticated = Authentication(Login1.UserName, Login1.Password);
        e.Authenticated = Authenticated;
        if(e.Authenticated == true)
        {
            try
            {
                sc.Open();
                using (OracleCommand command = new OracleCommand("FindID_1", sc) { CommandType = CommandType.StoredProcedure })
                {
                    OracleParameter param = new OracleParameter();
                    param.ParameterName = "str";
                    param.Value = Login1.UserName;
                    param.DbType = DbType.String;
                    command.Parameters.Add(param);

                    param = new OracleParameter("id1", OracleDbType.Int32);
                    param.Direction = ParameterDirection.Output;
                    command.Parameters.Add(param);

                    command.ExecuteNonQuery();

                    var log2 = (OracleDecimal)command.Parameters["id1"].Value;
                    int id_del = log2.ToInt32();
                    ImageMap3.Visible = true;
                    ImageMap3.HotSpots[0].NavigateUrl = "Delivery_form.aspx?id=" + id_del.ToString();
                    Response.Redirect("Delivery_form.aspx?id=" + id_del.ToString());
                }
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Source + ": " + ex.Message);
            }
        }
    }
}