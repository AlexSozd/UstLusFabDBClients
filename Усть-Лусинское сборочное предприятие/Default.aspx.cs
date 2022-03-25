using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Усть_Лусинское_сборочное_предприятие
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label lb
            //Label1.Height = Page.Header;
            Page.Title = "Главная";
            Image1.ImageUrl = "/Images/novosti_lg-quantum-dot-tv.jpg";
            //Image1.Style=
            Label2.ForeColor = System.Drawing.Color.WhiteSmoke;
        }
    }
}