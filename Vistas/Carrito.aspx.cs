using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace WebApplication1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["carrito"] != null)
                {

                    cargarGrid();
                    organizarGrid();
                }

                cargarGrid();
            }
        }

        // FUNCION QUE SE USA PARA ORGANIZAR EL GRIDVIEW Y CONTROLAR QUE
        // LAS CANTIDADES DE KEYS NO SUPEREN A LAS QUE TENEMOS
        // CARGADAS. 

        private void organizarGrid()    
        {

            DataTable dtSession = (DataTable)Session["carrito"];
            string nombreUltimoJuego = dtSession.Rows[dtSession.Rows.Count - 1][0].ToString();

            bool ExistenCoincidencias = false;

            foreach (GridViewRow row in gvDetallesCarrito.Rows)
            {

                Label lbl = row.Cells[0].FindControl("lbl_Juego") as Label;
                string lblString = lbl.Text;

                if (!ExistenCoincidencias)
                {

                    if (lblString == nombreUltimoJuego)
                    {
                        ExistenCoincidencias = true;
                    }

                }

            }

            if (ExistenCoincidencias)
            {
       
                int cantidadVecesRepetido = 0;

                // CONTAR LA CANTIDAD DE VECES QUE SE REPITE LA COINCIDENCIA
                cantidadVecesRepetido = ContarCoindicenciasGridView(dtSession, nombreUltimoJuego);

                // A LA TABLA, SUMAR LA CANTIDAD DE KEYS EN LAS QUE HIZO CLIC, Y CONTROLAR
                SumarCantidadesGridView(dtSession, nombreUltimoJuego, cantidadVecesRepetido);

                // ELIMINAR COINCIDENCIAS
                EliminarFilasRepetidasGridView(dtSession, nombreUltimoJuego);

                Session["carrito"] = dtSession;
            }
        }

        private void EliminarFilasRepetidasGridView(DataTable dtSession, string nombreUltimoJuego)
        {
            // Array dinamico de lo que quiero eliminar
            List<DataRow> deleteRows = new List<DataRow>();

            bool primeraCoincidencia = true;

            foreach (DataRow row in dtSession.Rows)
            {
                string nombreDataRow = row["Juego"].ToString();
                if (nombreDataRow == nombreUltimoJuego)
                {
                    if (primeraCoincidencia) primeraCoincidencia = false;
                    else
                    {
                        deleteRows.Add(row);
                    }

                }
            }

            foreach (DataRow dRows in deleteRows)
            {
                dRows.Delete();
            }

        }

        private int ContarCoindicenciasGridView(DataTable dtSession, string nombreUltimoJuego)
        {
            int cantidad = -1;

            foreach (DataRow row in dtSession.Rows)
            {
                string nombreDataRow = row["Juego"].ToString();

                if (nombreDataRow == nombreUltimoJuego)
                {
                    cantidad++;
                }
            }

            return cantidad;
        }

        private void SumarCantidadesGridView(DataTable dtSession, string nombreUltimoJuego, 
                                            int cantidadVecesRepetido)
        {
            bool primeraCoincidencia = true;
            int cantidadKeysExistentes;

            Juego _juego = new Juego();
            NegocioJuego _njuego = new NegocioJuego();

            _juego = _njuego.cargarJuegoPorNombre(nombreUltimoJuego);
            cantidadKeysExistentes = consultarCantidadKeys(_juego);

            foreach (DataRow row in dtSession.Rows)
            {
                string nombreDataRow = row["Juego"].ToString();

                if (nombreDataRow == nombreUltimoJuego)
                {
                    // EDIT SOLO DE LA PRIMERA COINCIDENCIA 

                    if (primeraCoincidencia)
                    {
                        int valorCantidadActual = int.Parse(row["Cantidad"].ToString());
                        float prPagar = float.Parse(row["Precio_a_Pagar"].ToString());
                        float prUnitario = float.Parse(row["PrecioUnitario"].ToString());

                        if (valorCantidadActual + cantidadVecesRepetido <= cantidadKeysExistentes)
                        {
                            valorCantidadActual += cantidadVecesRepetido;
                            prPagar = prUnitario * valorCantidadActual;

                            row["Cantidad"] = valorCantidadActual.ToString();
                            row["Precio_a_Pagar"] = prPagar.ToString();
                        }

                        primeraCoincidencia = false;
                    }
                    else break;
                }
            }
        }
        private int consultarCantidadKeys(Juego _Juego)
        {
            NegocioJuego nj = new NegocioJuego();
            DataTable dt = new DataTable();


            dt = nj.NJ_BuscarJuego_Key(_Juego.GetCodigo());

            string keys = dt.Rows[0][1].ToString();

            if (keys != null) return Int32.Parse(keys);
            else return 0;
        }

        protected void modificarCantidad(object sender, CommandEventArgs e)
        {
            int val = Int32.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "aumentarCantidad")
            {
                //val++;
            }

            if (e.CommandName == "disminuirCantidad")
            {

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDetallesCarrito.EditIndex = e.NewEditIndex;
            cargarGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDetallesCarrito.EditIndex = -1;
            cargarGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string nombre = ((Label)gvDetallesCarrito.Rows[e.RowIndex].FindControl("lbl_Juego")).Text;
            string cantidad = ((TextBox)gvDetallesCarrito.Rows[e.RowIndex].FindControl("tb_edit")).Text;
            string prPagar = ((Label)gvDetallesCarrito.Rows[e.RowIndex].FindControl("lbl_Prpagar")).Text;
            string prU = ((Label)gvDetallesCarrito.Rows[e.RowIndex].FindControl("lbl_Pu")).Text;

            ActualizarTablaSessionGV(e, nombre, cantidad, prPagar, prU);

            gvDetallesCarrito.EditIndex = -1;
            cargarGrid();
        }

        private void ActualizarTablaSessionGV(GridViewUpdateEventArgs e, string nombre, 
                                              string cantidad, string prPagar, string prU)
        {
            Juego _juego = new Juego();
            NegocioJuego _njuego = new NegocioJuego();
            DataTable dtSession = (DataTable)Session["carrito"];

            int cantidadKeysExistentes;

            float precioUnitario = float.Parse(prU);
            float precioPagar = float.Parse(prPagar);

            _juego = _njuego.cargarJuegoPorNombre((nombre));
            cantidadKeysExistentes = consultarCantidadKeys(_juego);

            if (int.Parse(cantidad) <= cantidadKeysExistentes)
            {
                dtSession.Rows[e.RowIndex][1] = cantidad;
                precioPagar = precioUnitario * int.Parse(cantidad);
            }
            else
            {
                dtSession.Rows[e.RowIndex][1] = cantidadKeysExistentes;
                precioPagar = precioUnitario * cantidadKeysExistentes;

                lbl_ErrorEditing.Visible = true;
                lbl_ErrorEditing.Text = $"Error interno al editar la cantidad de keys de {nombre}. " +
                    $"Solo te podemos dar ({cantidadKeysExistentes}).";
            }

            dtSession.Rows[e.RowIndex][3] = precioPagar.ToString();

        }

        private void cargarGrid()
        {
            gvDetallesCarrito.DataSource = (DataTable)Session["carrito"];
            gvDetallesCarrito.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dtSession = Session["carrito"] as DataTable;

            dtSession.Rows[e.RowIndex].Delete();

            Session["carrito"] = dtSession;

            cargarGrid();
        }
    }
}