using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Усть_Лусинское_сборочное_предприятие
{
    public partial class About : Page
    {
        //SqlConnection sc = new SqlConnection("Data Source = LENOVO-PC\\MSSQLSERVER1; Initial Catalog = Kurs; Integrated Security = SSPI");
        //DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //string proc;
            Page.Title = "О компании";
            //Label[] lb = new Label[5];
            /*for(int i = 0; i < 5; i++)
            {
                lb[i] = new Label();
                //lb[i].Height = 100 + 80 * i;
            }*/
            //lb[0].Text = "Усть-Лусинское сборочное предприятие находится на центральной улице (улице Ефремова) в городе Усть-Лусинск Владимирской области.";
            //lb[1].Text = "Наше предприятие основано в 1959 году. Изначально оно было предназначено для сборки отечественной электротехники.";
            //lb[2].Text = "В 1995 году наше предприятие перепрофилировалось для сборки продукции зарубежных ТНК, заключив с ними соответствующие договоры";
            //lb[3].Text = "С 2000 года мы несколько раз расширяли наше предприятие, добавив несколько новых сборочных линий и увеличив штат.";
            //lb[4].Text = "Несмотря на все трудности, мы смотрим в будущее с уверенностью.";
            //Label[] lb1 = new Label[2];
            //lb1[0].Text = "Список клиентов";
            //lb1[0].Height = 500;
            //lb1[0].Width = 200;
            //lb1[1].Text = "Список поставщиков";
            //lb1[1].Height = 500;
            //lb1[1].Width = 200;
            
            //proc=""
            //try
            //{
                //ShowClients("ShowListClients");
                //ShowSuppliers("ShowListProv");
            //}
            //catch(Exception)
            //{

            //}
        }
        /*protected void ShowClients(string proc)
        {
            DataTable dt = new DataTable();
            //DataGrid dg = new DataGrid();
            //dg.Height = 600;
            //dg.Width = 300;
            //dg.Style
            sc.Open();
            using (SqlCommand command = new SqlCommand(proc, sc) { CommandType = CommandType.StoredProcedure })
            {
                using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                {
                    //dt = new DataTable();
                    //dataAdapter.Fill(dt);
                    DataGrid1.DataSource = dt;
                    //dg.DataSource = dt;
                }
            }
            sc.Close();
        }*/
        /*protected void ShowSuppliers(string proc)
        {
            DataTable dt = new DataTable();
            //DataGrid dg1 = new DataGrid();
            //dg1.Height = 600;
            //dg1.Width = 300;
            sc.Open();
            using (SqlCommand command = new SqlCommand(proc, sc) { CommandType = CommandType.StoredProcedure })
            {
                using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                {
                    //dt = new DataTable();
                    dataAdapter.Fill(dt);
                    DataGrid2.DataSource = dt;
                    //dg1.DataSource = dt;
                }
            }
            sc.Close();
        }*/
    }
}