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
    }
}
