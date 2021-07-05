using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;
using System.Data.SqlClient;

namespace Negocio
{
    public class NegocioDetalleVenta
    {
        private DaoDetalleVenta Dao = new DaoDetalleVenta();

        public bool NV_GuardarDetalleVenta(DetalleVenta _dventa)
        {
            if (Dao.AgregarDetalleVenta(_dventa))
            {
                return true;
            }

            return false;
        }

        public DataTable BuscarSerials(string id)
        {
            string consulta = $"select Nombre_J, SerieKey_DV from DetalleVentas inner join juegos on CodJuego_DV = Codigo_J where ID_Venta_DV='{id}' ";
            return Dao.getDetalles(consulta);

        }
    }
}
