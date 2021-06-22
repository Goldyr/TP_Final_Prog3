<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoUsuario.aspx.cs" Inherits="WebApplication1.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header class="main-header">
            <nav class="main-header__nav-menu">
                <ul class="nav-menu">
                   <li>
                       <a href="Inicio.aspx">Inicio</a>
                   </li>
                   <li>
                       <a href="InfoUsuario.aspx">Info.Usuario</a>
                   </li>
                   <li>
                       <a href="Contacto.aspx">Contacto</a>
                   </li>
                   <li>
                       <a href="Carrito.aspx">Carrito</a>
                   </li>
                   <li>
                        <a href="Registrarse.aspx">Registrarse</a>
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
