using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using Negocio;
using Entidades;


namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        NegocioUsuario negUser = new NegocioUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegistrar(object sender, EventArgs e)
        {
            Usuario _User = new Usuario();
           
            string mensaje;
           

            _User.SetUser(txt_User.Text.Trim());
            _User.SetNombres(txt_Nombres.Text.Trim());
            _User.SetApellidos(txt_Apellidos.Text.Trim());
            _User.SetEmail(txt_Email.Text.Trim());
            _User.SetTelefono(txt_Telefono.Text.Trim());
            _User.SetFechaNacimiento(txt_FechaNacimiento.Text.Trim());
            _User.SetPassword(txt_RepContraseña.Text.Trim());

            int estadoAgregado = negUser.NU_AgregarUsuario(_User);

            if (estadoAgregado == 1)
            {
                mensaje = "El usuario se creo correctamente"; 
                Response.Write($"<script>alert('{mensaje}');window.location = 'Inicio.aspx';</script>"); //works great
                CargarCookie(_User);
                limpiarCampos();
            }
            else
            {
                // EL USUARIO YA EXISTE
                if (estadoAgregado == -1)
                {
                    Response.Write("<script>alert('No se pudo crear el usuario. El nombre de usuario ya se encuentra registrado')</script>");
                }
                else
                {
                    // EL MAIL YA EXISTE
                    if (estadoAgregado == -2)
                    {
                        Response.Write("<script>alert('No se pudo crear el usuario. El mail ya se encuentra registrado')</script>");
                    }
                    else
                    {
                        limpiarCampos();
                        Response.Write("<script>alert('No se pudo crear el usuario')</script>");
                    }
                }


            }
        }

        protected void CargarCookie(Usuario user)
        {
            negUser.cargarUsuario(user);
            HttpCookie ck2 = new HttpCookie("IDUsuario", user.GetId());

            ck2.Expires = DateTime.Now.AddDays(15);
            this.Response.Cookies.Add(ck2);
        }

        protected void limpiarCampos()
        {
            txt_User.Text = txt_Nombres.Text = txt_Apellidos.Text = txt_Email.Text =
                txt_Telefono.Text = txt_FechaNacimiento.Text = txt_RepContraseña.Text = "";
        }
    }
}