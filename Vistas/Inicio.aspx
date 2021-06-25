<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                        <asp:Label ID="header_lblUsuario" runat="server" Text="Usuario" />
                        <asp:TextBox ID="header_tbUsuario" runat="server"></asp:TextBox>
                    </div>
                    <!-- CONTRASEÑA-->
                    <div class="main-header__content__div">
                        <asp:Label ID="header_lblContra" runat="server" Text="Contraseña" />
                        <asp:TextBox ID="header_tbContra" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:Button ID="header_btnLogIn" runat="server" Text="Iniciar Sesión" OnClick="header_btnLogIn_Click" PostBackUrl="~/Inicio.aspx" />
                    <asp:Label ID="lblMensajeLogIn" runat="server"></asp:Label>
                    <asp:Button ID="header_btn_LogOut" runat="server" OnClick="header_btn_LogOut_Click" PostBackUrl="~/Inicio.aspx" Text="Cerrar Sesion" />
                </div>
                <!-- SEARCH  -->
                <div class="main-header__content__search">
                    <asp:Label ID="header_lblBusqueda" runat="server" Text="Búsqueda" />
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
             <h1 id="pInicio-h1">JUEGOS DESTACADOS</h1>
            <a href="OpcionesAdmin.aspx" class="pInicio__admin-opc">
                <asp:Label ID="pInicio__lbladmin" runat="server" Text="Opciones de Administrador" Visible="False"></asp:Label></a>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT * FROM [Categorias]" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_J], [Imagen_J], [PU_J], [Codigo_J], [Descuento_J] FROM [Juegos] WHERE (([Estado_J] = @Estado_J) AND ([Fecha_Lanzamiento_J] &gt;= @Fecha_Lanzamiento_J))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="TRUE" Name="Estado_J" Type="Boolean" />
                    <asp:Parameter DbType="Date" DefaultValue="01/01/2019" Name="Fecha_Lanzamiento_J" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="pInicio__JuegosDestacados">
                <asp:ListView ID="lvJuegosDestacados" runat="server" DataKeyNames="Codigo_J" DataSourceID="SqlDataSource2" OnItemDataBound="lvJuegosDestacados_ItemDataBound">
                    <%--            <AlternatingItemTemplate>
                      </AlternatingItemTemplate>--%>
                    <EditItemTemplate />
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <InsertItemTemplate />
                    <ItemTemplate>
                        <div class="lvJuegosDestacados-div">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen_J") %>' />
                            <div class="lvJuegosDestacados-div__descto">
                                <asp:Label ID="Descuento" runat="server" Text='<%# Eval("Descuento_J") %>'></asp:Label>
                            </div>
                            <div class="lvJuegosDestacados-div__desc">
                                <div class="lvJuegosDestacados-div__desc__nombre">
                                    <h1><%# Eval("Nombre_J") %></h1>
                                </div>
                                <asp:Panel class="lvJuegosDestacados-div__desc__precio" ID="panelPrecio" runat="server">
                                    <asp:Label ID="Precio" runat="server" Text='<%# Eval("PU_J")%>'></asp:Label>
                                </asp:Panel>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" class="JuegosDestacados__container" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />

                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
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

            <p>El ListView va a tener los juegos mas recientesuevos y se va a acceder mediante una contraseña</p>

        </section>


    </form>
</body>

</html>
