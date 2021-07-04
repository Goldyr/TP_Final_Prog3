<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApplication1.WebForm4" EnableEventValidation="true" %>

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
                    <li>
                        <a href="Inicio.aspx">
                            <span id="nav-menu__span1"></span>
                            <span id="nav-menu__span2"></span>
                            <span id="nav-menu__span3"></span>
                            <span id="nav-menu__span4"></span>
                            Inicio</a>
                    </li>

                    <li>
                        <a href="Contacto.aspx">
                            <span id="nav-menu__span1"></span>
                            <span id="nav-menu__span2"></span>
                            <span id="nav-menu__span3"></span>
                            <span id="nav-menu__span4"></span>Contacto</a>
                    </li>
                    <li class="seleccionado">
                        <a href="Carrito.aspx" class="nav-menu__ul__carrito">
                            <span id="nav-menu__span1"></span>
                            <span id="nav-menu__span2"></span>
                            <span id="nav-menu__span3"></span>
                            <span id="nav-menu__span4"></span>

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
            <div class="wrapper__compra">
                <div class="wrapper-div">
                    <asp:DropDownList ID="ddl_MetxUsuario" runat="server">
                    </asp:DropDownList>
                </div>


                <div class="wrapper-div">
                    <p>Metodo de pago</p>
                    <asp:Label ID="lbl_tipo" runat="server"></asp:Label>
                </div>
                <div class="wrapper-div">
                    <p>Numero de tarjeta</p>
                    <asp:TextBox ID="txt_tarjeta" runat="server" AutoPostBack="True" MaxLength="16" OnTextChanged="txt_tarjeta_TextChanged"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Fecha de caducidad</p>
                    <asp:TextBox ID="txt_fecha" runat="server" TextMode="Month"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Codigo de seguridad</p>
                    <asp:TextBox ID="txt_clave" runat="server" MaxLength="4"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Nombres</p>
                    <asp:TextBox ID="txt_Nombres" runat="server"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Apellidos</p>
                    <asp:TextBox ID="txt_apellidos" runat="server"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Dni</p>
                    <asp:TextBox ID="txt_dni" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Email</p>
                    <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Direccion de facturacion</p>
                    <asp:TextBox ID="txt_direccion" runat="server"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Codigo postal</p>
                    <asp:TextBox ID="txt_CP" runat="server"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Telefono</p>
                    <asp:TextBox ID="txt_telefono" runat="server"></asp:TextBox>
                </div>
                <div class="wrapper-div">
                    <p>Monto A Pagar</p>
                    <asp:Label ID="lblMonto" runat="server"></asp:Label>
                </div>
                <div class="wrapper-div">
                    <asp:Button ID="Btn_comprar" runat="server" Text="Comprar" OnClick="Btn_comprar_Click" />
                </div>
            </div>
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
