<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="WebApplication1.WebForm5" %>

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
            <br />
            <br />
            <br />
            Busqueda
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" Height="60px" Width="98px" />
&nbsp;<asp:Label ID="Label1" runat="server" Text="Nombre, Descripcion, Precio"></asp:Label>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Añadir al carro" />
&nbsp;<br />
            <br />
            <asp:Image ID="Image2" runat="server" Height="60px" Width="98px" />
            <asp:Label ID="Label2" runat="server" Text="Nombre, Descripcion, Precio"></asp:Label>
&nbsp;<asp:Button ID="Button2" runat="server" Text="Añadir al carro" />
&nbsp;<br />
            <br />
            <asp:Image ID="Image3" runat="server" Height="60px" Width="98px" />
            <asp:Label ID="Label3" runat="server" Text="Nombre, Descripcion, Precio"></asp:Label>
&nbsp;<asp:Button ID="Button3" runat="server" Text="Añadir al carro" />
&nbsp;<br />
            <br />
            <asp:Image ID="Image4" runat="server" Height="60px" Width="98px" />
            <asp:Label ID="Label4" runat="server" Text="Nombre, Descripcion, Precio"></asp:Label>
&nbsp;<asp:Button ID="Button4" runat="server" Text="Añadir al carro" />
&nbsp;<br />
            <br />
            <asp:Image ID="Image5" runat="server" Height="60px" Width="98px" />
            <asp:Label ID="Label5" runat="server" Text="Nombre, Descripcion, Precio"></asp:Label>
&nbsp;<asp:Button ID="Button5" runat="server" Text="Añadir al carro" />
&nbsp;<br />
            <br />
            Va a ser un DataList<br />
            <br />
            A este WebForm, se ingresa cuando se escribe el nombre de un juego en Inicio, o cuando selecciona una Categoria en el DataList de Inicio</div>
    </form>
</body>
</html>
