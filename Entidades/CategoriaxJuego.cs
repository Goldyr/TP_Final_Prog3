using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class CategoriaxJuego
    {

        Categoria codigoCat;
        Juego codigoJuego;


        public string CodigoCat { get => codigoCat.Codigo; set => codigoCat.Codigo = value; }
        public string CodigoJuego { get => codigoJuego.GetCodigo(); set => codigoJuego.SetCodigo(value); }

    }
}
