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
    public partial class WebForm7 : System.Web.UI.Page
    {
        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Request.Cookies["IDUsuario"] != null)
            {
                user.SetId(this.Request.Cookies["IDUsuario"].Value);
                negUser.CargarUsuarioPorID(user);

            }

            ActualizarCss();
        }

        private void ActualizarCss()
        {
            if(user.GetId() == null)
            {
                li_infoUsuario.Style["display"] = "none";
            }

            else
            {
                li_infoUsuario.Style["display"] = "block";
                infoUsuario_hl.Text = user.GetUser();
            }
        }
    }
}