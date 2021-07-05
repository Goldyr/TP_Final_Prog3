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
        private Usuario user = new Usuario();
        private MetodoXUsuario metodosUsuario = new MetodoXUsuario();
        private NegocioDetalleVenta negDV = new NegocioDetalleVenta();

        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioUsuario negUser = new NegocioUsuario();


            // Inicio de sesion de usuario

            if (Request.Cookies["IDUsuario"] != null)
            {
                user.SetId(this.Request.Cookies["IDUsuario"].Value);
                negUser.CargarUsuarioPorID(user);
                ddlCargarMxU();
            }

            ActualizarCss();

            // Gridview y carrito

            if (!IsPostBack)
            {
                if (Session["carrito"] != null)
                {

                    cargarGrid();
                    organizarGrid();
                    MontoTotal();
                }

                cargarGrid();
            }

        }

        // FUNCION QUE SE USA PARA ORGANIZAR EL GRIDVIEW Y CONTROLAR QUE
        // LAS CANTIDADES DE KEYS NO SUPEREN A LAS QUE TENEMOS
        // CARGADAS. 


        private void ActualizarCss()
        {
            if(user.GetId() != null)
            {
                infoUsuario_hl.Text = user.GetUser();
                li_infoUsuario.Style["display"] = "block";
            }
            else
            {
                li_infoUsuario.Style["display"] = "none";
            }

            if (user.GetId() != null)
            {
                lblInicioSesionCompra.Style["display"] = "none";
                wrapperCompra.Style["display"] = "flex";
            }
            else
            {
                lblInicioSesionCompra.Style["display"] = "block";
                wrapperCompra.Style["display"] = "none";
            }
                
        }

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

        private void MontoTotal()
        {
            float suma = 0;
            foreach (GridViewRow row in gvDetallesCarrito.Rows)
            {

                Label PrTotal = row.Cells[3].FindControl("lbl_Prpagar") as Label;
                float prpagar = float.Parse(PrTotal.Text);
                suma += prpagar;
            }
            lblMonto.Text = suma.ToString();
        }

        private void cargarGrid()
        {
            if(Session["carrito"] != null)
            {
                gvDetallesCarrito.DataSource = (DataTable)Session["carrito"];
                gvDetallesCarrito.DataBind();
                MontoTotal();
            }
            else
            {
                gvDetallesCarrito.DataSource = null;
                gvDetallesCarrito.DataBind();
            }
           
        }


      

        private void LimpiarSession()
        {
            Session["carrito"] = null;
            cargarGrid();
        }


     
        private void CrearVenta(string nroTarjeta)
        {
            //definicion variables
            Ventas vta = new Ventas();
            NegocioVentas NegVta = new NegocioVentas();

            // Creo la venta
            vta.SetIDUsuario(user);

            string fecha = DateTime.Now.ToString("MM/dd/yyyy");

            vta.SetFechaVenta(fecha);
            vta.SetNroTarjeta(nroTarjeta);

            NegVta.NV_GuardarVentas(vta);
            // Creo el detalle
 
            CrearDetalleVenta(vta);
        }

        private bool CrearMetodoxUsuario(MetodoXUsuario MetxUsuario)
        {
            NegocioMetodoXUsuario negMxU = new NegocioMetodoXUsuario();
            return negMxU.NU_AgregarMetodo(MetxUsuario);
        }


        private void CrearDetalleVenta(Ventas vta)
        {
            NegocioDetalleVenta NegDVta = new NegocioDetalleVenta();
            NegocioJuego NegJuego = new NegocioJuego();

            DetalleVenta detalleVenta;
            Juego juego;

            //TODO: Ver como hacer un mensaje si se cargo correctamente

            foreach (GridViewRow row in gvDetallesCarrito.Rows)
            {
                juego = new Juego();
                detalleVenta = new DetalleVenta();

                Label lblJuego = row.Cells[0].FindControl("lbl_Juego") as Label;
                string nombreJuego = lblJuego.Text;

                juego = NegJuego.cargarJuegoPorNombre(nombreJuego);
                detalleVenta.setCodJuego(juego);
                detalleVenta.setIdVenta(vta);

                NegDVta.NV_GuardarDetalleVenta(detalleVenta); // if bla bla bla
            }



        }

        protected void cargarMetodoxUsuario(MetodoXUsuario MXU)
        {
            MXU.SetApellidos(txt_apellidos.Text.Trim());
            MXU.SetNombres(txt_Nombres.Text.Trim());
            MXU.SetEmail(txt_email.Text.Trim());
            MXU.SetTelefono(txt_telefono.Text.Trim());
            MXU.SetnroTarjeta(txt_tarjeta.Text.Trim());
            MXU.SetDni(txt_dni.Text.Trim());
            MXU.SetDireccion(txt_direccion.Text.Trim());
            MXU.SetCodigoPostal(txt_CP.Text.Trim());
            MXU.SetClave(txt_clave.Text.Trim());
            MXU.SetFecha(txt_fecha.Text.Trim());
            MXU.SetIdUsuario(user);
        }

        private void limpiarTextBox()
        {
            txt_apellidos.Text = txt_clave.Text = txt_CP.Text = txt_direccion.Text = txt_dni.Text = txt_email.Text =
                txt_fecha.Text = txt_Nombres.Text = txt_tarjeta.Text = txt_telefono.Text = "";
        }
        // ==================================
        // DDL

        protected void ddlCargarMxU()
        {

            NegocioMetodoXUsuario NegMxU = new NegocioMetodoXUsuario();
            NegMxU.NU_CargarddlMetodosUsuarios(user, ddl_MetxUsuario);

            if(ddl_MetxUsuario.Items.Count > 0)
            {
                string sTarjeta = ddl_MetxUsuario.SelectedValue;
                lblTarjetaUsuario.Text = $"TARJETA TERMINADA EN ***{sTarjeta.Substring(sTarjeta.Length - 3)}";
            }
        

        }

        protected void txt_tarjeta_TextChanged(object sender, EventArgs e)
        {

            if (txt_tarjeta.Text.StartsWith("4"))
            {
                lbl_tipo.Text = "Visa";
            }
            else if (txt_tarjeta.Text.StartsWith("5"))
            {
                lbl_tipo.Text = "MasterCard";
            }
        }

        // =============================================
        // EVENTOS GRIDVIEW


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dtSession = Session["carrito"] as DataTable;

            dtSession.Rows[e.RowIndex].Delete();

            Session["carrito"] = dtSession;

            cargarGrid();
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

        protected void Btn_AgregarMP(object sender, EventArgs e)
        {
            MetodoPago MPago = new MetodoPago();
            MetodoXUsuario MetxUsuario = new MetodoXUsuario();

            if (user.GetId() != null)
            {
                //AVERIGUO  

                if (txt_tarjeta.Text.StartsWith("4")) MPago.Id = "MET1";

                else if (txt_tarjeta.Text.StartsWith("5")) MPago.Id = "MET2";

                cargarMetodoxUsuario(MetxUsuario);

                MetxUsuario.SetIdMP(MPago);

                //CREO LA VENTA Y EL DETALLE

                if (CrearMetodoxUsuario(MetxUsuario))
                {
                    lbl_confirmacionAgregarMP.Text = "El método se agrego correctamente";
                    limpiarTextBox();
                }
                else lbl_confirmacionAgregarMP.Text = "Error al agregar el método";
            }

            ddlCargarMxU();
        }

        protected void Btn_comprar_Click(object sender, EventArgs e)
        {
            if (user.GetId() != null && Session["carrito"] != null)
            {
                string nroTarjetaSeleccionado = ddl_MetxUsuario.SelectedValue;

                CrearVenta(nroTarjetaSeleccionado);
                LimpiarSession();
                VerCompra.Style["display"] = "block";
            }

        }

        protected void ddl_MetxUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sTarjeta = ddl_MetxUsuario.SelectedValue;
            lblTarjetaUsuario.Text = $"TARJETA TERMINADA EN ***{sTarjeta.Substring(sTarjeta.Length - 3)}";
        }
    }
}