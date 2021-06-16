using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;
namespace Negocio
{
    public class NegocioJuego
    {
        public bool NJ_AgregarJuego(Juego _Juego)
        {
            bool Agrego = false;
            string consulta = $"SELECT * FROM Juegos WHERE Nombre_J = '{_Juego.GetNombre()}' ";

            DaoJuego dao = new DaoJuego();

            if (!dao.ExisteJuego(_Juego,consulta))
            {
                Agrego = dao.AgregarJuego(_Juego);
            }

            return Agrego;
        }
    }
}
