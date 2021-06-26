<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="WebApplication1.WebForm5" %>

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
        <div>
            <br />
            <br />
            <br />
            Busqueda
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_pruebas" runat="server" Text="Label"></asp:Label>
            <br />
            <div>
                <asp:DataList ID="dl_Catalogo" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Font-Bold="False" Font-Italic="False" Font-Names="Agency FB" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="White" ForeColor="#333333" Font-Bold="False" Font-Italic="False" Font-Names="Agency FB" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_Nom_Cat" runat="server" Text='<%# Bind("Nombre_J") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lbl_PU_Cat" runat="server" Text='<%# Bind("PU_J") %>'></asp:Label>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <br />
                <br />
            </div>
            <br />
            A este WebForm, se ingresa cuando se escribe el nombre de un juego en Inicio, o cuando selecciona una Categoria en el DataList de Inicio</div>
    </form>
</body>
</html>
