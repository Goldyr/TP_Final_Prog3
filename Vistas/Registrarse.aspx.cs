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

            _User.SetUser(txt_User.Text.Trim());
            _User.SetNombres(txt_User.Text.Trim());
            _User.SetApellidos(txt_Apellidos.Text.Trim());
            _User.SetEmail(txt_Email.Text.Trim());
            _User.SetTelefono(txt_Telefono.Text.Trim());
            _User.SetFechaNacimiento(txt_FechaNacimiento.Text.Trim());
            _User.SetPassword(txt_RepContraseña.Text.Trim());

            lbl_prueba.Text = (negUser.NU_AgregarUsuario(_User)) ? "El usuario se creo correctamente" : "No se pudo crear el usuario";

        }
    }
}