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
    public partial class WebForm2 : System.Web.UI.Page
    {

        NegocioUsuario negUser = new NegocioUsuario();
        Usuario user = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (this.Request.Cookies["IDUsuario"] != null)
                {
                 
                    user.Id = this.Request.Cookies["IDUsuario"].Value;
                    negUser.CargarUsuarioPorID(user);
                }

                if (user.User != null) IniciarSesion();
            }

        }

        private void IniciarSesion()
        {
            esconderHeaderLogIn();
            lblMensajeLogIn.Text = "Bienvenido " + user.User + "!";
            if (user.Admin) pInicio__lbladmin.Visible = true;
        }

        protected void header_btnLogIn_Click(object sender, EventArgs e)
        {
            user.Email = header_tbUsuario.Text;
            user.Password = header_tbContra.Text;

            if (!negUser.cargarUsuario(user))
            {
                lblMensajeLogIn.Text = "El usuario no existe o las credenciales son incorrectas";
            }
            else
            {
                IniciarSesion();
                guardarUsuarioCookie(user);
          
            }

            limpiezaHeaderLogIn();
        }
        private void limpiezaHeaderLogIn()
        {
            header_tbUsuario.Text = header_tbContra.Text = "";
        }

        private void esconderHeaderLogIn()
        {
            divLogin.Style["height"] = "auto";
            header_tbUsuario.Visible = header_tbContra.Visible =
            header_lblUsuario.Visible = header_lblContra.Visible =
            header_btnLogIn.Visible = false;
        }

        private void guardarUsuarioCookie(Usuario user)
        {
            //HttpCookie ck = new HttpCookie("NombreUsuario", user.User);
            HttpCookie ck2 = new HttpCookie("IDUsuario", user.Id);
          
            ck2.Expires = DateTime.Now.AddDays(15);
            //this.Response.Cookies.Add(ck);
            this.Response.Cookies.Add(ck2);
        }
    }
}