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

public partial class About : System.Web.UI.Page
{
    OracleConnection sc = new OracleConnection("Data Source = (DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = Lenovo-PC)(PORT = 1521))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = orcl))); User ID = SYSTEM; Password = Sys17917");
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ShowClients();
            ShowProvs();
        }
        catch(Exception ex)
        {
            System.Windows.Forms.MessageBox.Show(ex.Source + ": " + ex.Message);
        }
    }
    private void ShowClients()
    {
        Table1.CellSpacing = 0;
        //Table1.BorderWidth = 2;
        //Table1.GridLines = GridLines.Both;
        Table1.GridLines = GridLines.None;
        
        sc.Open();
        
        //using (OracleCommand command = new OracleCommand("SHOWLISTCLIENTS", sc) { CommandType = CommandType.StoredProcedure })
        //using (OracleCommand command = new OracleCommand("SELECT Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_cust FROM Orders)", sc) { CommandType = CommandType.Text })
        using (OracleCommand command = new OracleCommand("SELECT * FROM Clients", sc) { CommandType = CommandType.Text })
        {
            //command.Parameters.Add(new OracleParameter() { /*OracleDbType = Orac leDbType.RefCursor,*/ Direction = ParameterDirection.ReturnValue });
            //command.Parameters.Add(new OracleParameter("Type_of_firm", OracleDbType.NVarchar2) { Direction = ParameterDirection.Output });
            //command.Parameters.Add(new OracleParameter("Appel", OracleDbType.NVarchar2) { Direction = ParameterDirection.Output });
            OracleDataReader sdr = command.ExecuteReader();
            //Fill table
            while (sdr.Read() == true)
            {
                TableRow tr = new TableRow();

                TableCell c1 = new TableCell();
                c1.Text = sdr["Type_of_firm"].ToString();
                tr.Cells.Add(c1);

                TableCell c2 = new TableCell();
                c2.Text = sdr["Appel"].ToString();
                tr.Cells.Add(c2);

                Table1.Rows.Add(tr);
            }
            sdr.Close();
        }
        sc.Close();
    }
    private void ShowProvs()
    {
        //Table2 = new Table();
        Table2.CellSpacing = 0;
        //Table2.BorderWidth = 2;
        //Table2.GridLines = GridLines.Both;
        Table2.GridLines = GridLines.None;
        
        sc.Open();
        
        //using (OracleCommand command = new OracleCommand("ShowListProv", sc) { CommandType = CommandType.StoredProcedure })
        //using (OracleCommand command = new OracleCommand("SELECT Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_prov FROM Supplies)", sc) { CommandType = CommandType.Text })
        using (OracleCommand command = new OracleCommand("SELECT * FROM Provs", sc) { CommandType = CommandType.Text })
        {
            OracleDataReader sdr = command.ExecuteReader();
            while (sdr.Read() == true)
            {
                TableRow tr = new TableRow();
                
                TableCell c1 = new TableCell();
                c1.Text = sdr["Type_of_firm"].ToString();
                tr.Cells.Add(c1);

                TableCell c2 = new TableCell();
                c2.Text = sdr["Appel"].ToString();
                tr.Cells.Add(c2);

                Table2.Rows.Add(tr);
            }
            sdr.Close();
        }
        sc.Close();
        //form1.Controls.Add(Table2);
    }
}