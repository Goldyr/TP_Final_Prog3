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
        private string codigo;
        private string nombre;

        //Constructores
        public Desarrolladora() { }

        //Set & Get
        
        public void SetCodigo(string _Codigo) { codigo = _Codigo; }
        public void SetNombre(string _Nombre) { nombre = _Nombre; }

        public string GetCodigo() { return codigo; }
        public string GetNombre () { return nombre; }
        
    }

}
