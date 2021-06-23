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
                if (this.Request.Cookies["IDUsuario"] != null)
                {
                 
                    user.SetId( this.Request.Cookies["IDUsuario"].Value);
                    negUser.CargarUsuarioPorID(user);
                }

                if (user.GetUser() != null) IniciarSesion();
            }

        }

        private void IniciarSesion()
        {
            esconderHeaderLogIn();
            lblMensajeLogIn.Text = "Bienvenido " + user.GetUser() + "!";
            if (user.GetAdmin()) pInicio__lbladmin.Visible = true;
        }

        protected void header_btnLogIn_Click(object sender, EventArgs e)
        {
            user.SetEmail(header_tbUsuario.Text); 
            user.SetPassword(header_tbContra.Text);

            if (!negUser.cargarUsuario(user))
            {
                lblMensajeLogIn.Text = "El usuario no existe o las credenciales son incorrectas";
            }
            else
            {
                IniciarSesion();
                guardarUsuarioCookie(user);
          
            }

            limpiezaHeaderLogIn();
        }
        private void limpiezaHeaderLogIn()
        {
            header_tbUsuario.Text = header_tbContra.Text = "";
        }

        private void esconderHeaderLogIn()
        {
            divLogin.Style["height"] = "auto";
            header_tbUsuario.Visible = header_tbContra.Visible =
            header_lblUsuario.Visible = header_lblContra.Visible =
            header_btnLogIn.Visible = false;
        }

        private void guardarUsuarioCookie(Usuario user)
        {
            //HttpCookie ck = new HttpCookie("NombreUsuario", user.User);
            HttpCookie ck2 = new HttpCookie("IDUsuario", user.GetId());
          
            ck2.Expires = DateTime.Now.AddDays(15);
            //this.Response.Cookies.Add(ck);
            this.Response.Cookies.Add(ck2);
        }

        //Funcion local para verificar que el cbl tiene algo seleccionado
        private bool CategoriasCheck()
        {
            CheckBoxList cbl = ((CheckBoxList)FindControl("cbl_Categorias"));
            foreach (ListItem li in cbl.Items)
            {
                if (li.Selected)
                {
                    return true;
                }
            
            }
            lbl_error_Categorias.Visible = true;

            return false;
        }

        protected void btn_Categoria_Click(object sender, EventArgs e)
        {
            if(CategoriasCheck() == true)
            {
                Server.Transfer("Catalogo.aspx");
            }
        }
    }
}