using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Key
    {
        //Parametros
        private string serial;
        private string codJuego;
        private bool estado;

        //Constructores
        public Key() { }

        //Set & Get
        public string Serial
        {
            set { serial = value; }
            get { return serial; }
        }
        public string CodJuego
        {
            set { codJuego = value; }
            get { return codJuego; }
        }
        public bool Estado
        {
            set { estado = value; }
            get { return estado; }
        }
    }
}
