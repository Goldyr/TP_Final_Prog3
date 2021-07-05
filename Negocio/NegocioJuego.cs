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
        DaoKey dao_key = new DaoKey();

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

        public DataTable NJ_ListarJuegoXcategoria(string consulta_comp)
        {
            string consulta = $"SELECT  Nombre_J, Codigo_J, PU_J, CodigoDes_J, CodigoDis_J, Descuento_J, Fecha_Lanzamiento_J, Estado_J, Descripcion_J, Imagen_J FROM Juegos where Estado_J = 1 ";
            consulta += consulta_comp;
            DataTable dt = new DataTable();
            dt = dao.ListarJuegosGeneral(consulta);

            return dt;
        }

        public bool NJ_existejuego(string codjuego)
        {
            string consulta = $"SELECT * FROM Juegos WHERE Codigo_J = '{codjuego}' ";
            if (dao.ExisteJuego(consulta))
            {
                return true;
            }
            else return false;
        }

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

            string consultaExiste = $"SELECT * FROM juegos WHERE Codigo_J  = '{codigo}' ";
            if (dao.ExisteJuego(consultaExiste)) {

                Juego _juego = new Juego();

                _juego.SetCodigo(codigo);

                string consulta = $"SELECT * FROM Juegos where Codigo_J = '{_juego.GetCodigo()}'";
            
                _juego = dao.getJuego(_juego, consulta);

                dr["Nombre"] = _juego.GetNombre();
                dr["Cantidad"] = dao_key.Obtener_CantKey(codigo);
                 
            }
            else  //sino manda esto valores a la tabla
            {
                dr["Nombre"] = "--";
                dr["Cantidad"] = "--";
               
            }
            tabla_key.Rows.Add(dr);
            return tabla_key;
        }
        //Llama a dao para que modifique el juego

        public Juego NJ_ObtenerUltimoJuego()
        {
            Juego juego = new Juego();

            string consulta = $"SELECT TOP 1 * FROM Juegos ORDER BY Codigo_J DESC";

            juego = dao.getJuego(juego, consulta);

            return juego;
        }

        public bool NJ_ModificarJuego(Juego juego_upd)
        {
            return dao.ModificarJuego(juego_upd);
        }

        public DataTable NJ_ListarJuegos_True()
        {
            DataTable dt = new DataTable();
            dt = dao.ListarJuegos(true);
            return dt;
        }
        
        public DataTable NJ_ListarJuegos_Nombre(string nombre)
        {
            DataTable dt = new DataTable();
            dt = dao.ListarJuegosPorNombre(nombre);
            return dt;
        }

        public DataTable NJ_ListarJuegos_Precio(int num)
        {
            string consulta = null;
            switch (num)
            {
                case 1:
                    consulta = $"SELECT [Nombre_J], [PU_J], [CodigoDes_J], [CodigoDis_J], [Descuento_J], [Descripcion_J], [Fecha_Lanzamiento_J], [Imagen_J] FROM [Juegos] WHERE[Estado_J] = 1 AND[PU_J] <= 10 ORDER BY [PU_J] ASC";
                    break;
                case 2:
                    consulta = $"SELECT[Nombre_J], [PU_J], [CodigoDes_J], [CodigoDis_J], [Descuento_J], [Descripcion_J], [Fecha_Lanzamiento_J], [Imagen_J] FROM[Juegos] WHERE[Estado_J] = 1 AND[PU_J] >= 10 AND[PU_J] <= 20 ORDER BY [PU_J] ASC";
                    break;
                case 3:
                    consulta = $"SELECT[Nombre_J], [PU_J], [CodigoDes_J], [CodigoDis_J], [Descuento_J], [Descripcion_J], [Fecha_Lanzamiento_J], [Imagen_J] FROM[Juegos] WHERE[Estado_J] = 1 AND[PU_J] >= 20 AND[PU_J] <= 50 ORDER BY [PU_J] ASC";
                    break;
                case 0:
                    break;
            }
            return dao.ListarJuegosGeneral(consulta);
        }

        public Juego cargarJuego(string id)
        {
            Juego juego = new Juego();
            string consulta = $"SELECT * FROM Juegos WHERE Codigo_J = '{id}'";
            dao.getJuego(juego, consulta);

            return juego;
        }

        public Juego cargarJuegoPorNombre(string nombre)
        {
            Juego juego = new Juego();
            string consulta = $"SELECT * FROM Juegos WHERE Nombre_J = '{nombre}'";
            dao.getJuego(juego, consulta);

            return juego;
        }

        public DataTable PrecioPromedio()
        {
            return dao.PrecioPromedio();
        }

        public DataTable TopSeller()
        {
            return dao.TopSeller();
        }

      
    }
}
