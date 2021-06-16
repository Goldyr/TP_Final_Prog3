using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Desarrolladora
    {
        //Parametros
        private int codigo;
        private string nombre;

        //Constructores
        public Desarrolladora() { }

        //Set & Get
        public int Codigo
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
