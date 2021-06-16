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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_confirmar_Click(object sender, EventArgs e)
        {
            //VER COMO REALIZAR LA CATEGORIA!!!!!!!!

            Juego _Juego = new Juego();
            _Juego.SetCodigo(Cod_J_txtBox.Text.Trim());
            _Juego.SetNombre(Nom_J_txtBox.Text.Trim());
            _Juego.SetPrecio(float.Parse(Pre_J_txtBox.Text.Trim()));
            _Juego.SetImagen( Img_J_txtBox.Text.Trim());
            _Juego.SetFecha(FL_J_txtBox.Text.Trim());
            _Juego.SetDescripcion(Des_J_txtBox.Text.Trim());
            _Juego.SetCodigoDis(ddl_Dis_J.SelectedValue);
            _Juego.SetCodigoDes(ddl_Des_J.SelectedValue);
            _Juego.SetDescuento(float.Parse(Desc_J_txtBox.Text.Trim()));

            NegocioJuego NJ = new NegocioJuego();

            //string _Categoria = categoria

            lbl_prueba.Text = NJ.NJ_AgregarJuego(_Juego) ? "correcto" : "incorrecto";
            
        }
    }
}