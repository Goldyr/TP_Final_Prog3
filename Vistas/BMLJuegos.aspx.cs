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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarGrid();
        }

        protected void grdBMLJuegos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string codJuego;
            NegocioJuego ns_juego = new NegocioJuego();
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
            NegocioJuego ns_juego = new NegocioJuego();
            grdBMLJuegos.DataSource = ns_juego.NJ_ListarJuego();
            grdBMLJuegos.DataBind();
        }

        protected void grdBMLJuegos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdBMLJuegos.EditIndex = -1;
            cargarGrid();
        }
        //TODO::RowUpdating

    }
}