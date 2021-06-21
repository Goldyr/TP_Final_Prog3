using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;
namespace Negocio
{
    public class NegocioDes
    {
        DaoDes dao = new DaoDes();
        public bool NDe_AgregarDes(Desarrolladora _Des)
        {
            bool Agrego = false;
            string consultaDes = $"SELECT * FROM Desarrolladores WHERE Nombre_Des = '{_Des.GetNombre()}' ";

            if (!dao.ExisteDes(consultaDes))
            {
                Agrego = dao.AgregarDes(_Des);
            }

            return Agrego;
        }
    }
}
