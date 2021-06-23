﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpcionesAdmin.aspx.cs" Inherits="WebApplication1.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header class="main-header">
            <nav class="main-header__nav-menu">
                <ul class="nav-menu">
                   <li>
                       <a href="Inicio.aspx">Inicio</a>
                   </li>
                   <li>
                       <a href="InfoUsuario.aspx">Info.Usuario</a>
                   </li>
                   <li>
                       <a href="Contacto.aspx">Contacto</a>
                   </li>
                   <li>
                       <a href="Carrito.aspx">Carrito</a>
                   </li>
                   <li>
                        <a href="Registrarse.aspx">Registrarse</a>
                   </li>
                </ul>
            </nav>
          </header>
        <a class="admin" href="BMLJuegos.aspx">Formulario para EDITAR/ELIMINAR JUEGOS*</a>
        <br />
        <br />
        <a class="admin" href="AgregarJuegos.aspx">Formulario para AGREGAR JUEGOS**</a>
        <br />
        <br />
        <a class="admin" href="AgregarDisDes.aspx">Formulario para AGREGAR DISTRIBUIDORA Y DESARROLLADORA***</a>
        <br />
        <br />
        AGREGAR KEYS<br />
        <div>
            Ingrese ID de juego <asp:TextBox ID="txt_ID" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_ID" ErrorMessage="RequiredFieldValidator" ValidationGroup="key">Debe ingresar el id de juego</asp:RequiredFieldValidator>
            <br />
            <br />
            Juego: <asp:Label ID="lblJuego" runat="server"></asp:Label>
&nbsp;&nbsp; Cantidad de Keys:
            <asp:Label ID="lblKeys" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            Agregar Keys
            <asp:TextBox ID="txt_serialkey" runat="server" ValidationGroup="key" Font-Size="X-Large" Height="102px" TextMode="MultiLine" Width="254px"></asp:TextBox>
            <asp:Button ID="btn_agregarkey" runat="server" OnClick="btn_agregarkey_Click" Text="Agregar" ValidationGroup="key" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_serialkey" ErrorMessage="RequiredFieldValidator" ValidationGroup="key">Debe ingresar una serial</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="lbl_key" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            Esta Seccion se accede desde OPCIONES DE ADMINISTRADOR en Inicio<br />
            *Este HyperLink dirije a un formulario que permite editar,eliminar y agregar juegos<br />
            **Este Hyperlink dirije a un formlario para agregar juego<br />
            ***este Hyperlink dirije a un formulario para agregar desarrolladoras y distribuidoras<br />
            <br />
            Tambien se puede buscar un juego, que al encontrarlo te da la descripcion y la cantidad de Keys. Permite agregarle Keys</div>
    </form>
</body>
</html>
