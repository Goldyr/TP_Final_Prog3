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
        Usuario user = new Usuario();


        protected void Page_Load(object sender, EventArgs e)
        {

            NegocioUsuario negUser = new NegocioUsuario();

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
            NegocioMetodoXUsuario negMetodo = new NegocioMetodoXUsuario();
            MetodoXUsuario _metodoUsuario = new MetodoXUsuario();
            MetodoPago metodoPago = new MetodoPago();

            metodoPago.Id = ddl_MP.SelectedValue;

            _metodoUsuario.SetIdMP(metodoPago);
            _metodoUsuario.SetIdUsuario(user);
            _metodoUsuario.SetnroTarjeta(txt_Nro.Text);
            _metodoUsuario.SetClave(txt_clave.Text);
            _metodoUsuario.SetFecha(txt_FechaVencimiento.Text);
            _metodoUsuario.SetNombres(txt_Nombres.Text);
            _metodoUsuario.SetApellidos(txt_Apellidos.Text);
            _metodoUsuario.SetDni(txt_DNI.Text);
            _metodoUsuario.SetDireccion(txt_Direccion.Text);
            _metodoUsuario.SetCodigoPostal(txt_CodigoPostal.Text);
            _metodoUsuario.SetEmail(txt_Email.Text);
            _metodoUsuario.SetTelefono(Txt_Telefono.Text);

            if (negMetodo.NU_AgregarMetodo(_metodoUsuario))
            {
                lbl_verif.Text = "Se agrego correctamente";
            }
            else lbl_verif.Text = "No se pudo Agregar el Metodo de Pago";
        }
    }


}