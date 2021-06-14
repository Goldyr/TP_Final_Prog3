using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Juego
    {
        //Parametros
        private int id_J;
        private string nombre_J;
        private int idDes_J;
        private int id_Dis_J;
        private int precio_J;
        private int descuento_J;

        //Constructores
        public Juego() { }

        //Set & Get
        public int ID
        {
            set { id_J = value; }
            get { return id_J; }
        }
        public string Nombre
        {
            set { nombre_J = value; }
            get { return nombre_J; }
        }
        public int ID_Desarrolladora
        {
            set { idDes_J = value; }
            get { return idDes_J; }
        }
        public int ID_Distribuidora
        {
            set { id_Dis_J = value; }
            get { return id_Dis_J; }
        }
        public int Precio
        {
            set { precio_J = value; }
            get { return precio_J; }
        }
        public int Descuento
        {
            set { descuento_J = value; }
            get { return descuento_J; }
        }
    }
}
