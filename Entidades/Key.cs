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
        private string Serial;
        private Juego CodJuego = new Juego(); 
        private bool Estado;

        //Constructores
        public Key() { }

        //Set & Get

        public void SetSerial(string _Serial) { Serial = _Serial; }
        public void SetCodJuego(string _CodJuego) { CodJuego.SetCodigo(_CodJuego); }
        public void SetEstado(bool _Estado) { Estado = _Estado; }

        public string GetSerial() { return this.Serial; }
        public string GetCodJuego() { return this.CodJuego.GetCodigo(); }
        public bool GetEstado() { return this.Estado; }
    }
}
