<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_Inicio.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- HEADER -->
        <header class="main-header">
            <div class="main-header__content">
                <div class="main-header__content__log-in" id="divLogin" runat="server">
                    <!-- USUARIO -->
                    <div class="main-header__content__div">
                        <asp:Label ID="header_lblUsuario" runat="server" Text="Usuario"/>
                        <asp:TextBox ID="header_tbUsuario" runat="server"></asp:TextBox>
                    </div>
                     <!-- CONTRASEÑA-->
                     <div class="main-header__content__div">
                        <asp:Label ID="header_lblContra" runat="server" Text="Contraseña"/>
                        <asp:TextBox ID="header_tbContra" runat="server" TextMode="Password"></asp:TextBox>
                     </div>
                    <asp:Button  ID="header_btnLogIn" runat="server" Text="Iniciar Sesión" OnClick="header_btnLogIn_Click" PostBackUrl="~/Inicio.aspx"/>
                    <asp:Label ID="lblMensajeLogIn" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="header_btn_LogOut" runat="server" OnClick="header_btn_LogOut_Click" PostBackUrl="~/Inicio.aspx" Text="Cerrar Sesion" />
                </div>
                 <!-- SEARCH  -->
                <div class="main-header__content__search">
                    <asp:Label ID="header_lblBusqueda" runat="server" Text="Búsqueda"/>
                   <asp:TextBox ID="header_tbBusqueda" runat="server"></asp:TextBox>
                   <asp:Button ID="header_btnbusqueda" runat="server" Text="Buscar" />
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
             <a href="OpcionesAdmin.aspx" class="pInicio__admin-opc"><asp:Label ID="pInicio__lbladmin" runat="server" Text="Opciones de Administrador" Visible="False"></asp:Label></a>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT * FROM [Categorias]"/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT Nombre_J, Codigo_J, PU_J, Descuento_J FROM Juegos WHERE YEAR(Fecha_Lanzamiento_J)&gt;2019"/>
            <div class="pInicio__Juegos">
                 <asp:ListView ID="ListView1" runat="server" DataKeyNames="Codigo_J" DataSourceID="SqlDataSource2">
            <AlternatingItemTemplate>
                <span style="">Nombre:
                <asp:Label ID="Nombre_JLabel" runat="server" Text='<%# Eval("Nombre_J") %>' />
                <br />
                Codigo:
                <asp:Label ID="Codigo_JLabel" runat="server" Text='<%# Eval("Codigo_J") %>' />
                <br />
                Precio:
                <asp:Label ID="PU_JLabel" runat="server" Text='<%# Eval("PU_J") %>' />
                <br />
                Descuento:
                <asp:Label ID="Descuento_JLabel" runat="server" Text='<%# Eval("Descuento_J") %>' />
                <br />
                <br />
                </span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="">Nombre_J:
                <asp:TextBox ID="Nombre_JTextBox" runat="server" Text='<%# Bind("Nombre_J") %>' />
                <br />
                Codigo_J:
                <asp:Label ID="Codigo_JLabel1" runat="server" Text='<%# Eval("Codigo_J") %>' />
                <br />
                PU_J:
                <asp:TextBox ID="PU_JTextBox" runat="server" Text='<%# Bind("PU_J") %>' />
                <br />
                Descuento_J:
                <asp:TextBox ID="Descuento_JTextBox" runat="server" Text='<%# Bind("Descuento_J") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">Nombre_J:
                <asp:TextBox ID="Nombre_JTextBox" runat="server" Text='<%# Bind("Nombre_J") %>' />
                <br />
                Codigo_J:
                <asp:TextBox ID="Codigo_JTextBox" runat="server" Text='<%# Bind("Codigo_J") %>' />
                <br />
                PU_J:
                <asp:TextBox ID="PU_JTextBox" runat="server" Text='<%# Bind("PU_J") %>' />
                <br />
                Descuento_J:
                <asp:TextBox ID="Descuento_JTextBox" runat="server" Text='<%# Bind("Descuento_J") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="">Nombre:
                <asp:Label ID="Nombre_JLabel" runat="server" Text='<%# Eval("Nombre_J") %>' />
                <br />
                Codigo:
                <asp:Label ID="Codigo_JLabel" runat="server" Text='<%# Eval("Codigo_J") %>' />
                <br />
                Precio:
                <asp:Label ID="PU_JLabel" runat="server" Text='<%# Eval("PU_J") %>' />
                <br />
                Descuento:
                <asp:Label ID="Descuento_JLabel" runat="server" Text='<%# Eval("Descuento_J") %>' />
                <br />
                <br />
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">Nombre_J:
                <asp:Label ID="Nombre_JLabel" runat="server" Text='<%# Eval("Nombre_J") %>' />
                <br />
                Codigo_J:
                <asp:Label ID="Codigo_JLabel" runat="server" Text='<%# Eval("Codigo_J") %>' />
                <br />
                PU_J:
                <asp:Label ID="PU_JLabel" runat="server" Text='<%# Eval("PU_J") %>' />
                <br />
                Descuento_J:
                <asp:Label ID="Descuento_JLabel" runat="server" Text='<%# Eval("Descuento_J") %>' />
                <br />
                <br />
                </span>
            </SelectedItemTemplate>
            </asp:ListView>
            </div>
            <div class="pInicio__Categorias">
                 <asp:CheckBoxList ID="cbl_Categorias" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre_Cat" DataValueField="Codigo_Cat" ValidationGroup="cat">
                </asp:CheckBoxList>
                 <asp:Button ID="btn_Categoria" runat="server" OnClick="btn_Categoria_Click" Text="Busqueda" ValidationGroup="cat" />
                 <asp:Label ID="lbl_error_Categorias" runat="server" Text="** Tilde alguna de las categorias para realizar esta busqueda" Visible="False"></asp:Label>
                 <br />
            </div>
   
        <p>El ListView va a tener los juegos mas recientes</p>
        <p> El DataList va a estar formado por botones, los cuales tienen las Categorias de los juegos</p>
        <p> En Opciones de Administrador se van a agregar los catalogos nuevos y se va a acceder mediante una contraseña</p>
       
        </section>
       

    </form>

    </body>
</html>
