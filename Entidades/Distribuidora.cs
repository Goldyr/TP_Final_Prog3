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
        private bool estado;

        //Constructores
        public Distribuidora() { }

        //Set & Get
        public void SetCodigo(string _Codigo) { codigo = _Codigo; }
        public void SetNombre(string _Nombre) { nombre = _Nombre; }
        public void SetEstado(bool _Estado) { estado = _Estado; }
        public string GetCodigo() { return codigo; }
        public string GetNombre() { return nombre; }
        public bool GetEstado() { return estado;}
    }
}
