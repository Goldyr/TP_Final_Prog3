using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace Dao
{
    public class DaoVentas
    {
        AccesoDatos datos = new AccesoDatos();
            public DataTable ListarVentas(string _Codigo)
        {
            DataTable dt = new DataTable();
            
            string consulta = "SELECT ID_V as [N°Venta], MP.Nombre_MP as [Metodo de Pago], Fecha_V as [Fecha De Compra], PrecioTotal_V as [Precio Total] " +
                              "FROM Ventas " +
                              "INNER JOIN Metodos_Pago MP ON MP.ID_MP = Ventas.ID_MetodoPago_V " +
                              $"WHERE Ventas.ID_Usuario_V = '{_Codigo}'";

            dt = datos.ObtenerTabla("Ventas", consulta);
            return dt;
        }

        public bool AgregarVenta(Ventas _Ventas)
        {

            SqlCommand Comando = new SqlCommand();
            ArmarParametrosAgregarVentas(ref Comando, _Ventas);
            int filas = datos.EjecutarProcedimientoAlmacenado(Comando, "sp_Agregar_Ventas");
            if (filas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        private void ArmarParametrosAgregarVentas(ref SqlCommand Comando, Ventas _Ventas)
        {
            SqlParameter SqlParametros = new SqlParameter();

            //id usuario
            SqlParametros = Comando.Parameters.Add("@id_usuario", SqlDbType.Char, 10);
            SqlParametros.Value = _Ventas.GetIDUsuario();
            //id metodo
            SqlParametros = Comando.Parameters.Add("@nro_tarjeta", SqlDbType.VarChar, 16);
            SqlParametros.Value = _Ventas.GetNroTarjeta();
            
            //fecha
            SqlParametros = Comando.Parameters.Add("@fecha", SqlDbType.Date);
            try
            {
                DateTime date = DateTime.ParseExact(_Ventas.GetFechaVenta(), "MM/dd/yyyy", new CultureInfo("en-US"));
                SqlParametros.Value = date;
            }
            catch(FormatException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }


        }

        public DataTable TotalVenta(string consulta)
        {
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla("TOTAL", consulta);
            return dt;
        }
    }
}
