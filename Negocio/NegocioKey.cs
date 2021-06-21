using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioKey
    {
        DaoKey dao = new DaoKey();

        public bool NK_AgregarKey(Key _key)
        {
            bool Agrego = false;
            string consulta = $"Select * from keys where Serie_K = '{_key.GetSerial()}'";
            if (!dao.existekey(consulta))
            {
                Agrego = dao.AgregarKey(_key);
            }
            return Agrego;
        }


    }
}
