using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Dao
{
    public class DaoCategoriaxJuego
    {
        AccesoDatos ad = new AccesoDatos();

        public bool ExisteCategoriaXJuego(string Consulta)
        {
            return ad.existe(Consulta);
        }

        public bool AgregarCategoriaxJuego(CategoriaxJuego categoriaxJuego)
        {
            SqlCommand Comando = new SqlCommand();
            ArmarParametrosAgregarCategoriaxJuego(ref Comando, categoriaxJuego);

            int filasAfectadas = ad.EjecutarProcedimientoAlmacenado(Comando, "spAgregar_CategoriaxJuego");
            System.Diagnostics.Debug.WriteLine(filasAfectadas);

            if (filasAfectadas == 1) return true;
            else return false;
           
           
        }

        //public DataTable ListarCategorias(string consulta)
        //{
        //    DataTable dt = new DataTable();
        //    dt = ad.ObtenerTabla("Categorias", consulta);
        //
        //    return dt;
        //}

        public CategoriaxJuego GetCategoriaxJuego(CategoriaxJuego categoriaxJuego, string consulta)
        {
            DataTable dt = ad.ObtenerTabla("CategoriasXJuegos", consulta);

            categoriaxJuego.CodigoCat = dt.Rows[0][0].ToString();
            categoriaxJuego.CodigoJuego = dt.Rows[0][1].ToString();

            return categoriaxJuego;
        }

        private void ArmarParametrosAgregarCategoriaxJuego(ref SqlCommand Comando, CategoriaxJuego categoriaxJuego)
        {
            SqlParameter SqlParametros = new SqlParameter();
            //NOMBRE
            SqlParametros = Comando.Parameters.Add("@CodigoCat", SqlDbType.Char, 10);
            SqlParametros.Value = categoriaxJuego.CodigoCat;
            //CODIGO
            SqlParametros = Comando.Parameters.Add("@CodigoJue", SqlDbType.Char, 10);
            SqlParametros.Value = categoriaxJuego.CodigoJuego;
        }
    }
}
