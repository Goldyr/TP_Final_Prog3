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
    public partial class WebForm5 : System.Web.UI.Page
    {
        NegocioJuego ns_jue = new NegocioJuego();
        NegocioCategoria ns_cat = new NegocioCategoria();
        NegocioCategoriaXJuego ns_catxjue = new NegocioCategoriaXJuego();
        protected void Page_Load(object sender, EventArgs e)//Se tiene que llamar desde busqueda
        {
            if (!IsPostBack) 
            {
                //(TextBox)PreviousPage.FindControl("txt_Prueba")).Text
                //Request ["txtPrueba"].ToString()
                if (Request["busqueda"] != null)
                {
                    //lbl_pruebas.Text = ((TextBox)PreviousPage.FindControl("txt_Prueba")).Text;
                    //dl_Catalogo.DataSource = ns_jue.NJ_ListarJuegos_Nombre(((TextBox)PreviousPage.FindControl("txt_Prueba")).Text.ToString());
                    lbl_pruebas.Text = (Request["busqueda"]);
                    dl_Catalogo.DataSource = ns_jue.NJ_ListarJuegos_Nombre(Request["busqueda"]);//Listara por la string en la txtbox

                    dl_Catalogo.DataBind();
                }
                else//else if categorias else esto
                {
                    dl_Catalogo.DataSource = ns_jue.NJ_ListarJuegos_True();
                    dl_Catalogo.DataBind();
                    return;
                }
            }
        }
        
    }
}