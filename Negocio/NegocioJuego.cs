using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioJuego
    {
        DaoJuego dao = new DaoJuego();
        public bool NJ_AgregarJuego(Juego _Juego)
        {
            bool Agrego = false;
            string consulta = $"SELECT * FROM Juegos WHERE Nombre_J = '{_Juego.GetNombre()}' ";

            

            if (!dao.ExisteJuego(consulta))
            {
                Agrego = dao.AgregarJuego(_Juego);
            }

            return Agrego;
        }
        //Llama a DaoJuego y lista todos los juegos
        public DataTable NJ_ListarJuego()
        {
            DataTable dt = new DataTable();

            dt = dao.ListarJuegos();
            return dt;
        }
        //Llama a DaoJuego y elimina Juego por ID 
        public bool NJ_EliminarJuego(string Cod_J)
        {
            Juego _juego = new Juego();
            _juego.SetCodigo(Cod_J);

            return dao.EliminarJuego(_juego); //Devolveria true si lo borro
            
        }

        public DataTable NJ_BuscarJuego_Key(string codigo)
        {
            DataTable tabla_key = new DataTable();
            DataColumn columna = new DataColumn("Nombre", System.Type.GetType("System.String"));
            tabla_key.Columns.Add("Nombre");

            columna = new DataColumn("Cantidad", System.Type.GetType("System.String"));
            tabla_key.Columns.Add("Cantidad");

            DataRow dr = tabla_key.NewRow();

            string consulta = $"SELECT * FROM juegos WHERE Codigo_J  = '{codigo}' ";
            if (dao.ExisteJuego(consulta)) {

                Juego _juego = new Juego();
                _juego.SetCodigo(codigo);
                _juego = dao.getJuego(_juego);

                dr["Nombre"] = _juego.GetNombre();
                dr["Cantidad"] = dao.Obtener_CantKey(codigo);
                 
            }
            else  //sino manda esto valores a la tabla
            {
                dr["Nombre"] = "--";
                dr["Cantidad"] = "--";
               
            }
            tabla_key.Rows.Add(dr);
            return tabla_key;
        }
    }
}
