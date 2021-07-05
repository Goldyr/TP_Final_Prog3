<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DescripcionJuego.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/Descripcion.css" />
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
           
                   <li >
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
        <section class="Section-InfoJuego">
            <div class="Section-InfoJuego-Container">
                <div class="Section-InfoJuego-Div__img">
                    <asp:Image ID="Image1" runat="server" />
                      <div class="Section-InfoJuego__descto">
                          <asp:Label ID="Descuento" runat="server"></asp:Label>
                      </div>
                    <div class="Section-InfoJuego-Div__img-barra">   
                        <div class="Div-img-barra_name">
                            <asp:Label ID="Nombre_JLabel" runat="server" />
                        </div>
                        <div class="Div-img-barra-precio">
                            <asp:Label ID="PU_JLabel" class="Tachado" runat="server" />
                            <asp:Label ID="PCalc_JLabel" runat="server"></asp:Label>
                        </div>
                    </div>                    
                </div>
                <div class="Section-InfoJuego-Descripcion">
                    <h2>Acerca de</h2>
                    <asp:Label ID="Descripcion_JLabel" runat="server" />
                </div>
            </div>
            <div class="Section-InfoJuego-Div__btn">
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
