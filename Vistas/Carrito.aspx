<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApplication1.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="Estilos.css" />
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
        <div>
            <br />
            <br />
            <div class="compra">
            <asp:Label ID="Label1" runat="server" Text="LabelJuego"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="Label2" runat="server" Text="LabelJuego2"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="LabelJuego3"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Ingrese numero tarjeta"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Comprar" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label7" runat="server" Text="Monto a pagar"></asp:Label>

            </div>
            <br />
            <br />
            <br />
            Luego de comprar<br />
            <br />
            <div class="detalles_compra">
            DETALLES DE COMPRA<br />
            Monto<br />
            Juegos<br />
            Fecha<br />
            Numero de factura<br />
            Keys
            </div> 
            <br />
            <br />
            <br />
            <br />
            Se accede a esta seccion cuando se hace click sobre &quot;Carrito&quot; en Inicio<br />
            Al principio muestra los juegos que el usuario selecciono y el monto total<br />
            <br />
            Cuando presione el boton COMPRAR, van a aparecer los detalles de la compra</div>
    </form>
</body>
</html>
