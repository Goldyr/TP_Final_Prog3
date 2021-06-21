<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoUsuario.aspx.cs" Inherits="WebApplication1.WebForm6" %>

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
            INFORMACION DEL USUARIO<br />
            Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="editar" />
            <br />
            Email<br />
            Fecha de ingreso<br />
            <br />
            <br />
            <br />
            HISTORIAL DE COMPRAS<br />
            Fecha de Compra-Monto-<asp:Button ID="Button1" runat="server" Text="Detalles" />
            <br />
            Fecha de Compra-Monto-<asp:Button ID="Button2" runat="server" Text="Detalles" />
            <br />
            Fecha de Compra-Monto-<asp:Button ID="Button3" runat="server" Text="Detalles" />
            <br />
            <br />
            <br />
            Va a ser un GridView<br />
            Se accede a esta seccion desde &quot;Info.Usuario&quot; en Inicio</div>
    </form>
</body>
</html>
