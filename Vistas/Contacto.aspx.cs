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
                infoUsuario_hl.Text = user.GetUser();
                li_infoUsuario.Visible = true;
                infoUsuario_hl.Visible = true;
            }
        }
    }
}