using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class AgregarDisDes : System.Web.UI.Page
    {
        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Request.Cookies["IDUsuario"] != null)
            {
                user.SetId(this.Request.Cookies["IDUsuario"].Value);
                negUser.CargarUsuarioPorID(user);
                infoUsuario_hl_iu.Text = user.GetUser();
                li_infoUsuario_iu.Visible = true;
                infoUsuario_hl_iu.Visible = true;
            }
        }

        protected void btn_confirmar_Click(object sender, EventArgs e)
        {
            Distribuidora _Dis = new Distribuidora();
            //distribuidora
            _Dis.SetNombre(Nom_Dis_txtBox.Text.Trim());
            NegocioDis NDi = new NegocioDis();
            lbl_prueba.Text = NDi.NDi_AgregarDis(_Dis) ? "Correcto" :"Incorrecto";
        }

        protected void btn_confirmarDes_Click(object sender, EventArgs e)
        {
            //desarolladora
            Desarrolladora _Des = new Desarrolladora();
            _Des.SetNombre(Nom_Des_txtBox.Text.Trim());
            NegocioDes NDe = new NegocioDes();
            lbl_prueba.Text = NDe.NDe_AgregarDes(_Des) ? "Correcto" : "Incorrecto";
        }
    }
}