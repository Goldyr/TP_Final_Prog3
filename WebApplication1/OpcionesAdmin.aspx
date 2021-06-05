<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpcionesAdmin.aspx.cs" Inherits="WebApplication1.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css" />
</head>
<body>
    <ul class="menu">
        <a href="Inicio.aspx"><li>Inicio</li></a>
        <a href="InfoUsuario.aspx"><li>Info.Usuario</li></a>
        <a href="Contacto.aspx"><li>Contacto</li></a>
        <a href="Carrito.aspx"><li>Carrito</li></a>
        <a href="Registrarse.aspx"><li>Registrarse</li></a>
    </ul>
    <form id="form1" runat="server">
        <a class="admin" href="BMLJuegos.aspx">Formulario para EDITAR/ELIMINAR JUEGOS*</a>
        <br />
        <br />
        <a class="admin" href="AgregarJuegos.aspx">Formulario para AGREGAR JUEGOS**</a>
        <br />
        <br />
        AGREGAR KEYS<br />
        <div>
            Ingrese ID de juego <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            --descripcion del juego y cantidad de keys, del ID buscado--<br />
            <br />
            Agregar Keys
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Number"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <br />
            Esta Seccion se accede desde OPCIONES DE ADMINISTRADOR en Inicio<br />
            *Este HyperLink dirije a un formulario que permite editar,eliminar y agregar juegos<br />
            **Este Hyperlink dirije a un formlario para agregar juego<br />
            <br />
            Tambien se puede buscar un juego, que al encontrarlo te da la descripcion y la cantidad de Keys. Permite agregarle Keys</div>
    </form>
</body>
</html>
