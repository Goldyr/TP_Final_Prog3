﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="WebApplication1.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_Catalogo.css" />
      <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
            <header class="default-header">
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                   <li>
                      <a href="Inicio.aspx">
                       <span id="nav-menu__span1"></span>
                       <span id="nav-menu__span2"></span>
                       <span id="nav-menu__span3"></span>
                       <span id="nav-menu__span4"></span>
                        Inicio</a>
                   </li>
           
                   <li>
                        <a href="Contacto.aspx">
                       <span id="nav-menu__span1"></span>
                       <span id="nav-menu__span2"></span>
                       <span id="nav-menu__span3"></span>
                       <span id="nav-menu__span4"></span>Contacto</a>
                   </li>
                   <li>
                         <a href="Carrito.aspx" class="nav-menu__ul__carrito">
                       <span id="nav-menu__span1"></span>
                       <span id="nav-menu__span2"></span>
                       <span id="nav-menu__span3"></span>
                       <span id="nav-menu__span4"></span>
                         
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                   </li>
           
                </ul>
            </nav>
          </header>
        <div class ="prueba_div">
            <asp:Label ID="lbl_busqueda" runat="server" Text="Busqueda"></asp:Label>
            <br />
            <asp:TextBox ID="txt_Busqueda_local" runat="server" AutoPostBack="True" OnTextChanged="txt_Busqueda_local_TextChanged"></asp:TextBox>
            
           &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_cb" runat="server" Text="Buscar por rango de precio"></asp:Label>
            <asp:DropDownList ID="ddl_Precio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_Precio_SelectedIndexChanged">
                <asp:ListItem Value="0">Nada seleccionado</asp:ListItem>
                <asp:ListItem Value="1">Precio menor a 10$</asp:ListItem>
                <asp:ListItem Value="2">Entre 10$ y 20$</asp:ListItem>
                <asp:ListItem Value="3">Entre 20$ y 50$</asp:ListItem>
            </asp:DropDownList>
            
           </div>
            
            <section class="Section_Catalogo">
                <asp:DataList ID="dl_Catalogo" runat="server" GridLines="Horizontal" Font-Bold="False" Font-Names="Rubik" HorizontalAlign="Center" Width="350px" >
                    <FooterStyle />
                    <HeaderStyle />                    
                    <ItemStyle BackColor="#1d1d1d" ForeColor="white" BorderStyle="Solid" BorderWidth="3px" BorderColor="#6a3db2" Font-Names="Rubik" Height="250px"/>
                    
                    <ItemTemplate>
                        <div class="DataList_div">
                            <div class="Div_Nombre_Precio">
                        <asp:Label class="_Titulo" ID="lbl_Nom_Cat" runat="server" Text='<%# Bind("Nombre_J") %>'></asp:Label>                      
                        <asp:Label ID="lbl_PU_Cat" runat="server" Text='<%# Bind("PU_J") %>'></asp:Label>
                            </div>
                        <asp:Image ID="img_dl_cat" runat="server" ImageAlign="Right" ImageUrl='<%# Bind("Imagen_J") %>' />
                        </div>

                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                </asp:DataList>
                
            </section>
            
    </form>
</body>
</html>