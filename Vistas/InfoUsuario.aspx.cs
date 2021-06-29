using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace WebApplication1
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();
        NegocioVentas negVentas = new NegocioVentas();


        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                li_infoUsuario_iu.Visible = false;
                if (this.Request.Cookies["IDUsuario"] != null)
                { 
                    user.SetId(this.Request.Cookies["IDUsuario"].Value);
                    negUser.CargarUsuarioPorID(user);
                    infoUsuario_hl_iu.Text = user.GetUser();
                    li_infoUsuario_iu.Visible = true;
                    infoUsuario_hl_iu.Visible = true;

                    lblNombre_IU.Text = user.GetNombres();
                    lblEmail_IU.Text = user.GetEmail();
                    lblApellido_IU.Text = user.GetPassword();
                    lblTelefono_IU.Text = user.GetTelefono();
                    lblFecha_IU.Text = user.GetFechaNacimiento().Substring(0,9);
                    lbl_user_IU.Text = user.GetUser();
                }
            //}
            if (!IsPostBack)
            {
                grd_ventas=negVentas.NV_CargarGridVentas(user.GetId());
            }


        }

        protected void btn_EditarPerfil_Click(object sender, EventArgs e)
        {
            lblNombre_IU.Visible = false;
            lblApellido_IU.Visible = false;
            lblTelefono_IU.Visible = false;
            lbl_user_IU.Visible = false;

            btn_EditarPerfil.Visible = false;
            btn_cancelar_IU.Visible = true;
            btn_guardar_IU.Visible = true;


            txt_Apellidos_IU.Visible = true;
            txt_Nombre_IU.Visible = true;
            txt_telefono_IU.Visible = true;
            txt_User_IU.Visible = true;


            txt_Apellidos_IU.Text = lblApellido_IU.Text;
            txt_User_IU.Text = lbl_user_IU.Text;
            txt_Nombre_IU.Text = lblNombre_IU.Text;
            txt_telefono_IU.Text = lblTelefono_IU.Text;
            
        }

        protected void btn_cancelar_IU_Click(object sender, EventArgs e)
        {
            txt_Apellidos_IU.Visible = false;
            txt_Nombre_IU.Visible = false;
            txt_telefono_IU.Visible = false;
            txt_User_IU.Visible = false;

            btn_EditarPerfil.Visible = true;
            btn_cancelar_IU.Visible = false;
            btn_guardar_IU.Visible = false;

            lblNombre_IU.Visible = true;
            lblApellido_IU.Visible = true;
            lblTelefono_IU.Visible = true;
            lbl_user_IU.Visible = true;
        }

        protected void btn_guardar_IU_Click(object sender, EventArgs e)
        {

            btn_EditarPerfil.Visible = true;
            btn_cancelar_IU.Visible = false;
            btn_guardar_IU.Visible = false;

            txt_Apellidos_IU.Visible = false;
            txt_Nombre_IU.Visible = false;
            txt_telefono_IU.Visible = false;
            txt_User_IU.Visible = false;

            lblNombre_IU.Visible = true;
            lblApellido_IU.Visible = true;
            lblTelefono_IU.Visible = true;
            lbl_user_IU.Visible = true;

            user.SetEmail(lblEmail_IU.Text);

            user.SetApellidos(txt_Apellidos_IU.Text);
            user.SetNombres(txt_Nombre_IU.Text);
            user.SetTelefono(txt_telefono_IU.Text);
            user.SetUser(txt_User_IU.Text);

            if (negUser.NU_ModificarUsuario(user, lbl_user_IU.Text))
            {
                lbl_msg_IU.Text = "Cambios agregados Correctamente";
                lblNombre_IU.Text = user.GetNombres();
                lblEmail_IU.Text = user.GetEmail();
                lblApellido_IU.Text = user.GetApellidos();
                lblTelefono_IU.Text = user.GetTelefono();
       
                lbl_user_IU.Text = user.GetUser();
                infoUsuario_hl_iu.Text = user.GetUser();
            }
            else lbl_msg_IU.Text = "El usuario ya existe intente otro";

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {

            //if (this.Request.Cookies["IDUsuario"] != null)
            //{
            //user.SetId(this.Request.Cookies["IDUsuario"].Value);
            //negUser.CargarUsuarioPorID(user);

               string Contraseña = user.GetPassword();

                if (txtContraseñaActual.Text.Trim() != Contraseña)
                {
                    lblConfirmacion.Text = "Contraseña invalida";

                }
                else if (txtContraseñaActual.Text.Trim() == Contraseña)
                {
                    lblConfirmacion.Text = "Contraseña valida";
                    lblContraseñaNueva.Visible = txtContraseñaNueva.Visible = lblContraseñaNueva2.Visible = txtContraseñaNueva2.Visible = true;
                    btnConfirmacion.Visible = cvContraseña.Visible = true;
                } 
            //}


        }

        protected void btnConfirmacion_Click(object sender, EventArgs e)
        {
            user.SetPassword(txtContraseñaNueva2.Text);
            if (negUser.ModificarPassword(user))
            {
                TaparNuevaContraseña();
                lblConfirmacion.Text = "La contraseña se modifico correctamente";
            }
            else
            {
                TaparNuevaContraseña();
                lblConfirmacion.Text = "No se pudo modificar la contraseña";
            }
        }

        protected void TaparNuevaContraseña()
        {
            lblContraseñaNueva.Visible = txtContraseñaNueva.Visible = lblContraseñaNueva2.Visible = txtContraseñaNueva2.Visible = false;
            btnConfirmacion.Visible = cvContraseña.Visible = false;
        }

        protected void Btn_Detalle_Cmd(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "Ver_Detalle")
            {
                string ID_Venta = e.CommandArgument.ToString();
                string Consulta = $"SELECT SerieKey_DV,CodJuego_DV, Precio_DV, ID_DV FROM DetalleVentas where ID_Venta_DV = '{ID_Venta}'";

                sql_Detallesventas.SelectCommand = Consulta;
                sql_Detallesventas.DataBind();
                GridView1.Visible = true;
            }
        }
    }
}