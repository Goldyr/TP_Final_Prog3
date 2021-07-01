<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpcionesAdmin.aspx.cs" Inherits="WebApplication1.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_OpcAdmin.css" />

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
                    <li>
                        <a href="Carrito.aspx" class="nav-menu__ul__carrito">
                            <i class="fas fa-shopping-cart"></i>
                            <p>Carrito</p>
                        </a>
                    </li>

                </ul>
            </nav>
        </header>
        <section>
            <div class="Cuadro_Opciones">
                <a class="admin" href="BMLJuegos.aspx">EDITAR/ELIMINAR JUEGOS</a>

                <a class="admin" href="AgregarJuegos.aspx">AGREGAR JUEGOS</a>

                <a class="admin" href="AgregarDisDes.aspx">AGREGAR DISTRIBUIDORA Y DESARROLLADORA</a>
            </div>
        </section>

        <section class="S_Keys">
            <div class="Cuadro_Keys">

                <div class="Interior_Keys">
                    <h1>AGREGAR KEYS</h1>
                    <p>Ingrese ID de juego</p>
                    
                    <div class="Interior_Keys_Div">
                    <asp:TextBox ID="txt_ID" runat="server"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" />                 
                    <asp:RequiredFieldValidator ID="rfvJuego" runat="server" ControlToValidate="txt_ID" ValidationGroup="key">Ingrese el id de un juego</asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="Interior_Keys_Div">
                        <p>Juego:</p>
                        <asp:Label ID="lblJuego" runat="server"></asp:Label>
                    </div>

                    <div class="Interior_Keys_Div">
                        <p>Cantidad de Keys:</p>
                        <asp:Label ID="lblKeys" runat="server"></asp:Label>
                    </div>

                    <p>Agregar Keys</p>
                    <asp:TextBox ID="txt_serialkey" runat="server" ValidationGroup="key" Font-Size="X-Large" Height="102px" TextMode="MultiLine" Width="254px"></asp:TextBox>
                    <asp:Button ID="btn_agregarkey" runat="server" OnClick="btn_agregarkey_Click" Text="Agregar" ValidationGroup="key" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_serialkey" ErrorMessage="RequiredFieldValidator" ValidationGroup="key">Debe ingresar una serial</asp:RequiredFieldValidator>

                    <asp:Label ID="lbl_key" runat="server"></asp:Label>

                </div>
            </div>
        </section>

    </form>
</body>
</html>
