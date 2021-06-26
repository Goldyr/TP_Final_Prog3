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
            <h4>Se accede a esta seccion desde "Info.Usuario" en Inicio</h4>
            <div class="pInfoUsuario__content">
                <div class="pInfoUsuario__content__nombre">
                    <p>Nombre</p>
                    <asp:label runat="server" id="lblNombre_IU"></asp:label>
                </div>
                <div class="pInfoUsuario__content__email">
                    <p>Email</p>
                    <asp:label runat="server" id="lblEmail_IU"></asp:label>
                </div>
     
                <div class="pInfoUsuario__content__fechaIngreso">
                    <p>Nombre</p>
                    <asp:label runat="server" id="lblFIngreso_IU"></asp:label>
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
