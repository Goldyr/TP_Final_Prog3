using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Dao
{
    public class DaoVentas
    {
        AccesoDatos datos = new AccesoDatos();
            public DataTable ListarVentas(string _Codigo)
        {
            DataTable dt = new DataTable();
            
            string consulta = $"SELECT ID_V as [N°Venta],Metodos_Pago.Nombre_MP as [Metodo de Pago], Fecha_V as [Fecha De Compra], PrecioTotal_V as [Precio Total] FROM Ventas " + 
            $"inner join MetodosxUsuarios " +
            $"on ID_Usuario_MxU = ID_Usuario_V " +
            $"inner join Metodos_Pago " +
            $"on ID_MP_MxU = ID_MP " +
            $"where ID_Usuario_V = '{ _Codigo}' ";

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
            SqlParametros.Value = _Ventas.GetFechaVenta();
        }

        public DataTable TotalVenta(string consulta)
        {
            DataTable dt = new DataTable();
            dt = datos.ObtenerTabla("TOTAL", consulta);
            return dt;
        }
    }
}
