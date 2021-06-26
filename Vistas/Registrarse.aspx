<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <%--<link rel="stylesheet" type="text/css" href="/Css/Estilos.css" />--%>
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
                   <li>
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
        <section>
            <h1>REGISTRO</h1>
            <div>
                <div class="section-div">
                    <p>Nombres</p>
                    <asp:TextBox ID="txt_Nombres" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Nombres" runat="server" ControlToValidate="txt_Nombres" ErrorMessage="Ingrese sus nombres"/>
                </div>
                 <div class="section-div">
                    <p>Apellidos</p>
                     <asp:TextBox ID="txt_Apellidos" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Apellidos" runat="server" ControlToValidate="txt_Apellidos" ErrorMessage="Ingrese sus apellidos"></asp:RequiredFieldValidator>
                </div>
                <div class="section-div">
                    <p>Nombre de usuario</p>
                    <asp:TextBox ID="txt_User" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_NombreUser" runat="server" ControlToValidate="txt_User" ErrorMessage="Ingrese un nombre de usuario"></asp:RequiredFieldValidator>
                </div>
                <div class="section-div">
                    <p>Email</p>
                    <asp:TextBox ID="txt_Email" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="txt_Email" ErrorMessage="Ingrese su email"></asp:RequiredFieldValidator>
                </div>
                <div class="section-div">
                    <p>Telefono</p>
                    <asp:TextBox ID="txt_Telefono" runat="server" TextMode="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Telefono" runat="server" ControlToValidate="txt_Telefono" ErrorMessage="Ingrese su telefono"></asp:RequiredFieldValidator>
                </div>
                <div class="section-div">
                    <p>Fecha Nacimiento</p>
                     <asp:TextBox ID="txt_FechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Nacimiento" runat="server" ControlToValidate="txt_FechaNacimiento" ErrorMessage="Ingrese su Fecha de Nacimiento"></asp:RequiredFieldValidator>
                </div>
                <div class="section-div">
                    <p>Contraseña</p>
                    <asp:TextBox ID="txt_Contraseña" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Contraseña" runat="server" ControlToValidate="txt_Contraseña" ErrorMessage="Ingrese una contraseña"></asp:RequiredFieldValidator>
                </div>
                <div class="section-div">
                    <p>Repetir contraseña</p>
                     <asp:TextBox ID="txt_RepContraseña" runat="server" TextMode="Password"></asp:TextBox>
                     <asp:CompareValidator ID="cv_RepContraseña" runat="server" ControlToCompare="txt_Contraseña" ControlToValidate="txt_RepContraseña" ErrorMessage="Ingrese la misma contraseña"></asp:CompareValidator>
                    <br />
                    <br />
                    <asp:Label ID="lbl_prueba" runat="server"></asp:Label>
                </div>
             <asp:Button ID="Button1" runat="server" Text="Enviar" OnClick="btnRegistrar" />

            </div>
         </section>
    </form>
</body>
</html>
