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
        private string codigo;
        private string nombre;
        private string codigoDes;
        private string codigoDis;
        private float pu;
        private float descuento;

        //Constructores
        public Juego() { }

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
        public string CodigoDes
        {
            set { codigoDes = value; }
            get { return codigoDes; }
        }
        public string CodigoDis
        {
            set { codigoDis = value; }
            get { return codigoDis; }
        }
        public float PU
        {
            set { pu = value; }
            get { return pu; }
        }
        public float Descuento
        {
            set { descuento = value; }
            get { return descuento; }
        }
    }
}
