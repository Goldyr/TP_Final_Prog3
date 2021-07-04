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
    public partial class WebForm5 : System.Web.UI.Page
    {
        NegocioJuego ns_jue = new NegocioJuego();
        NegocioCategoria ns_cat = new NegocioCategoria();
        NegocioCategoriaXJuego ns_catxjue = new NegocioCategoriaXJuego();
        protected void Page_Load(object sender, EventArgs e)//Se tiene que llamar desde busqueda
        {
            if (!IsPostBack) 
            {
                if (Request["busqueda"] != null)
                {
                    dl_Catalogo.DataSource = ns_jue.NJ_ListarJuegos_Nombre(Request["busqueda"]);//Listara por la string en la txtbox

                    dl_Catalogo.DataBind();
                }
                else//En caso de caer en esta pag desde otra direccion 
                {
                    dl_Catalogo.DataSource = ns_jue.NJ_ListarJuegos_True();
                    dl_Catalogo.DataBind();
                    return;
                }
            }
        }

        protected void txt_Busqueda_local_TextChanged(object sender, EventArgs e)
        {
            dl_Catalogo.DataSource = ns_jue.NJ_ListarJuegos_Nombre(txt_Busqueda_local.Text);//Listara por la string en la txtbox
            dl_Catalogo.DataBind();



        }

      
    }
}