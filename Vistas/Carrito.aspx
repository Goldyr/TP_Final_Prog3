<%@ Page Language="C#" AutoEventWireup="true"  MaintainScrollPositionOnPostback="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApplication1.WebForm4" EnableEventValidation="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/P_Carrito.css" />
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="default-header">
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                    <li id="li_infoUsuario" runat="server">
                        <asp:HyperLink ID="infoUsuario_hl" runat="server" NavigateUrl="~/InfoUsuario.aspx">[infoUsuario_hl]</asp:HyperLink>
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
                    <li class="seleccionado">
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
        <section id="sectionCompra" runat="server">
            <div class="titulo__section">
                <h1>COMPRA</h1>
            </div>
            <div class="wrapper__compra" id="wrapperCompra" runat="server">
                <div class="wrapper-div-content">
                    <p>Elija un método de pago que ya cargo</p>
                    <asp:DropDownList ID="ddl_MetxUsuario" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_MetxUsuario_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="lblTarjetaUsuario" runat="server" Text=""></asp:Label>
                </div>
                <div class="wrapper-div-content">
                    O agrega otro metodo de pago
                </div>
                <div id="wrapperDiv" runat="server">
                    <div class="wrapper-div compra-datos-tarjeta">
                        <div class="wrapper-div-content">
                            <p>Metodo de pago</p>
                            <asp:Label ID="lbl_tipo" runat="server"></asp:Label>
                        </div>
                        <div class="wrapper-div-content">
                            <p>Numero de tarjeta</p>
                            <asp:TextBox ID="txt_tarjeta" runat="server" AutoPostBack="True" MaxLength="16" OnTextChanged="txt_tarjeta_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_tarjeta" ErrorMessage="Ingrese un numero de tarjeta"></asp:RequiredFieldValidator>
                        </div>
                        <div class="wrapper-div-content">
                            <p>Fecha de caducidad</p>
                            <asp:TextBox ID="txt_fecha" runat="server" TextMode="Month"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_fecha" ErrorMessage="Ingrese una fecha"></asp:RequiredFieldValidator>
                        </div>
                        <div class="wrapper-div-content">
                            <p>Codigo de seguridad</p>
                            <asp:TextBox ID="txt_clave" runat="server" MaxLength="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_clave" ErrorMessage="Ingrese un código de seguridad"></asp:RequiredFieldValidator>
                        </div>

                    </div>

                    <div class="wrapper-div compra-datos-personales">
                        <div class="wrapper-div-content">
                            <p>Nombres</p>
                            <asp:TextBox ID="txt_Nombres" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Nombres" ErrorMessage="Ingrese un nombre"></asp:RequiredFieldValidator>
                        </div>
                        <div class="wrapper-div-content">
                            <p>Apellidos</p>
                            <asp:TextBox ID="txt_apellidos" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_apellidos" ErrorMessage="Ingrese un apellido"></asp:RequiredFieldValidator>
                        </div>
                        <div class="wrapper-div-content">
                            <p>Dni</p>
                            <asp:TextBox ID="txt_dni" runat="server" MaxLength="8"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_dni" ErrorMessage="Ingrese el DNI del titular"></asp:RequiredFieldValidator>
                        </div>
                        <div class="wrapper-div-content">
                            <p>Email</p>
                            <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_email" ErrorMessage="Ingrese un mail"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="wrapper-div compra-datos-contacto">
                        <div class="wrapper-div-content">
                            <p>Direccion de facturacion</p>
                            <asp:TextBox ID="txt_direccion" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_direccion" ErrorMessage="Ingrese una dirección"></asp:RequiredFieldValidator>
                        </div>
                        <div class="wrapper-div-content">
                            <p>Codigo postal</p>
                            <asp:TextBox ID="txt_CP" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_CP" ErrorMessage="Ingrese un codigo postal"></asp:RequiredFieldValidator>
                        </div>
                        <div class="wrapper-div-content">
                            <p>Telefono</p>
                            <asp:TextBox ID="txt_telefono" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_telefono" ErrorMessage="Ingrese un telefono"></asp:RequiredFieldValidator>
                        </div>
                        <div class="wrapper-div-content">
                            <asp:Button ID="btnAgregarMP" runat="server" Text="Agregar Metodo de Pago" OnClick="Btn_AgregarMP" />
                            <asp:Label ID="lbl_confirmacionAgregarMP" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="wrapper-div compra-crear-venta">
                    <div class="wrapper-div-content">
                        <p>Monto A Pagar</p>
                        <asp:Label ID="lblMonto" runat="server"></asp:Label>
                    </div>
                    <div class="wrapper-div-content">
                        <asp:Button ID="Btn_comprar" runat="server" Text="Comprar" OnClick="Btn_comprar_Click" CausesValidation="False" />
                    </div>
                </div>

            </div>
            <asp:Label ID="lblInicioSesionCompra" runat="server" Text="Para realizar una compra, inicia sesion primero"></asp:Label>
        </section>
        <section id="sectionCarrito" runat="server">
            <div class="titulo__section">
                <h1>DETALLES DE COMPRA</h1>
            </div>
            <div class="detalles_compra">
                <asp:GridView ID="gvDetallesCarrito" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AutoGenerateDeleteButton="True" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Juego">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Juego" runat="server" Text='<%# Bind("Juego") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cantidad">
                            <EditItemTemplate>
                                <asp:TextBox ID="tb_edit" runat="server" min="1" Text='<%# Bind("Cantidad") %>' TextMode="Number" MaxLength="2" ReadOnly="False"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Cantidad" runat="server" Text='<%# Bind("Cantidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio unitario">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Pu" runat="server" Text='<%# Bind("PrecioUnitario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio a pagar">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Prpagar" runat="server" Text='<%# Bind("Precio_a_Pagar") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lbl_ErrorEditing" runat="server" Visible="False"></asp:Label>
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
