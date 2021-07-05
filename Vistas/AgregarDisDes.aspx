<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarDisDes.aspx.cs" Inherits="Vistas.AgregarDisDes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>New Wave Games</title>
    <link rel="icon" type="image/png" href="/imagenes/favicon/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_AgregarDisDes.css" />
    <script src="https://kit.fontawesome.com/cf8c340397.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="default-header">
            <nav class="nav-menu">
                <ul class="nav-menu__ul">
                    <li id="li_infoUsuario_iu" runat="server">
                        <asp:HyperLink ID="infoUsuario_hl_iu" runat="server" NavigateUrl="~/InfoUsuario.aspx" Visible="false">[infoUsuario_hl_iu]</asp:HyperLink>
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
        <section class="sectionDesDis">
            <div class="agregar__wrapper">
                <div class="titulo-section">
                    <h1>AGREGAR DESARROLLADORA</h1>
                </div>
                <div class="agregar__container">
                    <div class="agregar-div">
                        <p>Nombre</p>
                        <asp:TextBox ID="Nom_Des_txtBox" runat="server" MaxLength="20" ValidationGroup="grupo1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_des" runat="server" ControlToValidate="Nom_Des_txtBox" ErrorMessage="No se puede Agregar un valor vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </div>
                    <div class="agregar-div">
                        <asp:Button ID="btn_confirmar_des" runat="server" Text="Confirmar" OnClick="btn_confirmarDes_Click" ValidationGroup="grupo1" />
                    </div>
                </div>

                <div class="titulo-section">
                    <h1>AGREGAR DISTRIBUIDORA</h1>
                </div>
                <div class="agregar__container">
                    <div class="agregar-div">
                        <p>Nombre</p>
                        <asp:TextBox ID="Nom_Dis_txtBox" runat="server" MaxLength="20" ValidationGroup="grupo2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Dis" runat="server" ControlToValidate="Nom_Dis_txtBox" ErrorMessage="No se puede Agregar un valor vacio" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                    </div>
                    <div class="agregar-div">
                        <asp:Button ID="btn_confirmar_dis" runat="server" Text="Confirmar" OnClick="btn_confirmar_Click" ValidationGroup="grupo2" />
                    </div>
                    <div class="agregar-div">
                        <asp:Label ID="lbl_prueba" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </section>

    </form>
</body>
</html>
