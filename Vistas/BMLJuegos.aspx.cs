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
    public partial class WebForm9 : System.Web.UI.Page
    {
        NegocioJuego ns_juego = new NegocioJuego();
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarGrid();
        }

        protected void grdBMLJuegos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string codJuego;
            codJuego = (((Label)grdBMLJuegos.Rows[e.RowIndex].FindControl("lbl_CodigoJuego_BML")).Text.ToString());
            ns_juego.NJ_EliminarJuego(codJuego);
            cargarGrid();
        }

        
        protected void grdBMLJuegos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdBMLJuegos.EditIndex = e.NewEditIndex;
            cargarGrid();
        }


        //Funcion local para actualizar el grid
        protected void cargarGrid()
        {
            
            grdBMLJuegos.DataSource = ns_juego.NJ_ListarJuego();
            grdBMLJuegos.DataBind();
        }

        protected void grdBMLJuegos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdBMLJuegos.EditIndex = -1;
            cargarGrid();
        }

        protected void grdBMLJuegos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Busco los datos del edit template
            Juego juego_upd = new Juego();
            juego_upd.SetNombre(((TextBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text.Trim());
            juego_upd.SetCodigo(((Label)grdBMLJuegos.Rows[e.RowIndex].FindControl("lbl_eit_CodJuego")).Text.Trim());
            juego_upd.SetPrecio(Convert.ToSingle(((TextBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("txt_PU_eit")).Text.Trim()));
            juego_upd.SetCodigoDes(((DropDownList)grdBMLJuegos.Rows[e.RowIndex].FindControl("ddl_eit_CodDes")).Text.Trim());
            juego_upd.SetCodigoDis(((DropDownList)grdBMLJuegos.Rows[e.RowIndex].FindControl("ddl_eit_CodDis")).Text.Trim());
            juego_upd.SetDescuento(Convert.ToSingle(((TextBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("txt_Descuento_eit")).Text));
            juego_upd.SetFecha(((TextBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("txt_eit_FechaLanzamiento")).Text.Trim());
            juego_upd.SetDescripcion(((TextBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("txt_Descripcion_eit")).Text.Trim());
            juego_upd.SetEstado(((CheckBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("cb_eit_Estado")).Checked);


            if(ns_juego.NJ_ModificarJuego(juego_upd))
            {
                errormaybe.Text = "Anda";
            }
            else
            {
                errormaybe.Text = "Que mierda pasa";
            }

            grdBMLJuegos.EditIndex = -1;

            cargarGrid();
        }

        protected void grdBMLJuegos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}