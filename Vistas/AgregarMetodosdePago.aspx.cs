using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;


namespace Vistas
{
    public partial class AgregarMetodosdePago : System.Web.UI.Page
    {
        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();
        NegocioVentas negVentas = new NegocioVentas();

        protected void Page_Load(object sender, EventArgs e)
        {
            li_infoUsuario_iu.Visible = false;
            if (this.Request.Cookies["IDUsuario"] != null)
            {
                user.SetId(this.Request.Cookies["IDUsuario"].Value);
                negUser.CargarUsuarioPorID(user);
                infoUsuario_hl_iu.Text = user.GetUser();
                li_infoUsuario_iu.Visible = true;
                infoUsuario_hl_iu.Visible = true;

            }
        }

        protected void btnRegistrar(object sender, EventArgs e)
        {

        }
    }
}