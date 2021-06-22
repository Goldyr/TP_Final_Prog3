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
        DaoJuego dao_juego = new DaoJuego();

        public bool NK_AgregarKey(Key _key)
        {
            string consulta2 = $"Select * from Juegos WHERE Codigo_J = '{_key.GetCodJuego()}' ";
            bool Agrego = false;

            if (dao_juego.ExisteJuego(consulta2) == true){   //pregunta si existe el juego mediante el codigo de juego q ingreso
                
                string consulta = $"Select * from keys where Serie_K = '{_key.GetSerial()}'";
                if (!dao.existekey(consulta))   
                {
                    Agrego = dao.AgregarKey(_key);
                }
            }
            
            return Agrego;
        }


    }
}
