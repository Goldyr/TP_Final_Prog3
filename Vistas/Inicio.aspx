<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                    <li class="nav-menu__li__carrito">
                        <i class="fas fa-shopping-cart"></i>
                        <a href="Carrito.aspx">Compras</a>
                    </li>
                    <li>
                        <asp:TextBox runat="server" ID="tbPrueba" placeholder="Buscar"></asp:TextBox>
                    </li>
                </ul>
            </nav>

            <div runat="server" id="mainHeader__content">
                <div class="main-header__content__log-in" id="divLogin" runat="server">
                    <!-- USUARIO -->
                    <div class="main-header__content__div">
                        <asp:Label ID="header_lblUsuario" runat="server" Text="Email o Usuario" />
                        <asp:TextBox ID="header_tbUsuario" runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="header_tbUsuario" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>

                    </div>
                    <!-- CONTRASEÑA-->
                    <div class="main-header__content__div">
                        <asp:Label ID="header_lblContra" runat="server" Text="Contraseña" />
                        <asp:TextBox ID="header_tbContra" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="header_tbContra" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="main-header__content__div header-botones">
                        <asp:Button ID="header_btnLogIn" runat="server" Text="Iniciar Sesión" OnClick="header_btnLogIn_Click" PostBackUrl="~/Inicio.aspx" />
                        <%--<asp:Button ID="header_btn_LogOut" runat="server" OnClick="header_btn_LogOut_Click" PostBackUrl="~/Inicio.aspx" Text="Cerrar Sesion" Visible="False" />--%>
                        <a href="Registrarse.aspx">¿No tenés cuenta?</a>
                    </div>

                    <asp:Label ID="lblMensajeLogIn" runat="server"></asp:Label>

                </div>
                <!-- SEARCH  -->
                <%--              <div class="main-header__content__search">
                    <asp:Label ID="header_lblBusqueda" runat="server" Text="Búsqueda" />
                    <asp:TextBox ID="header_tbBusqueda" runat="server"></asp:TextBox>
                    <asp:Button ID="header_btnbusqueda" runat="server" Text="Buscar" />
                </div>--%>
            </div>
        </header>
        <!-- Pagina inicial  -->
        <section class="pInicio">
            <h1 id="pInicio-h1">JUEGOS DESTACADOS</h1>
            <asp:TextBox ID="txt_Prueba" runat="server" AutoPostBack="True" OnTextChanged="txt_Prueba_TextChanged"></asp:TextBox>
            <a href="OpcionesAdmin.aspx" class="pInicio__admin-opc">
                <asp:Label ID="pInicio__lbladmin" runat="server" Text="Opciones de Administrador" Visible="False"></asp:Label></a>
            <asp:SqlDataSource ID="SqlDS_CheckboxCat" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT * FROM [Categorias]" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_J], [Imagen_J], [PU_J], [Codigo_J], [Descuento_J] FROM [Juegos] WHERE (([Estado_J] = @Estado_J) AND ([Fecha_Lanzamiento_J] &gt;= @Fecha_Lanzamiento_J))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="TRUE" Name="Estado_J" Type="Boolean" />
                    <asp:Parameter DbType="Date" DefaultValue="01/01/2019" Name="Fecha_Lanzamiento_J" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="pInicio__JuegosDestacados">
                <asp:Label ID="lbl_pruebas_si" runat="server" Text="Label"></asp:Label>
                <asp:ListView ID="lvJuegosDestacados" runat="server" DataKeyNames="Codigo_J" DataSourceID="SqlDataSource2" OnItemDataBound="lvJuegosDestacados_ItemDataBound" OnPreRender="lvJuegosDestacados_PreRender" EnablePersistedSelection="True" ValidateRequestMode="Disabled">
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="lvJuegosDestacados-div">
                            <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen_J") %>' onCommand="red_Descripcion" CausesValidation="False" CommandArgument='<%# Eval("Codigo_J") %>' CommandName="redirectDescripcion" />

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
            <aside class="pInicio__aside">

            <div class="pInicio_Listado_Categorias">

                <asp:DataList ID="dl_ChecksCat" runat="server"></asp:DataList>
                <asp:CheckBoxList ID="cbl_Categorias" runat="server" DataSourceID="SqlDS_CheckboxCat" DataTextField="Nombre_Cat" DataValueField="Codigo_Cat" ValidationGroup="cat" AutoPostBack="True" OnSelectedIndexChanged="cbl_Categorias_SelectedIndexChanged">
                </asp:CheckBoxList>
                <asp:DataList ID="dl_ListadoCat" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" RepeatColumns="4" RepeatDirection="Horizontal">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <ItemStyle BackColor="White" ForeColor="#330099" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_ListCat" runat="server" Text='<%# Bind("Nombre_J") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lbl_PU_ListCat" runat="server" Text='<%# Bind("PU_J") %>'></asp:Label>
                        <br />
                        <asp:Image ID="Image2" runat="server" Height="100px" ImageAlign="Left" ImageUrl='<%# Bind("Imagen_J") %>' />
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                </asp:DataList>
                <br />
            </div>

        </aside>
    </form>
</body>
</html>
