using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Diagnostics;
using System.Linq;
using System.IO;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

public partial class Delivery_form : System.Web.UI.Page
{
    int id_del;
    bool req = true;
    double cost = 0.00, cost_of_del = 0.00;
    //OracleConnection sc = new OracleConnection("Data Source = ORCL; User ID = SYSTEM; Password = Sys17917");
    OracleConnection sc = new OracleConnection("Data Source = (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = Lenovo-PC)(PORT = 1521))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = orcl))); User ID = SYSTEM; Password = Sys17917");
    List<DeliverFields> df = new List<DeliverFields>();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Fill DropDownLists
        if (req == true)
        {
            req = false;
            id_del = int.Parse(Request.QueryString["id"]);
            FillIn();
        }
    }
    private void FillIn()
    {
        dropDownList1.Items.Add("Заказ");
        dropDownList1.Items.Add("Поставка");
        try
        {
            sc.Open();
            using (OracleCommand command = new OracleCommand("SELECT * FROM Goods_catalog", sc) { CommandType = CommandType.Text })
            {
                OracleDataReader sdr = command.ExecuteReader();
                while (sdr.Read() == true)
                {
                    dropDownList2.Items.Add(sdr["Appel"].ToString());
                }
            }
            sc.Close();
        }
        catch(Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Source + ": " + ex.Message);
            Response.Redirect("Default.aspx");
        }
    }
    protected void button1_Click(object sender, EventArgs e)
    {
        int count;
        double price;
        //DateTime dt;
        if (int.TryParse(textBox1.Text, out count))
        {
            if(double.TryParse(textBox2.Text, out price))
            {
                try
                {
                    DeliverFields df1 = new DeliverFields(dropDownList2.Text, count, Convert.ToDateTime(time1.Value));
                    df.Add(df1);
                    cost = cost + count * price;
                    cost_of_del = cost_of_del + count * (price / 100);
                    label1.Text = "Позиция № " + (df.Count + 1);
                }
                catch (Exception)
                {
                    time1.Value = "Enter a valid time.";
                }
            }
            else
            {
                textBox2.BackColor = System.Drawing.Color.DarkRed;
            }
        }
        else
        {
            textBox1.BackColor = System.Drawing.Color.DarkRed;
        }
        
    }
    protected void button2_Click(object sender, EventArgs e)
    {
        df.Clear();
        Response.Redirect("Default.aspx");
    }
    protected void button3_Click(object sender, EventArgs e)
    {
        button1.Enabled = false;
        button2.Enabled = false;
        time1.EnableViewState = false;
        textBox1.Enabled = false;
        if(df.Count > 0)
        {
            try
            {
                AddDelivery();
            }
            catch(Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Source + ": " + ex.Message);
                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            System.Windows.Forms.MessageBox.Show("Вы ничего не разместили.", "Вы перейдёте на главную страницу.", System.Windows.Forms.MessageBoxButtons.OK);
            Response.Redirect("Default.aspx");
        }
    }
    protected void AddDelivery()
    {
        int num = 0, id_g = 0;
        //Write in table + costs
        sc.Open();
        //Backup()
        if (dropDownList1.Text == "Заказ")
        {
            using (OracleCommand command = new OracleCommand("Get_num_Order_1", sc) { CommandType = CommandType.StoredProcedure })
            {
                OracleParameter param = new OracleParameter("ido", OracleDbType.Int32);
                param.Direction = ParameterDirection.Output;
                command.Parameters.Add(param);

                command.ExecuteNonQuery();

                var log2 = (OracleDecimal)command.Parameters["ido"].Value;
                num = log2.ToInt32();
                
                /*OracleDataReader sdr = command.ExecuteReader();
                if (sdr.Read() == true)
                {
                    num = int.Parse(sdr[0].ToString());
                }*/
            }

            using (OracleCommand command = new OracleCommand("InsertOrder", sc) { CommandType = CommandType.StoredProcedure })
            {
                OracleParameter param = new OracleParameter();
                param.ParameterName = "id_ord1";
                param.DbType = DbType.Int32;
                param.Value = num;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "id_cust1";
                param.DbType = DbType.Int32;
                param.Value = id_del;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "pr1";
                param.DbType = DbType.VarNumeric;
                param.Value = cost;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "pr_del1";
                param.DbType = DbType.VarNumeric;
                param.Value = cost_of_del;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "date_of_sh1";
                param.DbType = DbType.Date;
                param.Value = time1.Value;
                command.Parameters.Add(param);

                command.ExecuteNonQuery();
            }
            for (int i = 0; i < df.Count; i++)
            {
                //OrderDetails
                int num1 = 0;

                using (OracleCommand command = new OracleCommand("Get_num_OrderDetail_1", sc) { CommandType = CommandType.StoredProcedure })
                {
                    OracleParameter param = new OracleParameter("ido", OracleDbType.Int32);
                    param.Direction = ParameterDirection.Output;
                    command.Parameters.Add(param);

                    command.ExecuteNonQuery();

                    var log2 = (OracleDecimal)command.Parameters["ido"].Value;
                    num1 = log2.ToInt32();
                    
                    /*OracleDataReader sdr = command.ExecuteReader();
                    if (sdr.Read() == true)
                    {
                        num1 = int.Parse(sdr[0].ToString());
                    }*/
                }

                using (OracleCommand command = new OracleCommand("SELECT * FROM List_Good", sc) { CommandType = CommandType.Text })
                {
                    OracleDataReader sdr = command.ExecuteReader();
                    while (sdr.Read() == true)
                    {
                        if (df[i].Appel == sdr["Appel"].ToString())
                        {
                            id_g = int.Parse(sdr["ID_good"].ToString());
                            break;
                        }
                    }
                }

                using (OracleCommand command = new OracleCommand("InsertOrderDetail", sc) { CommandType = CommandType.StoredProcedure })
                {
                    OracleParameter param = new OracleParameter();
                    param.ParameterName = "id_ordet1";
                    param.DbType = DbType.Int32;
                    param.Value = num1;
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "id_ord1";
                    param.DbType = DbType.Int32;
                    param.Value = num;
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "id_g1";
                    param.DbType = DbType.Int32;
                    param.Value = id_g;
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "quan1";
                    param.DbType = DbType.Int32;
                    param.Value = df[i].Quan;
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "un1";
                    param.DbType = DbType.String;
                    param.Value = "шт.";
                    command.Parameters.Add(param);

                    command.ExecuteNonQuery();
                }
            }
        }
        else
        {
            using (OracleCommand command = new OracleCommand("Get_num_Supply_1", sc) { CommandType = CommandType.StoredProcedure })
            {
                OracleParameter param = new OracleParameter("ido", OracleDbType.Int32);
                param.Direction = ParameterDirection.Output;
                command.Parameters.Add(param);

                command.ExecuteNonQuery();

                var log2 = (OracleDecimal)command.Parameters["ido"].Value;
                num = log2.ToInt32();
                
                /*OracleDataReader sdr = command.ExecuteReader();
                if (sdr.Read() == true)
                {
                    num = int.Parse(sdr[0].ToString());
                }*/
            }

            using (OracleCommand command = new OracleCommand("InsertSupply", sc) { CommandType = CommandType.StoredProcedure })
            {
                OracleParameter param = new OracleParameter();
                param.ParameterName = "id_sup1";
                param.DbType = DbType.Int32;
                param.Value = num;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "id_prov1";
                param.DbType = DbType.Int32;
                param.Value = id_del;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "c1";
                param.DbType = DbType.VarNumeric;
                param.Value = cost;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "c_sup1";
                param.DbType = DbType.VarNumeric;
                param.Value = cost_of_del;
                command.Parameters.Add(param);

                param = new OracleParameter();
                param.ParameterName = "date_of_arr1";
                param.DbType = DbType.Date;
                param.Value = time1.Value;
                command.Parameters.Add(param);

                command.ExecuteNonQuery();
            }
            for (int i = 0; i < df.Count; i++)
            {
                //SupplyDetails
                int num1 = 0;

                using (OracleCommand command = new OracleCommand("Get_num_SupplyDetail_1", sc) { CommandType = CommandType.StoredProcedure })
                {
                    OracleParameter param = new OracleParameter("ido", OracleDbType.Int32);
                    param.Direction = ParameterDirection.Output;
                    command.Parameters.Add(param);

                    command.ExecuteNonQuery();

                    var log2 = (OracleDecimal)command.Parameters["ido"].Value;
                    num1 = log2.ToInt32();
                    
                    /*OracleDataReader sdr = command.ExecuteReader();
                    if (sdr.Read() == true)
                    {
                        num1 = int.Parse(sdr[0].ToString());
                    }*/
                }

                using (OracleCommand command = new OracleCommand("SELECT * FROM List_Good", sc) { CommandType = CommandType.Text })
                {
                    OracleDataReader sdr = command.ExecuteReader();
                    while (sdr.Read() == true)
                    {
                        if (df[i].Appel == sdr["Appel"].ToString())
                        {
                            id_g = int.Parse(sdr["ID_good"].ToString());
                            break;
                        }
                    }
                }

                using (OracleCommand command = new OracleCommand("InsertSupplyDetail", sc) { CommandType = CommandType.StoredProcedure })
                {
                    OracleParameter param = new OracleParameter();
                    param.ParameterName = "id_sudet1";
                    param.DbType = DbType.Int32;
                    param.Value = num1;
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "id_sup1";
                    param.DbType = DbType.Int32;
                    param.Value = num;
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "id_g";
                    param.DbType = DbType.Int32;
                    param.Value = id_g;
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "quan1";
                    param.DbType = DbType.Int32;
                    param.Value = df[i].Quan;
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "un1";
                    param.DbType = DbType.String;
                    param.Value = "шт.";
                    command.Parameters.Add(param);

                    param = new OracleParameter();
                    param.ParameterName = "quan_kpt";
                    param.DbType = DbType.Int32;
                    param.Value = df[i].Quan;
                    command.Parameters.Add(param);

                    command.ExecuteNonQuery();
                }
            }
        }
        sc.Close();
        System.Windows.Forms.MessageBox.Show("Спасибо за выбор нашей компании!", "После закрытия окна вы перейдёте на главную страницу.", System.Windows.Forms.MessageBoxButtons.OK);
        Response.Redirect("Default.aspx");
    }
    static void RunOneProgramm(string CompiledExe, string Args, string WD, bool WaitForExit = true)
    {
        var process = new Process
        {
            StartInfo = new ProcessStartInfo
            {
                FileName = CompiledExe,//"D:\\OraclePLUser\\product\\12.2.0\\dbhome_1\\bin\\sqlplus.exe",
                Arguments = Args,
                UseShellExecute = false//,
                //UserName = "Seymour"
            }
        };
        try
        {
            process.Start();
        }
        catch (Exception ex)
        {
            List<string> vv = new List<string>();
            vv.Add(ex.Message);
            vv.Add(ex.HResult.ToString());
            System.IO.File.WriteAllLines("output_err_x.log", vv.ToArray());

            //Console.WriteLine(ex.Message);
            //Console.WriteLine(ex.StackTrace);
        }
        if (WaitForExit)
        {
            process.WaitForExit();
        }
    }
    public string AssemblyDirectory
    {
        get
        {
            string codeBase = Assembly.GetExecutingAssembly().CodeBase;
            UriBuilder uri = new UriBuilder(codeBase);
            string path = Uri.UnescapeDataString(uri.Path);
            return Path.GetDirectoryName(path);
        }
    }
    public void Backup(string[] args)
    {
        try
        {
            //Log debug info
            List<string> buff = new List<string>();
            buff.Add(Environment.UserName);
            foreach (var arg in args)
            {
                buff.Add(arg);
            }
            System.IO.File.WriteAllLines("output.log",buff.ToArray());

            //Set output encoding
            //Console.OutputEncoding = Encoding.UTF8;
            //Console.InputEncoding = Encoding.UTF8;

            var lines = System.IO.File.ReadAllLines(AssemblyDirectory + "\\Env_configs.cfg");
            foreach (var item in lines)
            {
                var splt = item.Split(';');
                Environment.SetEnvironmentVariable(splt[0], splt[1]);
            }

            RunOneProgramm(args[0], args[1] + " " + args[2], "", true);
        }
        catch(Exception ex)
        {
            List<string> vv = new List<string>();
            vv.Add(ex.Message);
            vv.Add(ex.HResult.ToString());
            System.IO.File.WriteAllLines("output_err.log", vv.ToArray());
        }
    }
}
public struct DeliverFields
{
    private string appel;
    private int quan;
    private DateTime deldate;
    public DeliverFields(string name, int count, DateTime dt)
    {
        appel = name;
        quan = count;
        deldate = dt;
    }
    public string Appel
    {
        get{ return appel; }
    }
    public int Quan
    {
        get { return quan; }
    }
};