<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarDisDes.aspx.cs" Inherits="Vistas.AgregarDisDes" %>

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
        <div>
            AGREGAR DESARROLLADORA<br />
            <br />
            Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Nom_Des_txtBox" runat="server" MaxLength="20" ValidationGroup="grupo1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_des" runat="server" ControlToValidate="Nom_Des_txtBox" ErrorMessage="No se puede Agregar un valor vacio" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btn_confirmar_des" runat="server" Text="Confirmar" OnClick="btn_confirmarDes_Click" ValidationGroup="grupo1" />
            <br />
            <br />
            AGREGAR
            DISTRIBUIDORA<br />
            <br />
            Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Nom_Dis_txtBox" runat="server" MaxLength="20" ValidationGroup="grupo2" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rfv_Dis" runat="server" ControlToValidate="Nom_Dis_txtBox" ErrorMessage="No se puede Agregar un valor vacio" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btn_confirmar_dis" runat="server" Text="Confirmar" OnClick="btn_confirmar_Click" ValidationGroup="grupo2" />
            <br />
            <br />
            <asp:Label ID="lbl_prueba" runat="server"></asp:Label>
            <br />
            <br />
            Esta seccion se accede desde el HyperLink AGREGAR DESARROLLADORA Y DISTRIBUIDORA ubicado en OPCIONES DE ADMINISTRADOR</div>
    </form>
</body>
</html>
