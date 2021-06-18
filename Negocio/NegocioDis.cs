using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;
namespace Negocio
{
    public class NegocioDis
    {
        DaoDis dao = new DaoDis();
        public bool NDi_AgregarDis(Distribuidora _Dis)
        {
            bool Agrego = false;

           string consultaDis = $"SELECT * FROM Distribuidoras WHERE Nombre_Dis = '{_Dis.GetNombre()}' ";

            if (!dao.ExisteDis(consultaDis))
            {
                Agrego = dao.AgregarDis(_Dis);
            }

            return Agrego;
        }
    }
}
