using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        NegocioUsuario negUser = new NegocioUsuario();

        Usuario user = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Duda de implementacion de cookies
                if (this.Request.Cookies["IDUsuario"] != null)
                {
                    user.Id = this.Request.Cookies["IDUsuario"].Value;
                    negUser.cargarUsuario(user);
                }
            }
          
        }

        protected void header_btnLogIn_Click(object sender, EventArgs e)
        {
          
            user.Mail = header_tbUsuario.Text;
            user.Password = header_tbContra.Text;

            if(!negUser.cargarUsuario(user))
            {
                Label1.Text = "Error";
            }
            else
            {
                header_tbUsuario.Visible = header_tbContra.Visible = 
                header_lblUsuario.Visible = header_lblContra.Visible = 
                header_btnLogIn.Visible = false;
         
                Label1.Text = "Bienvenido " + user.Nombre + "!";

                HttpCookie ck = new HttpCookie("NombreUsuario", user.Nombre);
                HttpCookie ck2 = new HttpCookie("IDUsuario", user.Id);

                ck2.Expires = ck.Expires = DateTime.Now.AddDays(15);
                this.Response.Cookies.Add(ck);
                this.Response.Cookies.Add(ck2);

            }

            if (user.Admin) pInicio__lbladmin.Visible = true;
        }
    }
}