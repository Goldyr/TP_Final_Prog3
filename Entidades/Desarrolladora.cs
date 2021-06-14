using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class Desarrolladora
    {
        //Parametros
        private int id_Des;
        private string nombre_Des;

        //Constructores
        public Desarrolladora() { }

        //Set & Get
        public int ID
        {
            set { id_Des = value; }
            get { return id_Des; }
        }
        public string Nombre
        {
            set { nombre_Des = value; }
            get { return nombre_Des; }
        }
    }

}
