using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Dao
{
    public class DaoDetalleVenta
    {
        AccesoDatos datos = new AccesoDatos();

        public bool AgregarDetalleVenta(DetalleVenta _DVenta)
        {

            SqlCommand Comando = new SqlCommand();
            ArmarParametrosAgregarDetalleVenta(ref Comando, _DVenta);
            int filas = datos.EjecutarProcedimientoAlmacenado(Comando, "sp_Agregar_DetalleVentas");
            if (filas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void ArmarParametrosAgregarDetalleVenta(ref SqlCommand Comando, DetalleVenta _DVenta)
        {
            SqlParameter SqlParametros = new SqlParameter();

            //id usuario
            SqlParametros = Comando.Parameters.Add("@codjuego", SqlDbType.Char, 10);
            SqlParametros.Value = _DVenta.getCodJuego();

        }

        public DataTable getDetalles(string consulta) {
           
            DataTable dt = datos.ObtenerTabla("Detalles_venta", consulta);
            return dt;

        }

    }
}
