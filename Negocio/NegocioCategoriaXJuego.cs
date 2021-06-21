using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioCategoriaXJuego
    {
        DaoCategoriaxJuego dao = new DaoCategoriaxJuego();

        public bool AgregarCategoriasxJuego(CategoriaxJuego categoriaxJuego)
        {
            //TODO: Preguntar si el juego tiene el estado en true

            string consultaExiste = $"SELECT * FROM CategoriasXJuegos WHERE CodigoCat_CxJ = '{categoriaxJuego.CodigoCat}' " +
                                    $"AND CodigoJuego_CxJ = '{categoriaxJuego.CodigoJuego}'";

            if (!dao.ExisteCategoria(consultaExiste))
            {
                return dao.AgregarCategoriaxJuego(categoriaxJuego);
            }

            return false;
        }
    }
}
