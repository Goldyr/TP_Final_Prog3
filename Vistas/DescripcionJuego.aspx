﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DescripcionJuego.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                       <span id="nav-menu__span1"></span>
                       <span id="nav-menu__span2"></span>
                       <span id="nav-menu__span3"></span>
                       <span id="nav-menu__span4"></span>
                        Inicio</a>
                   </li>
           
                   <li >
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
        <section>
            <div>
                <asp:Label ID="Nombre_JLabel" runat="server" />
                <p>Precio</p>
                <asp:Label ID="PU_JLabel" runat="server" />
                <asp:Label ID="PCalc_JLabel" runat="server"></asp:Label>
                <asp:Image ID="Image1" runat="server" />
                <p>Acerca de</p>
                <asp:Label ID="Descripcion_JLabel" runat="server" />
            </div>
            <div>
               <%-- <asp:Label ID="Label1" runat="server" Text="Cantidad"></asp:Label>--%>
                <%--<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" TextMode="Number">1</asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="+" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="- " />--%>
                <asp:Button ID="Button3" runat="server" CommandName="agregarAlCarrito" OnCommand="btn_Carrito_Command" Text="Agregar al Carrito" />
                <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
            </div>
        </section>
        <footer>
            <div class="footer-div">
                <h4>Acerca</h4>
                <p>
                    Esta página fue creada para un proyecto de la materia Programación III de la Universidad Tecnológica Nacional. 
                </p>
            </div>
            <div class="footer-div">
                <h4>Integrantes</h4>
                <ul>
                    <li>Facundo Rivas</li>
                    <li>Enzo Bogado</li>
                    <li>Matias Flori</li>
                    <li>Sebastian Buelga</li>
                    <li>Sergio Rivera</li>
                </ul>
            </div>
        </footer>


    </form>
</body>
</html>
