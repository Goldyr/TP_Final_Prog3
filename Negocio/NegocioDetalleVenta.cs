using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

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
    }
}
