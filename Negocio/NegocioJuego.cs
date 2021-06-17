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

        public DataTable NJ_BuscarJuego_Key(Key _Key)
        {
            string consulta = $"SELECT * FROM Keys WHERE CodigoJuego_K  = '{_Key.GetCodJuego()}' ";

            if (dao.ExisteJuego(consulta))  //si el codigo ingresado existe en la tabla keys, obtiene la cantidad de keys
            {
                DataTable tabla_key = dao.Obtener_CantKey(_Key);
                return tabla_key;
            }
            else  //sino crea esta tabla que tiene "valores nulos" para demostrar q no existe
            {
                DataTable tabla_nula = new DataTable();
                DataColumn columna = new DataColumn("vacio", System.Type.GetType("System.String"));
                tabla_nula.Columns.Add("vacio");

                columna = new DataColumn("vacio2", System.Type.GetType("System.String"));
                tabla_nula.Columns.Add("vacio2");

                DataRow dr = tabla_nula.NewRow();
                dr["vacio"] = "--";
                dr["vacio2"] = "--";
                tabla_nula.Rows.Add(dr);

                return tabla_nula;
            }
        }
    }
}
