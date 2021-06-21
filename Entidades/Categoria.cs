using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        //Parametros
        private string nombre;
        private string codigo;

        //Constructores
        public Categoria()
        {
            nombre = codigo = "";
        }


        //Set & Get
        public string Codigo
        {
            set { codigo = value; }
            get { return codigo; }
        }
        public string Nombre
        {
            set { nombre = value; }
            get { return nombre; }
        }
    }
}
