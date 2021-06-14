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
        private int serial_K;
        private int id_Juego_K;
        private bool estado_K;

        //Constructores
        public Key() { }

        //Set & Get
        public int Serial
        {
            set { serial_K = value; }
            get { return serial_K; }
        }
        public int ID_Juego
        {
            set { id_Juego_K = value; }
            get { return id_Juego_K; }
        }
        public bool Estado
        {
            set { estado_K = value; }
            get { return estado_K; }
        }
    }
}
