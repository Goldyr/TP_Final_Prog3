<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="Estilos.css" />
    <link rel="stylesheet" type="text/css" href="P_Inicio.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- HEADER -->
        <header class="main-header">
            <div class="main-header__content">
                <div class="main-header__content__log-in">
                    <!-- USUARIO -->
                    <div class="main-header__content__div">
                        <p>Usuario</p>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </div>
                     <!-- CONTRASEÑA-->
                     <div class="main-header__content__div">
                        <p>Contraseña</p>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                     </div>
                </div>
                 <!-- SEARCH  -->
                <div class="main-header__content__search">
                   <p>Búsqueda</p>
                   <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                   <asp:Button ID="Button1" runat="server" Text="Buscar" />
                </div>
            </div>
            <!-- MENU DE NAVEGACION -->
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
        <!-- Pagina inicial  -->
        <section class="pInicio">

        <asp:ListView ID="ListView1" runat="server"/>
        <asp:DataList ID="DataList1" runat="server"/>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"/>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"/>

        <span class="pInicio__admin-opc"><a href="OpcionesAdmin.aspx">OPCIONES DE ADMINISTRADOR</a></span>
        <p>Inicio de la pagina</p>
        <p> El ListView va a tener los juegos mas recientes</p>
        <p> El DataList va a estar formado por botones, los cuales tienen las Categorias de los juegos</p>
        <p> En Opciones de Administrador se van a agregar los catalogos nuevos y se va a acceder mediante una contraseña</p>
       
        </section>
       

    </form>

    </body>
</html>
