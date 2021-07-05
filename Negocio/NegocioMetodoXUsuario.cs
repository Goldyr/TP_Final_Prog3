using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;
using System.Web.UI.WebControls;

namespace Negocio
{
    public class NegocioMetodoXUsuario
    {
        DaoMetodoXUsuario dao = new DaoMetodoXUsuario();

        public bool NU_AgregarMetodo(MetodoXUsuario _metodo)
        {
            string consulta = $"select ID_MP_MxU, ID_Usuario_MxU, Nro_Tarjeta_MxU, Email_MxU, Clave_Seguridad_MxU, " +
                $"Fecha_Vencimiento_MxU, DNI_MxU, Nombres_MxU, Apellidos_MxU, Estado_MxU, Telefono_MxU, CodigoPostal_MxU, " +
                $"Direccion_MxU from MetodosxUsuarios where Nro_Tarjeta_MxU = '{_metodo.GetnroTarjeta()}'";
            if (!dao.existeMetodo(consulta))
            {
                dao.Agregar_metodo(_metodo);
                return true;
            }
            return false;

        }

        public void NU_CargarddlMetodosUsuarios(Usuario user, DropDownList ddl)
        {
   
            DataTable dt = new DataTable();

            string consulta = $"SELECT Nro_Tarjeta_MxU, MP.Nombre_MP FROM MetodosxUsuarios " +
                $"INNER JOIN Metodos_Pago AS MP ON MP.ID_MP = MetodosxUsuarios.ID_MP_MxU " +
                $"WHERE MetodosxUsuarios.ID_Usuario_MxU = '{user.GetId()}' AND MetodosxUsuarios.Estado_MxU = 1";

            dt = dao.ListarMetodos(consulta);

            ddl.DataSource = dt;
            ddl.DataTextField = "Nombre_MP";
            ddl.DataValueField = "Nro_Tarjeta_MxU";
            ddl.DataBind();

        }


    }
}
