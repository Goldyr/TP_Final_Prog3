<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BMLJuegos.aspx.cs" Inherits="WebApplication1.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css" />
</head>
<body>
    <ul class="menu">
        <li><a href="Inicio.aspx">Inicio</a></li>
        <li><a href="InfoUsuario.aspx">Info.Usuario</a></li>
        <li><a href="Contacto.aspx">Contacto</a></li>
        <li><a href="Carrito.aspx">Carrito</a></li>
        <li><a href="Registrarse.aspx">Registrarse</a></li>
    </ul>
    <form id="form1" runat="server">
        <div>
            EDITAR/ELIMINAR<br />
            <br />
            Va a haber un GridView va a mostrar el catalogo de juegos en el cual se pueda editar y eliminar<br />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server">Formulario para editar/eliminar/agregar juegos</asp:HyperLink>
            <br />
            Esta seccion se accede desde el HyperLink EDITAR/ELIMINAR ubicado en OPCIONES DE ADMINISTRADOR</div>
    </form>
</body>
</html>
