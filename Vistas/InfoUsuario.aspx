<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="InfoUsuario.aspx.cs" Inherits="WebApplication1.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_InfoUsuario.css" />
    <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="default-header">
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                    <li id="li_infoUsuario" runat="server" class="seleccionado">
                        <asp:HyperLink ID="infoUsuario_hl" runat="server" NavigateUrl="~/InfoUsuario.aspx" Visible="False">
                            <span class="nav-menu__span1"></span>
                            <span class="nav-menu__span2"></span>
                            <span class="nav-menu__span3"></span>
                            <span class="nav-menu__span4"></span>
                            [infoUsuario_hl]
                        </asp:HyperLink>
                    </li>

                    <li>
                        <a href="Inicio.aspx">
                            <span class="nav-menu__span1"></span>
                            <span class="nav-menu__span2"></span>
                            <span class="nav-menu__span3"></span>
                            <span class="nav-menu__span4"></span>
                            Inicio</a>
                    </li>

                    <li>
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
        <section class="pInfoUsuario">
            <div class="pCuadro_Usuario">
                <h1>INFORMACION DEL USUARIO</h1>
                <div class="Usuario_Descripcion">
                    <p>Usuario :</p>
                    <asp:Label ID="lbl_user_IU" runat="server"></asp:Label>
                    <asp:TextBox ID="txt_User_IU" runat="server" Visible="False" ValidationGroup="ValidationUsuario" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="txt_User_IU" ForeColor="Aquamarine" ValidationGroup="ValidationUsuario">*</asp:RequiredFieldValidator>
                </div>
                <div class="Usuario_Descripcion">
                    <p>Nombres :</p>
                    <asp:Label runat="server" ID="lblNombre_IU"></asp:Label>
                    <asp:TextBox ID="txt_Nombre_IU" runat="server" MaxLength="40" Visible="False" ValidationGroup="ValidationUsuario"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="txt_Nombre_IU" ForeColor="Aquamarine" ValidationGroup="ValidationUsuario">*</asp:RequiredFieldValidator>
                </div>
                <div class="Usuario_Descripcion">
                    <p>Apellidos :</p>
                    <asp:Label ID="lblApellido_IU" runat="server"></asp:Label>
                    <asp:TextBox ID="txt_Apellidos_IU" runat="server" MaxLength="40" Visible="False" ValidationGroup="ValidationUsuario"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="txt_Apellidos_IU" ForeColor="Aquamarine" ValidationGroup="ValidationUsuario">*</asp:RequiredFieldValidator>
                </div>
                <div class="Usuario_Descripcion">
                    <p>Email :</p>
                    <asp:Label runat="server" ID="lblEmail_IU"></asp:Label>
                </div>
                <div class="Usuario_Descripcion">
                    <p>Telefono :</p>
                    <asp:Label ID="lblTelefono_IU" runat="server"></asp:Label>
                    <!--  script para solo numeros  -->
                    <script>
                        function solonumeros(e) {

                            var key;

                            if (window.event) // IE
                            {
                                key = e.keyCode;
                            }
                            else if (e.which) // Netscape/Firefox/Opera
                            {
                                key = e.which;
                            }

                            if (key < 48 || key > 57) {
                                return false;
                            }

                            return true;
                        }
                    </script>
                    <asp:TextBox ID="txt_telefono_IU" runat="server" MaxLength="30" Visible="False" ValidationGroup="ValidationUsuario" onkeypress="javascript:return solonumeros(event)" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="Usuario_Descripcion">
                    <p>Fecha de Nacimiento :</p>
                    <asp:Label ID="lblFecha_IU" runat="server"></asp:Label>
                </div>
                <div class="Usuario_botones">
                    <asp:Button ID="btn_EditarPerfil" CssClass="btnInfoUser" runat="server" OnClick="btn_EditarPerfil_Click" Text="Editar Datos" />
                    <asp:Button ID="btn_cancelar_IU" CssClass="btnInfoUser" runat="server" OnClick="btn_cancelar_IU_Click" Text="Cancelar" Visible="False" />
                    <asp:Button ID="btn_guardar_IU" CssClass="btnInfoUser" runat="server" OnClick="btn_guardar_IU_Click" Text="Guardar" Visible="False" ValidationGroup="ValidationUsuario" />
                </div>
                <div class="Usuario_mensaje">
                    <asp:Label ID="lbl_msg_IU" runat="server" ForeColor="Aquamarine"></asp:Label>
                </div>

            </div>
        </section>

        <section class="pCambioContrasena">
            <div class="pCuadro_Contrasena">
                <h1>CAMBIAR CONTRASEÑA</h1>

                <div class="Usuario_Contrasena">
                    <div class="Usuario_Contrasena_Ingreso">
                        <p>Ingrese su Contraseña actual </p>
                        <asp:TextBox ID="txtContraseñaActual" runat="server" TextMode="Password" ValidationGroup="ValidationContraseñaActual"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnIngresar" CssClass="btnInfoUser" runat="server" OnClick="btnIngresar_Click" Text="Enviar" ValidationGroup="ValidationContraseñaActual" />
                    <asp:Label ID="lblConfirmacion" runat="server" ForeColor="Aquamarine"></asp:Label>
                </div>

                <div class="Usuario_ContrasenaNueva">

                    <asp:Label ID="lblContraseñaNueva" runat="server" Text="Ingrese su nueva Contraseña" Visible="False" ForeColor="Aquamarine"></asp:Label>
                    <asp:TextBox ID="txtContraseñaNueva" runat="server" TextMode="Password" Visible="False" ValidationGroup="ValidationContraseña" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContraseñaNueva" runat="server" ControlToValidate="txtContraseñaNueva" ForeColor="Aquamarine" ValidationGroup="ValidationContraseña">*</asp:RequiredFieldValidator>

                    <asp:Label ID="lblContraseñaNueva2" runat="server" ForeColor="Aquamarine" Text="Repita su nueva Contraseña" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtContraseñaNueva2" runat="server" TextMode="Password" Visible="False" ValidationGroup="ValidationContraseña" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContraseñaNueva0" runat="server" ControlToValidate="txtContraseñaNueva2" ForeColor="Aquamarine" ValidationGroup="ValidationContraseña">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvContraseña" runat="server" ControlToCompare="txtContraseñaNueva" ControlToValidate="txtContraseñaNueva2" ErrorMessage="CompareValidator" Visible="False" ValidationGroup="ValidationContraseña" ForeColor="Red">Las contraseñas no son iguales</asp:CompareValidator>

                    <asp:Button ID="btnConfirmacion" runat="server" CssClass="btnInfoUser" OnClick="btnConfirmacion_Click" Text="Cambiar" Visible="False" ValidationGroup="ValidationContraseña" />

                </div>

            </div>
        </section>

        <section class="pInfoUsuario__historial">
            <div class="section-titulo">
                <h1>HISTORIAL DE COMPRAS</h1>
            </div>

            <div class="historial_wrapper">
                <asp:GridView ID="grd_ventas" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="grd_ventas_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="N°Venta">
                            <ItemTemplate>
                                <asp:Label ID="lbl_NVenta" runat="server" Text='<%# Bind("[N°Venta]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Metodo De Pago">
                            <ItemTemplate>
                                <asp:Label ID="lbl_MP" runat="server" Text='<%# Bind("[Metodo de Pago]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha De Compra">
                            <ItemTemplate>
                                <asp:Label ID="lbl_FCompra" runat="server" Text='<%# Bind("[Fecha De Compra]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio Total">
                            <ItemTemplate>
                                <asp:Label ID="lbl_PTotal" runat="server" Text='<%# Bind("[Precio Total]") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Detalles">
                            <ItemTemplate>
                                <asp:Button ID="Btn_Detalle" runat="server" CommandArgument='<%# Eval("[N°Venta]") %>' CommandName="Ver_Detalle" OnCommand="Btn_Detalle_Cmd" Text="Ver Detalles" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:Label ID="lblMostrarDetalle" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_DV" DataSourceID="sql_Detallesventas" Visible="False" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="SerieKey_DV" HeaderText="Serial" SortExpression="SerieKey_DV" />
                        <asp:BoundField DataField="Nombre_J" HeaderText="Nombre" SortExpression="Nombre_J" />
                        <asp:BoundField DataField="Precio_DV" HeaderText="Precio" SortExpression="Precio_DV" />
                    </Columns>
                </asp:GridView>

            </div>
        </section>
        <br />
        <asp:SqlDataSource ID="sql_Detallesventas" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [SerieKey_DV], [CodJuego_DV], [Precio_DV], [ID_DV] FROM [DetalleVentas]"></asp:SqlDataSource>
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
