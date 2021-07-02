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
        MetodoXUsuario _metodo = new MetodoXUsuario();
        NegocioMetodoXUsuario negMetodo = new NegocioMetodoXUsuario();
        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();


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

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            _metodo.SetIdMP(ddl_MP.SelectedValue);
            _metodo.SetIdUsuario(this.Request.Cookies["IDUsuario"].Value);
            _metodo.SetnroTarjeta(txt_Nro.Text);
            _metodo.SetClave(txt_clave.Text);
            _metodo.SetFecha(txt_FechaVencimiento.Text);
            _metodo.SetNombres(txt_Nombres.Text);
            _metodo.SetApellidos(txt_Apellidos.Text);
            _metodo.SetDni(txt_DNI.Text);
            _metodo.SetDireccion(txt_Direccion.Text);
            _metodo.SetCodigoPostal(txt_CodigoPostal.Text);
            _metodo.SetEmail(txt_Email.Text);
            _metodo.SetTelefono(Txt_Telefono.Text);

            if (negMetodo.NU_AgregarMetodo(_metodo))
            {
                lbl_verif.Text = "Se agrego correctamente";
            }
            else lbl_verif.Text = "No se pudo Agregar el Metodo de Pago";
        }
    }


}