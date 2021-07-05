﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarJuegos.aspx.cs" Inherits="WebApplication1.WebForm10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>New Wave Games</title>
    <link rel="icon" type="image/png" href="/imagenes/favicon/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_AgregarJuegos.css" />
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
        <section class="sAgregarJuegos">
            <div class="AgregarJuegos_wrapper">
                <div class="titulo-section">
                    <h1>AGREGAR JUEGOS</h1>
                </div>
                <div class="AgregarJuegos__container">
                    <div class="AgregarJuegos__div">
                        <p>Nombre</p>
                        <asp:TextBox ID="Nom_J_txtBox" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Nombre" runat="server" ControlToValidate="Nom_J_txtBox" ErrorMessage="Ingrese un nombre"></asp:RequiredFieldValidator>
                    </div>
                    <div class="AgregarJuegos__div">
                        <p>Descripcion</p>
                        <asp:TextBox ID="Des_J_txtBox" runat="server" Height="43px" MaxLength="300"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Descripcion" runat="server" ControlToValidate="Des_J_txtBox" ErrorMessage="Ingrese una descripcion"></asp:RequiredFieldValidator>
                    </div>
                    <div class="AgregarJuegos__div">
                        <p>Imagen</p>
                        <asp:TextBox ID="Img_J_txtBox" runat="server" MaxLength="70"></asp:TextBox>
                    </div>
                    <div class="AgregarJuegos__div">
                        <p>Fecha Lanzamiento</p>
                        <asp:TextBox ID="FL_J_txtBox" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Fecha" runat="server" ControlToValidate="FL_J_txtBox" ErrorMessage="Ingrese una Fecha de Lanzamiento"></asp:RequiredFieldValidator>
                    </div>
                    <div class="AgregarJuegos__div">
                        <p>Descuento</p>
                        <asp:TextBox ID="Desc_J_txtBox" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Descuento" runat="server" ControlToValidate="Desc_J_txtBox" ErrorMessage="Ingrese un Descuento"></asp:RequiredFieldValidator>
                    </div>
                    <div class="AgregarJuegos__div">
                        <p>Precio</p>
                        <asp:TextBox ID="Pre_J_txtBox" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Precio" runat="server" ControlToValidate="Pre_J_txtBox" ErrorMessage="Ingrese un Precio"></asp:RequiredFieldValidator>
                    </div>
                    <div class="AgregarJuegos__div">
                        <p>Distribuidora</p>
                        <asp:DropDownList ID="ddl_Dis_J" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre_Dis" DataValueField="Codigo_Dis">
                        </asp:DropDownList>
                    </div>
                    <div class="AgregarJuegos__div">
                        <p>Desarrolladora</p>
                        <asp:DropDownList ID="ddl_Des_J" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre_Des" DataValueField="Codigo_Des">
                        </asp:DropDownList>
                    </div>
                    <div class="AgregarJuegos__div">
                        <p>Categorias</p>
                        <asp:CheckBoxList ID="Cat_Cbl_J" runat="server">
                        </asp:CheckBoxList>
                    </div>
                    <div class="AgregarJuegos__div-botones">
                        <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar" OnClick="btn_confirmar_Click" />
                        <asp:Label ID="lbl_prueba" runat="server"></asp:Label>
                    </div>

                </div>
            </div>

        </section>
        <div>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_Dis], [Codigo_Dis] FROM [Distribuidoras]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Codigo_Des], [Nombre_Des] FROM [Desarrolladores]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
