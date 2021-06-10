<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DescripcionJuego.aspx.cs" Inherits="WebApplication1.WebForm3" %>

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
&nbsp;&nbsp;&nbsp;
            <div>
                <div class="descripcion">
            <img alt="Precomprar Dying Light 2 Stay Human en Steam" src="https://cdn.cloudflare.steamstatic.com/steam/apps/534380/capsule_616x353.jpg?t=1622226446" /><br /> <p>Dying Light 2 es un juego de acción en primera persona del género survival horror, secuela de su antecesora situado 15 años después, protagonizado por un nuevo personaje llamado Aiden Caldwell. Será lanzado el 7 de diciembre de 2021</p>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Añadir al Carro" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $3200</div>
            </div>
            <br />
            Esta seccion se llega cuando el usuario hace click sobre un juego, va a contener una imagen del juego, la descripcion y el monto</div>
    </form>
</body>
</html>
