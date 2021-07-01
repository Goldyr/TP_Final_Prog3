<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1.WebForm2" %>

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
                        <asp:TextBox runat="server" ID="txt_Prueba" placeholder="Buscar" AutoPostBack="True" OnTextChanged="txt_Prueba_TextChanged"></asp:TextBox>
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
                        <a href="Registrarse.aspx">¿No tenés cuenta?</a>
                    </div>
                    <asp:Label ID="lblMensajeLogIn" runat="server"></asp:Label>
                </div>
            </div>
        </header>
        <!-- Pagina inicial  -->
        <section class="pInicio">
            <div class="titulo-section">
                <h1>JUEGOS DESTACADOS</h1>
            </div>
            <a href="OpcionesAdmin.aspx" class="pInicio__admin-opc">
                <asp:Label ID="pInicio__lbladmin" runat="server" Text="Opciones de Administrador" Visible="False" />
            </a>
            <div class="pInicio__JuegosDestacados">
                <asp:ListView ID="lvJuegosDestacados" runat="server" DataKeyNames="Codigo_J" DataSourceID="SqlDataSource2" OnItemDataBound="lvJuegosDestacados_ItemDataBound" OnPreRender="lvJuegosDestacados_PreRender" EnablePersistedSelection="True" ValidateRequestMode="Disabled">
                    <ItemTemplate>
                        <div class="lvJuegosDestacados-div">
                            <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("Imagen_J") %>' OnCommand="red_Descripcion" CausesValidation="False" CommandArgument='<%# Eval("Codigo_J") %>' CommandName="redirectDescripcion" />

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
            <asp:CheckBoxList ID="cbl_Categorias" runat="server" DataSourceID="SqlDS_CheckboxCat"
                DataTextField="Nombre_Cat" DataValueField="Codigo_Cat"
                ValidationGroup="cat" AutoPostBack="True"
                OnSelectedIndexChanged="cbl_Categorias_SelectedIndexChanged" />
        </aside>

        <section class="pListadoCategorias">
            <div class="titulo-section">
                <h1>BUSCAR JUEGOS POR CATEGORIAS</h1>
            </div>
            <%# Eval("Nombre_J") %>

            <asp:ListView ID="lvListCat" runat="server" DataKeyNames="Codigo_J">
                <ItemTemplate>
                    <div class="lvListCat__div">
                      <asp:Label ID="lblNombreJuego" runat="server" Text='<%# Bind("Nombre_J") %>'></asp:Label>
                    <asp:ImageButton CssClass="imgAnimated" ID="Image2" runat="server" ImageUrl='<%# Bind("Imagen_J") %>' OnCommand="red_Descripcion" CausesValidation="False" CommandArgument='<%# Eval("Codigo_J") %>' CommandName="redirectDescripcion" />
                    </div>
             
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="lvListCatWrapper" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
        
            </asp:ListView>
        </section>

        <asp:SqlDataSource ID="SqlDS_CheckboxCat" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT * FROM [Categorias]" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_J], [Imagen_J], [PU_J], [Codigo_J], [Descuento_J] FROM [Juegos] WHERE (([Estado_J] = @Estado_J) AND ([Fecha_Lanzamiento_J] &gt;= @Fecha_Lanzamiento_J))">
            <SelectParameters>
                <asp:Parameter DefaultValue="TRUE" Name="Estado_J" Type="Boolean" />
                <asp:Parameter DbType="Date" DefaultValue="01/01/2019" Name="Fecha_Lanzamiento_J" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
