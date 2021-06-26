using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

        }
    }
}