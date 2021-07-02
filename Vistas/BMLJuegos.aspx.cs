﻿using System;
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
        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (this.Request.Cookies["IDUsuario"] != null)
                {
                    user.SetId(this.Request.Cookies["IDUsuario"].Value);
                    negUser.CargarUsuarioPorID(user);
                    infoUsuario_hl_iu.Text = user.GetUser();
                    li_infoUsuario_iu.Visible = true;
                    infoUsuario_hl_iu.Visible = true;
                }
                cargarGrid();
            }
        }

        /*
        protected void grdBMLJuegos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string codJuego;
            codJuego = (((Label)grdBMLJuegos.Rows[e.RowIndex].FindControl("lbl_CodigoJuego_BML")).Text.ToString());
            ns_juego.NJ_EliminarJuego(codJuego);
            cargarGrid();
        }
        */
        
        protected void grdBMLJuegos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdBMLJuegos.EditIndex = e.NewEditIndex;
            cargarGrid();
        }


        //Funcion local para actualizar el grid de forma default
        protected void cargarGrid()
        {
            if (rblCheck() == false)
            {
                grdBMLJuegos.AutoGenerateDeleteButton = false;
                grdBMLJuegos.DataSource = ns_juego.NJ_ListarJuego();
                grdBMLJuegos.DataBind();
            }
            else if (rblCheck() == true)
            {
                grdBMLJuegos.AutoGenerateDeleteButton = true;
                grdBMLJuegos.DataSource = ns_juego.NJ_ListarJuegos_True();
                grdBMLJuegos.DataBind();
            }
        }
        //Funcion local para saber que grid tiene que cargar
        protected bool rblCheck()
        {
            if (rbl_Tipolistado.SelectedValue.Contains("0"))
            {
                return false;
            }
            else if (rbl_Tipolistado.SelectedValue.Contains("1"))
            {
                return true;
            }

            return false;
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
            juego_upd.SetDescuento(Convert.ToInt32(((TextBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("txt_Descuento_eit")).Text));
            juego_upd.SetFecha(((TextBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("txt_eit_FechaLanzamiento")).Text.Trim());
            juego_upd.SetDescripcion(((TextBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("txt_Descripcion_eit")).Text.Trim());
            juego_upd.SetEstado(((CheckBox)grdBMLJuegos.Rows[e.RowIndex].FindControl("cb_eit_Estado")).Checked);


            ns_juego.NJ_ModificarJuego(juego_upd);

            grdBMLJuegos.EditIndex = -1;

            cargarGrid();
        }

        protected void grdBMLJuegos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Busco los datos del edit template
            Juego juego_upd = new Juego();
            ns_juego.NJ_EliminarJuego(((Label)grdBMLJuegos.Rows[e.RowIndex].FindControl("lbl_CodigoJuego_BML")).Text);

            cargarGrid();

        }

        protected void rbl_Tipolistado_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarGrid();
        }

        protected void cv_eit_Desc_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //Custom validator para la descripcion cuando edito.
            if(args.Value.Length < 300)
            {
                args.IsValid = true;
            }   
            else
            {
                args.IsValid = false;
            }
        }
    }
}