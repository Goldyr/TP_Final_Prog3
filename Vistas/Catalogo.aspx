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
                      <a href="Inicio.aspx">
                       <span class="nav-menu__span1"></span>
                       <span class="nav-menu__span2"></span>
                       <span class="nav-menu__span3"></span>
                       <span class="nav-menu__span4"></span>
                        Inicio</a>
                   </li>
           
                   <li>
                        <a href="Contacto.aspx">
                       <span class="nav-menu__span1"></span>
                       <span class="nav-menu__span2"></span>
                       <span class="nav-menu__span3"></span>
                       <span class="nav-menu__span4"></span>Contacto</a>
                   </li>
                   <li>
                         <a href="Carrito.aspx" class="nav-menu__ul__carrito">
                       <span class="nav-menu__span1"></span>
                       <span class="nav-menu__span2"></span>
                       <span class="nav-menu__span3"></span>
                       <span class="nav-menu__span4"></span>
                         
                            <i class="fas fa-shopping-cart"></i>
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
            <asp:TextBox ID="txt_Busqueda_local" runat="server" AutoPostBack="True" OnTextChanged="txt_Busqueda_local_TextChanged"></asp:TextBox>
            <br />
            <br />
            <div>
                <asp:DataList ID="dl_Catalogo" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Font-Bold="False" Font-Italic="False" Font-Names="Agency FB" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" Width="1000px">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="White" ForeColor="#333333" Font-Bold="False" Font-Italic="False" Font-Names="Agency FB" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_Nom_Cat" runat="server" Text='<%# Bind("Nombre_J") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lbl_PU_Cat" runat="server" Text='<%# Bind("PU_J") %>'></asp:Label>
                        <asp:Image ID="img_dl_cat" runat="server" ImageAlign="Right" ImageUrl='<%# Bind("Imagen_J") %>' Width="200px" />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                <br />
                <br />
            </div>
            
    </form>
</body>
</html>
