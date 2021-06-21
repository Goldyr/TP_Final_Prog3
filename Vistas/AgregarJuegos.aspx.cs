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

        NegocioCategoria negCategoria = new NegocioCategoria();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                negCategoria.ListarCategorias(Cat_Cbl_J);
            }
        }

        protected void btn_confirmar_Click(object sender, EventArgs e)
        {
            //VER COMO REALIZAR LA CATEGORIA!!!!!!!!

            Juego _Juego = new Juego();


            //_Juego.SetCodigo(Cod_J_txtBox.Text.Trim());
            _Juego.SetNombre(Nom_J_txtBox.Text.Trim());

            //TODO: Ver como hacer esto para ingresar datos nulos !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

            _Juego.SetPrecio(Convert.ToSingle(Pre_J_txtBox.Text.Trim()));
            _Juego.SetImagen( Img_J_txtBox.Text.Trim());
            _Juego.SetFecha(FL_J_txtBox.Text.Trim());
            _Juego.SetDescripcion(Desc_J_txtBox.Text.Trim());
            _Juego.SetCodigoDis(ddl_Dis_J.SelectedValue);
            _Juego.SetCodigoDes(ddl_Des_J.SelectedValue);
            _Juego.SetDescuento(int.Parse(Desc_J_txtBox.Text.Trim()));
            

            NegocioJuego NJ = new NegocioJuego();

            if (NJ.NJ_AgregarJuego(_Juego))
            {
                lbl_prueba.Text = "correcto";
                agregarCategorias();
            }
            else lbl_prueba.Text = "incorrecto";
        }

        protected void agregarCategorias()
        {

            Juego _Juego = new Juego();

            NegocioCategoriaXJuego NxJ = new NegocioCategoriaXJuego();
            NegocioJuego NJ = new NegocioJuego();

            CategoriaxJuego categoriaxJuego = new CategoriaxJuego();
         
            bool altaCorrecta = true;

            foreach (ListItem li in Cat_Cbl_J.Items)
            {
                _Juego = NJ.NJ_ObtenerUltimoJuego(); ///almacena el codigo del ultimo juego

                if (li.Selected == true)
                {
                    categoriaxJuego.CodigoCat = li.Value;              ///al codigoCat de CatXJuegos le da el value del item seleccionado
                    categoriaxJuego.CodigoJuego = _Juego.GetCodigo();  ///al codigoJuego de CatXJuegos le da el codigo del ultimo juego

                    if (NxJ.AgregarCategoriasxJuego(categoriaxJuego)) altaCorrecta = false;
                }
            }

            if (altaCorrecta) System.Diagnostics.Debug.WriteLine("Carga exitosa");
            else System.Diagnostics.Debug.WriteLine("Carga erronea");
        }
    }
}