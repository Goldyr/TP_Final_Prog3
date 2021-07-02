using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        Juego _Juego;
        int cantidadKeys; 
     

        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioJuego _NJuego = new NegocioJuego();

            // Pregunto el id de la url 
            string idJuego = Request.QueryString["id"];

            // Si no hay nada le pongo un juego por default - para testing
            if (idJuego == null) idJuego = "G-00000001";

            _Juego = _NJuego.cargarJuego(idJuego);
            cargarDatos();

            // Doy a conocer la cantidad de keys

            cantidadKeys = consultarCantidadKeys();
        }

        private void cargarDatos()
        {
            Nombre_JLabel.Text = _Juego.GetNombre();

            int dto = (int)_Juego.GetDescuento();

            if(dto != 0)
            {

                PCalc_JLabel.Text = CalcularDescuento(dto, _Juego.GetPrecio()).ToString();
                PCalc_JLabel.Visible = true;
            }

            PU_JLabel.Text = _Juego.GetPrecio().ToString();
            Image1.ImageUrl = _Juego.GetImagen();
            Descripcion_JLabel.Text = _Juego.GetDescripcion();

        }

        protected void btn_Carrito_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "agregarAlCarrito")
            {
                if(cantidadKeys > 0)
                {
                
                    Label2.Text = "Se agrego al carrito!";
                    agregarTabla_Session();
                }

                else Label2.Text = "Error, no hay stock de este juego. Vuelva mas tarde.";

                Label2.Visible = true;
            }
  
        }

        public int consultarCantidadKeys()
        {
            NegocioJuego nj = new NegocioJuego();
            DataTable dt = new DataTable();
            

            dt = nj.NJ_BuscarJuego_Key(_Juego.GetCodigo());

            string keys = dt.Rows[0][1].ToString();

            if (keys != null) return Int32.Parse(keys);
            else return 0;
        }

        public void agregarTabla_Session()
        {
            if(Session["carrito"] == null)
            {
                Session["carrito"] = crearTabla();
            }

            float precio_a_pagar = float.Parse(PU_JLabel.Text);
            agregarFila((DataTable)Session["carrito"], Nombre_JLabel.Text, precio_a_pagar.ToString(), PU_JLabel.Text, "1");
        }


        public DataTable crearTabla()
        {
            DataTable dt = new DataTable();
            DataColumn columna = new DataColumn("Juego", System.Type.GetType("System.String"));

            dt.Columns.Add(columna);
            columna = new DataColumn("Cantidad", System.Type.GetType("System.String"));

            dt.Columns.Add(columna);

            columna = new DataColumn("PrecioUnitario", System.Type.GetType("System.String"));

            dt.Columns.Add(columna);

            columna = new DataColumn("Precio_a_Pagar", System.Type.GetType("System.String"));

            dt.Columns.Add(columna);

            return dt;
        }

      
        public void agregarFila(DataTable dt, string juego, string prPagar, string PU, string cantidad)
        {
            DataRow dr = dt.NewRow();
            dr["Juego"] = juego;
            dr["Precio_a_Pagar"] = prPagar;
            dr["PrecioUnitario"] = PU;
            dr["Cantidad"] = cantidad;

            dt.Rows.Add(dr);
        }
        // FUNCIONES DE UTILIDAD
        private float CalcularDescuento(int Descuento, float Precio)
        {
            Descuento = 100 - Descuento;
            return (float)Math.Round(Precio * Descuento / 100, 2);
        }
    }
}