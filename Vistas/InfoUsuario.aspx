<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoUsuario.aspx.cs" Inherits="WebApplication1.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
      <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="default-header">
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                   <li id="li_infoUsuario_iu" runat="server">
                        <asp:HyperLink ID="infoUsuario_hl_iu" runat="server" NavigateUrl="~/InfoUsuario.aspx" Visible="false">[infoUsuario_hl_iu]</asp:HyperLink>
                    </li>
                   <li>
                       <a href="Inicio.aspx">Inicio</a>
                   </li>
              
                   <li>
                       <a href="Contacto.aspx">Contacto</a>
                   </li>
                   <li>
                         <a href="Carrito.aspx" class="nav-menu__ul__carrito">
                            <i class="fas fa-shopping-cart"></i>
                            <p>Carrito</p>
                        </a>
                   </li>
             
                </ul>
            </nav>
          </header>
        <section class="pInfoUsuario">
            <h1>INFORMACION DEL USUARIO</h1>
            <p>Usuario :
                <asp:Label ID="lbl_user_IU" runat="server"></asp:Label>
                <asp:TextBox ID="txt_User_IU" runat="server" Visible="False"></asp:TextBox>
            </p>
            <div class="pInfoUsuario__content">
                <div class="pInfoUsuario__content__nombre">
                    <p>Nombres :
                    <asp:label runat="server" id="lblNombre_IU"></asp:label>
                        <asp:TextBox ID="txt_Nombre_IU" runat="server" MaxLength="40" Visible="False"></asp:TextBox>
                    </p>
                    <p>Apellidos :
                        <asp:Label ID="lblApellido_IU" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_Apellidos_IU" runat="server" MaxLength="40" Visible="False"></asp:TextBox>
                    </p>
                </div>
                <div class="pInfoUsuario__content__email">
                    <p>Email : <asp:label runat="server" id="lblEmail_IU"></asp:label>
                    </p>
                </div>
     
                <div class="pInfoUsuario__content__fechaIngreso">
                    <p>Telefono :
                        <asp:Label ID="lblTelefono_IU" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_telefono_IU" runat="server" MaxLength="30" Visible="False"></asp:TextBox>
                    </p>
                    <p>Fecha de Nacimiento :
                        <asp:Label ID="lblFecha_IU" runat="server"></asp:Label>
                    </p>
                    <p>
                        <asp:Button ID="btn_EditarPerfil" runat="server" OnClick="btn_EditarPerfil_Click" Text="Editar Datos" />
&nbsp;<asp:Button ID="btn_cancelar_IU" runat="server" OnClick="btn_cancelar_IU_Click" Text="Cancelar" Visible="False" />
&nbsp;<asp:Button ID="btn_guardar_IU" runat="server" OnClick="btn_guardar_IU_Click" Text="Guardar" Visible="False" />
                    </p>
                    <p>
                        <asp:Label ID="lbl_msg_IU" runat="server"></asp:Label>
                    </p>
                </div>
            </div>
        </section>
        <section class="pInfoUsuario__historial">
            <h1>HISTORIAL DE COMPRAS</h1>
            <div>
               <h4>GridView</h4>
            </div>
        </section>
    </form>
</body>
</html>
