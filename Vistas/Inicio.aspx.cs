using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Negocio;
using Entidades;


namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();
        NegocioJuego negjueg = new NegocioJuego();

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                if (this.Request.Cookies["IDUsuario"] != null)
                {
                   user.SetId(this.Request.Cookies["IDUsuario"].Value);
                   negUser.CargarUsuarioPorID(user);
               }

                if (user.GetUser() != null) IniciarSesion();

                ActualizarCss();
            }

            lvListCat.DataSource = negjueg.NJ_ListarJuegos_True();
            lvListCat.DataBind();
        }

        private void ActualizarCss()
        {
            // ACTUALIZAR CSS DEPENDIENDO SI SE INICIO SESION O NO

            //==================================
            //  HEADER

            if(user.GetUser() == null)
            {
                mainHeader__content.Style["display"] = "flex";
                mainHeader.Style["height"] = "240px";

                //Cargo el listado de juegos abajo.
                lvListCat.DataSource = negjueg.NJ_ListarJuegos_True();
                lvListCat.DataBind();
                //Cargo el listado de checks
                

            }
            else
            {
                mainHeader__content.Style["display"] = "none";
                mainHeader.Style["height"] = "150px";

            }

            
             //=====================================
             // DIV DE INICIAR SESION

             if (user.GetUser() == null) MostrarHeaderLogIn();
             else EsconderHeaderLogIn();

             //=====================================
             // LI DEL NAV MENU

             if (user.GetUser() == null) li_infoUsuario.Style["display"] = "none";
             else li_infoUsuario.Style["display"] = "flex";

             //=====================================
             // HYPERLINK DEL NAV MENU

             if (user.GetUser() == null) infoUsuario_hl.Visible = false;
             else infoUsuario_hl.Visible = true;
        }


        private void IniciarSesion()
        {
            EsconderHeaderLogIn();
            infoUsuario_hl.Text = user.GetUser();

            ActualizarCss();

            if (user.GetAdmin()) pInicio__lbladmin.Visible = true;
        }

        protected void header_btnLogIn_Click(object sender, EventArgs e)
        {
            // AL HACER CLIC, SE GUARDA LA INFO DE LOS TEXTBOX EN EL OBJETO USUARIO
            user.SetEmail(header_tbUsuario.Text);
            user.SetPassword(header_tbContra.Text);

            if (!negUser.cargarUsuario(user))
            {
                header_tbContra.Text = "";
                lblMensajeLogIn.Text = "El usuario no existe o las credenciales son incorrectas";
            }
            else
            {
                IniciarSesion();
                GuardarCookie(user);
            }

            LimpiezaHeaderLogIn();


        }
        private void LimpiezaHeaderLogIn()
        {
            header_tbUsuario.Text = header_tbContra.Text = "";
        }

        private void EsconderHeaderLogIn()
        {
            divLogin.Style["display"] = "none";
          
        }

        private void MostrarHeaderLogIn()
        {

            divLogin.Style["display"] = "flex";
        }

        // ==================================
        // FUNCIONES COOKIES

        private void GuardarCookie(Usuario user)
        {

            HttpCookie ck2 = new HttpCookie("IDUsuario", user.GetId());

            ck2.Expires = DateTime.Now.AddDays(15);
            this.Response.Cookies.Add(ck2);
        }

        private void BorrarCookie()
        {
            HttpCookie ck_ID = new HttpCookie("IDUsuario");

            ck_ID.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(ck_ID);
        }
     
        protected void header_btn_LogOut_Click(object sender, EventArgs e)
        {
            BorrarCookie();

         
            pInicio__lbladmin.Visible = false;
   
            lblMensajeLogIn.Text = "";
        }

        // =======================
        // FUNCIONES PARA LOS LISTVIEW CUANDO CARGAN, PARA CALCULAR EL PRECIO CON DESCUENTO 
        // Y FUNCIONALIDADES CSS

        protected void lvJuegosDestacados_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

            Label lblDescuento = (Label)e.Item.FindControl("Descuento");
            Label lblPrecio = (Label)e.Item.FindControl("Precio");
            Panel divPrecio = (Panel)e.Item.FindControl("panelPrecio");
            Label lblnuevoPrecio = (Label)e.Item.FindControl("PrecioDesc");


            int descuento;
            float precio;

            // Strings

            string stringPrecio = lblPrecio.Text.Trim();
            string stringDescuento = lblDescuento.Text.TrimEnd();

            // ====================
            // Paso los strings a numeros

            //System.Diagnostics.Debug.WriteLine(stringDescuento);

            //1. Precio
            precio = float.Parse(stringPrecio);

            //2. Descuento 
            descuento = Int32.Parse(stringDescuento);

            // ====================

            if (descuento != 0)
            {
                lblnuevoPrecio.Text = $"$ {CalcularDescuento(100 - descuento, precio)} USD";
                divPrecio.Controls.Add(lblnuevoPrecio);
                lblPrecio.CssClass += "precio_tachado";
            }
            else
            {
                lblDescuento.Visible = false;
            }

            lblPrecio.Text = $"$ {precio} USD";
            lblDescuento.Text += " %";



        }

        private float CalcularDescuento(int Descuento, float Precio)
        {
            return (float)Math.Round(Precio * Descuento / 100, 2);
        }

        // ================
        // ESTO ES PARA QUE EL DESCUENTO SE ACTUALICE SI EL LISTVIEW SE ACTUALIZA 

        protected void lvJuegosDestacados_PreRender(object sender, EventArgs e)
        {
            lvJuegosDestacados.DataBind();
        }

        protected void cbl_Categorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lbl_pruebas_si.Text = cbl_Categorias.SelectedValue.ToString();
            
            string prueba = "";

            for (int x = 0; x <= cbl_Categorias.Items.Count - 1; x++)
            {
                if(cbl_Categorias.Items[x].Selected == true)
                {
                    {
                        prueba += " AND CodigoCat_CxJ = '" + cbl_Categorias.Items[x].Value + "' ";
                    }
                }
            }

           // lbl_pruebas_si.Text = prueba;


            lvListCat.DataSource = negjueg.NJ_ListarJuegoXcategoria(prueba);
            lvListCat.DataBind();
        }

        protected void txt_Prueba_TextChanged(object sender, EventArgs e)
        {
            Response.Redirect("Catalogo.aspx?busqueda=" + txt_Prueba.Text);
        }

        protected void red_Descripcion(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "redirectDescripcion")
            {
                string codigo = e.CommandArgument.ToString();
                Session["Juego"] = $"SELECT Nombre_J, Descripcion_J, Imagen_J, PU_J, Descuento_J FROM Juegos WHERE Codigo_J = '{codigo}'";
                Response.Redirect("DescripcionJuego.aspx"); //?id=" + e.CommandArgument.ToString());
                
            }
        }

       
    }
}