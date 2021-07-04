using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class MetodoPago
    {
        string id;
        string nombre;
        bool estado;

        public MetodoPago() {; }

        public string Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
