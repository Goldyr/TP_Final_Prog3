<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio1.aspx.cs" Inherits="Vistas.Inicio1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_Inicio.css" />
    <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 
            NUEVO HEADER: LA CLASE DE LA PAGINA INICIAL SOLO SE LLAMA MAIN-HEADER, LAS OTRAS PAGINAS
            SE LLAMAN DEFAULT-HEADER 
         -->
        <header id="mainHeader" runat="server">
            <!-- NAVIGATION MENU -->
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                    <li id="li_infoUsuario" runat="server">
                        <asp:HyperLink ID="infoUsuario_hl" runat="server" NavigateUrl="~/InfoUsuario.aspx" Visible="False">[infoUsuario_hl]</asp:HyperLink>
                    </li>
                    <li class="seleccionado">
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
                    <li>
                        <asp:TextBox runat="server" ID="tbPrueba" placeholder="Buscar"></asp:TextBox>
                    </li>
                </ul>
            </nav>

            <div runat="server" id="mainHeader__content">
                <div class="main-header__content__log-in" id="divLogin" runat="server">
                
                    <!-- CONTRASEÑA-->
                    <div class="main-header__content__div">
                        <asp:Label ID="header_lblContra" runat="server" Text="Contraseña" />
                        <asp:TextBox ID="header_tbContra" runat="server" TextMode="Password"></asp:TextBox>
                       
                    </div>
                    <div class="main-header__content__div header-botones">
                        <asp:Button ID="header_btnLogIn" runat="server" Text="Iniciar Sesión" PostBackUrl="~/Inicio1.aspx" />
                        <%--<asp:Button ID="header_btn_LogOut" runat="server" OnClick="header_btn_LogOut_Click" PostBackUrl="~/Inicio.aspx" Text="Cerrar Sesion" Visible="False" />--%>
                        <a href="Registrarse.aspx">¿No tenés cuenta?</a>
                    </div>

                    <asp:Label ID="lblMensajeLogIn" runat="server"></asp:Label>

                </div>
            </div>
        </header>
        <!-- Pagina inicial  -->
        <section class="pInicio">
            <div class="pInicio__JuegosDestacados">
                <asp:SqlDataSource ID="SqlDS_CheckboxCat" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT * FROM [Categorias]" />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_J], [Imagen_J], [PU_J], [Codigo_J], [Descuento_J] FROM [Juegos] WHERE (([Estado_J] = @Estado_J) AND ([Fecha_Lanzamiento_J] &gt;= @Fecha_Lanzamiento_J))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="TRUE" Name="Estado_J" Type="Boolean" />
                        <asp:Parameter DbType="Date" DefaultValue="01/01/2019" Name="Fecha_Lanzamiento_J" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="lvJuegosDestacados" runat="server" DataKeyNames="Codigo_J" DataSourceID="SqlDataSource2" EnablePersistedSelection="True" ValidateRequestMode="Disabled">
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="lvJuegosDestacados-div">
                            <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen_J") %>' OnCommand="goDescripcion" CommandArgument='<%# Eval("Codigo_J") %>' CommandName="descripcionJuego" />
                            <div class="lvJuegosDestacados-div__descto">
                                <asp:Label ID="Descuento" runat="server" Text='<%# Eval("Descuento_J") %>'></asp:Label>
                            </div>
                            <div class="lvJuegosDestacados-div__desc">
                                <div class="lvJuegosDestacados-div__desc__nombre">
                                    <h1><%# Eval("Nombre_J") %></h1>
                                </div>
                                <asp:Panel class="lvJuegosDestacados-div__desc__precio" ID="panelPrecio" runat="server">
                                    <asp:Label ID="Precio" runat="server" Text='<%# Eval("PU_J")%>'></asp:Label>
                                    <asp:Label ID="PrecioDesc" runat="server" Text=""></asp:Label>
                                </asp:Panel>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" class="JuegosDestacados__container" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />

                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </div>

        </section>
    </form>
</body>
</html>
