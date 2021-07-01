<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DescripcionJuego.aspx.cs" Inherits="WebApplication1.WebForm3" %>

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
        <div id="prueba">
            <asp:DataList ID="dl_Juego" runat="server" DataSourceID="sdsJuego" Height="300px" RepeatColumns="1" Width="1000px" RepeatLayout="Flow">
                <ItemTemplate>
                    &nbsp;<asp:Label ID="Nombre_JLabel" runat="server" Font-Size="XX-Large" Text='<%# Eval("Nombre_J") %>' />
                    <br />
                    Precio:
                    <asp:Label ID="PU_JLabel" runat="server" Text='<%# Eval("PU_J") %>' />
                    <br />
                    Descuento:
                    <asp:Label ID="Descuento_JLabel" runat="server" Text='<%# Eval("Descuento_J") %>' />
                    <br />
                    Descripcion:
                    <asp:Label ID="Descripcion_JLabel" runat="server" Text='<%# Eval("Descripcion_J") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Imagen_J") %>' />
                    <br />
                    <br />
                    <asp:Button ID="btn_Carrito" runat="server" Text="Agregar al carrito" />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>
        <br />
        <br />
        <asp:SqlDataSource ID="sdsJuego" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_J], [PU_J], [Descuento_J], [Descripcion_J], [Imagen_J] FROM [Juegos]"></asp:SqlDataSource>
    </form>
</body>
</html>
