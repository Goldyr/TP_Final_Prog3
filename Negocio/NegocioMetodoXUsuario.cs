using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioMetodoXUsuario
    {
        DaoMetodoXUsuario dao = new DaoMetodoXUsuario();

        public bool NU_AgregarMetodo(MetodoXUsuario _metodo)
        {
            string consulta = $"select ID_MP_MxU, ID_Usuario_MxU, Nro_Tarjeta_MxU, Email_MxU, Clave_Seguridad_MxU, Fecha_Vencimiento_MxU, DNI_MxU, Nombres_MxU, Apellidos_MxU, Estado_MxU, Telefono_MxU, CodigoPostal_MxU, Direccion_MxU  from MetodosxUsuarios where ID_MP_MxU = '{_metodo.GetIdMP()}' and ID_Usuario_MxU= '{_metodo.GetIdUsuario()}'";
            if (!dao.existeMetodo(consulta))
            {
                dao.Agregar_metodo(_metodo);
                return true;
            }
            return false;

        }

    }
}
