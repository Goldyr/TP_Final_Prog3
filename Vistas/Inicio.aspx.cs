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
                    //header_btn_LogOut.Visible = true;

                    user.SetId(this.Request.Cookies["IDUsuario"].Value);
                    //li_infoUsuario.Visible = true;
                    negUser.CargarUsuarioPorID(user);
                }

                if (user.GetUser() != null) IniciarSesion();

                // ==================
                // ESTILOS CSS 

                // Este es el li del nav que tiene el nombre del usuario
                // lo pongo en false al principio para que no se muestre hasta que tenga el nombre
                //li_infoUsuario.Visible = false;

                li_infoUsuario.Visible = infoUsuario_hl.Text != null ? true : false;

                mainHeader__content.Style["display"] = "flex";
                mainHeader.Style["height"] = "240px";

                //Cargo el listado de juegos abajo.
                dl_ListadoCat.DataSource = negjueg.NJ_ListarJuegos_True();
                dl_ListadoCat.DataBind();
                //Cargo el listado de checks
                

            }

            
        }

       
        private void IniciarSesion()
        {
            EsconderHeaderLogIn();

            //lblMensajeLogIn.Text = "Bienvenido " + user.GetUser() + "!";

            li_infoUsuario.Visible = true;
            infoUsuario_hl.Visible = true;
            infoUsuario_hl.Text = user.GetUser();
            mainHeader__content.Style["display"] = "none";
            mainHeader.Style["height"] = "150px";
            //header_btn_LogOut.Visible = true;

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
            //divLogin.Style["height"] = "auto";
            header_tbUsuario.Visible = header_tbContra.Visible =
            header_lblUsuario.Visible = header_lblContra.Visible =
            header_btnLogIn.Visible = false;
        }

        private void MostrarHeaderLogIn()
        {
            //divLogin.Style["height"] = "auto";
            header_tbUsuario.Visible = header_tbContra.Visible =
            header_lblUsuario.Visible = header_lblContra.Visible =
            header_btnLogIn.Visible = true;
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

            // Esconder el boton de cerrar sesion
            //header_btn_LogOut.Visible = false;

            // Esconder el boton de las opciones de admin
            pInicio__lbladmin.Visible = false;

            // Esconder el hyperlink de info usuario
            li_infoUsuario.Visible = false;

            MostrarHeaderLogIn();
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


                //Precio
                precio = float.Parse(lblPrecio.Text);

                // Descuento
                if (lblDescuento.Text == "0")
                {
                    lblDescuento.Visible = false;
                }
                else
                {
                    descuento = Int32.Parse(lblDescuento.Text);

                    lblnuevoPrecio.Text = $"$ {CalcularDescuento(100 - descuento, precio)} USD";
                    divPrecio.Controls.Add(lblnuevoPrecio);
                    lblPrecio.CssClass += "precio_tachado";

                }

                //Visual
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
            lbl_pruebas_si.Text = cbl_Categorias.SelectedValue.ToString();
            
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

            lbl_pruebas_si.Text = prueba;


            dl_ListadoCat.DataSource = negjueg.NJ_ListarJuegoXcategoria(prueba);
            dl_ListadoCat.DataBind();
        }
    }
}