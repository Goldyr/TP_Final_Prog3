﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="WebApplication1.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_Contacto.css" />
    <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
        <header class="default-header">
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                   <li id="li_infoUsuario_iu" runat="server">
                        <asp:HyperLink ID="infoUsuario_hl_iu" runat="server" NavigateUrl="~/InfoUsuario.aspx" Visible="false">[infoUsuario_hl_iu]</asp:HyperLink>
                    </li>
                    
                    <li>
                       <a href="Inicio.aspx">
                       <span id="nav-menu__span1"></span>
                       <span id="nav-menu__span2"></span>
                       <span id="nav-menu__span3"></span>
                       <span id="nav-menu__span4"></span>
                        Inicio</a>
                   </li>

                    <li class="seleccionado">
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
        <section class="P_Contacto">
            <div class="Cuadro_Contacto">
                <table>
                    <tr>
                        <td>Enzo Bogado</td>
                        <td>enzoefb@hotmail.com</td>
                    </tr>
                    <tr>
                        <td>Sebastian Buelga</td>
                        <td>sebastian98@outlook.com.ar</td>
                    </tr>
                    <tr>
                        <td>Matias Flori</td>
                        <td>matyflori@hotmail.com</td>
                    </tr>
                    <tr>
                        <td>Facundo Rivas</td>
                        <td>rivasfacundo@hotmail.com</td>
                    </tr>
                    <tr>
                        <td>Sergio Rivera</td>
                        <td>sergiorive02@gmail.com</td>
                    </tr>
                </table>
            </div>
        </section>
        
    </form>
</body>
</html>
