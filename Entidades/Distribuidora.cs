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
        private int id_Dis;
        private string nombre_Dis;

        //Constructores
        public Distribuidora() { }

        //Set & Get
        public int ID
        {
            set { id_Dis = value; }
            get { return id_Dis; }
        }
        public string Nombre
        {
            set { nombre_Dis = value; }
            get { return nombre_Dis; }
        }
    }
}
