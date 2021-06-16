using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Distribuidora
    {
        //Parametros
        private string codigo;
        private string nombre;

        //Constructores
        public Distribuidora() { }

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
