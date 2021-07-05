<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="WebApplication1.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <title>New Wave Games</title>
    <link rel="icon" type="image/png" href="/imagenes/favicon/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_Contacto.css" />
    <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
        <header class="default-header">
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                    <li id="li_infoUsuario" runat="server">
                        <asp:HyperLink ID="infoUsuario_hl" runat="server" NavigateUrl="~/InfoUsuario.aspx" Visible="True">[infoUsuario_hl]</asp:HyperLink>
                    </li>

                    <li>
                        <a href="Inicio.aspx">
                            <span class="nav-menu__span1"></span>
                            <span class="nav-menu__span2"></span>
                            <span class="nav-menu__span3"></span>
                            <span class="nav-menu__span4"></span>
                            Inicio</a>
                    </li>

                    <li class="seleccionado">
                        <a href="Contacto.aspx">
                            <span class="nav-menu__span1"></span>
                            <span class="nav-menu__span2"></span>
                            <span class="nav-menu__span3"></span>
                            <span class="nav-menu__span4"></span>Contacto</a>
                    </li>
                    <li class="nav-menu__li__carrito">
                        <i class="fas fa-shopping-cart"></i>
                        <a href="Carrito.aspx" class="nav-menu__li__carrito">
                            <span class="nav-menu__span1"></span>
                            <span class="nav-menu__span2"></span>
                            <span class="nav-menu__span3"></span>
                            <span class="nav-menu__span4"></span>
                            compras
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
</body>
</html>
