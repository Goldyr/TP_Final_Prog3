<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="WebApplication1.WebForm5" %>

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
            <div>
                <asp:DataList ID="dl_Categorias" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDS_Catalogo" GridLines="Horizontal">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="White" ForeColor="#333333" />
                    <ItemTemplate>
                        Nombre_J:
                        <asp:Label ID="Nombre_JLabel" runat="server" Text='<%# Eval("Nombre_J") %>' />
                        <br />
                        PU_J:
                        <asp:Label ID="PU_JLabel" runat="server" Text='<%# Eval("PU_J") %>' />
                        <br />
                        CodigoDes_J:
                        <asp:Label ID="CodigoDes_JLabel" runat="server" Text='<%# Eval("CodigoDes_J") %>' />
                        <br />
                        CodigoDis_J:
                        <asp:Label ID="CodigoDis_JLabel" runat="server" Text='<%# Eval("CodigoDis_J") %>' />
                        <br />
                        Descuento_J:
                        <asp:Label ID="Descuento_JLabel" runat="server" Text='<%# Eval("Descuento_J") %>' />
                        <br />
                        Descripcion_J:
                        <asp:Label ID="Descripcion_JLabel" runat="server" Text='<%# Eval("Descripcion_J") %>' />
                        <br />
                        Fecha_Lanzamiento_J:
                        <asp:Label ID="Fecha_Lanzamiento_JLabel" runat="server" Text='<%# Eval("Fecha_Lanzamiento_J") %>' />
                        <br />
                        Imagen_J:
                        <asp:Label ID="Imagen_JLabel" runat="server" Text='<%# Eval("Imagen_J") %>' />
                        <br />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDS_Catalogo" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_J], [PU_J], [CodigoDes_J], [CodigoDis_J], [Descuento_J], [Descripcion_J], [Fecha_Lanzamiento_J], [Imagen_J] FROM [Juegos] WHERE [Estado_J] = 1"></asp:SqlDataSource>
                <br />
            </div>
            <br />
            A este WebForm, se ingresa cuando se escribe el nombre de un juego en Inicio, o cuando selecciona una Categoria en el DataList de Inicio</div>
    </form>
</body>
</html>
