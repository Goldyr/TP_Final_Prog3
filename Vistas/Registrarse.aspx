<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="WebApplication1.WebForm1" %>

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
        <section>
            <h1>REGISTRO</h1>
            <div>
                <div>
                    <p>Nombres</p>
                    <asp:TextBox ID="txt_Nombres" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Nombres" runat="server" ControlToValidate="txt_Nombres" ErrorMessage="Ingrese sus nombres"/>
                </div>
                 <div>
                    <p>Apellidos</p>
                     <asp:TextBox ID="txt_Apellidos" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Apellidos" runat="server" ControlToValidate="txt_Apellidos" ErrorMessage="Ingrese sus apelldios"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <p>Nombre de usuario</p>
                    <asp:TextBox ID="txt_User" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_NombreUser" runat="server" ControlToValidate="txt_User" ErrorMessage="Ingrese un nombre de usuario"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <p>Email</p>
                    <asp:TextBox ID="txt_Email" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="txt_Email" ErrorMessage="Ingrese su email"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <p>Telefono</p>
                    <asp:TextBox ID="txt_Telefono" runat="server" TextMode="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Telefono" runat="server" ControlToValidate="txt_Telefono" ErrorMessage="Ingrese su telefono"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <p>Fecha Nacimiento</p>
                     <asp:TextBox ID="txt_FechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Nacimiento" runat="server" ControlToValidate="txt_FechaNacimiento" ErrorMessage="Ingrese su Fecha de Nacimiento"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <p>Contraseña</p>
                    <asp:TextBox ID="txt_Contraseña" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Contraseña" runat="server" ControlToValidate="txt_Contraseña" ErrorMessage="Ingrese una contraseña"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <p>Repetir contraseña</p>
                     <asp:TextBox ID="txt_RepContraseña" runat="server" TextMode="Password"></asp:TextBox>
                     <asp:CompareValidator ID="cv_RepContraseña" runat="server" ControlToCompare="txt_Contraseña" ControlToValidate="txt_RepContraseña" ErrorMessage="Ingrese la misma contraseña"></asp:CompareValidator>
                </div>
             <asp:Button ID="Button1" runat="server" Text="Enviar" />

            </div>
         </section>
    </form>
</body>
</html>
