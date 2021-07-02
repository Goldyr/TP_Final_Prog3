<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApplication1.WebForm4" EnableEventValidation="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/pCarrito.css" />
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="default-header">
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                    <li>
                        <a href="Inicio.aspx">Inicio</a>
                    </li>

                    <li>
                        <a href="Contacto.aspx">Contacto</a>
                    </li>
                    <li class="auto-style1">
                        <a href="Carrito.aspx" class="nav-menu__ul__carrito">
                            <i class="fas fa-shopping-cart"></i>
                            <p>Carrito</p>
                        </a>
                    </li>

                </ul>
            </nav>
        </header>
        <section>
            <h1>COMPRA</h1>
            <div class="wrapper__compra">
                <p>Ingrese numero tarjeta</p>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <p>Monto a pagar</p>
                <asp:Label ID="lblMonto" runat="server"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="Comprar" />
            </div>
        </section>
        <section>
            <h1>DETALLES DE COMPRA</h1>
            <div class="detalles_compra">
                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Juego">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Juego" runat="server" Text='<%# Bind("Juego") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cantidad">
                            <EditItemTemplate>
                                <asp:TextBox ID="tb_edit" runat="server" min="1" Text='<%# Bind("Cantidad") %>' TextMode="Number" MaxLength="2"></asp:TextBox>
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
                <%--<asp:Label runat="server" Text="" ID="lblMonto_DC"></asp:Label>
                <asp:Label runat="server" Text="" ID="lblJuegos_DC"></asp:Label>
                <asp:Label runat="server" Text="" ID="lblFecha_DC"></asp:Label>
                <asp:Label runat="server" Text="" ID="lblnFac_DC"></asp:Label>
                <asp:Label runat="server" Text="" ID="lblKeys_DC"></asp:Label>--%>
            </div>
        </section>
    </form>
</body>
</html>
