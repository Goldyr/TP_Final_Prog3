<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarMetodosdePago.aspx.cs" Inherits="Vistas.AgregarMetodosdePago" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_Metodo.css" />
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
        <section class="pInfoUsuario">
            <h1>&nbsp;</h1>
            <p>&nbsp;</p>
            <p>
&nbsp;&nbsp;</p>
            <section>
            <h1 id="section-h1__Metodo">Agregar Metodo de Pago</h1>
            <div class="Cuadro_Metodo">
                <div class="sectionMet-div">
                    <p>Metodo de Pago</p>
                    <asp:DropDownList ID="ddl_MP" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre_MP" DataValueField="ID_MP" Height="24px" Width="126px">
                    </asp:DropDownList>
                    <br />
                </div>
                 <div class="sectionMet-div">
                    <p>Numero de Tarjeta </p>
                     <asp:TextBox ID="txt_Nro" runat="server" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Nro" runat="server" ControlToValidate="txt_Nro" ErrorMessage="Ingrese su Numero de tarjeta"></asp:RequiredFieldValidator>
              </div>
                <div class="sectionMet-div">
                    <p>Clave de seguridad</p>
                    <asp:TextBox ID="txt_clave" runat="server" TextMode="SingleLine" MaxLength="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_clave" runat="server" ControlToValidate="txt_clave" ErrorMessage="Ingrese la Clave de Seguridad"></asp:RequiredFieldValidator>
                </div>
                <div class="sectionMet-div">
                    <p>Fecha de Vencimiento</p>
                     <asp:TextBox ID="txt_FechaVencimiento" runat="server" TextMode="Month"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_FechaVencimiento" runat="server" ControlToValidate="txt_FechaVencimiento" ErrorMessage="Ingrese la Fecha de Vencimiento"></asp:RequiredFieldValidator>
                </div>
                <div class="sectionMet-div">
                    <p>Nombres</p>
                    <asp:TextBox ID="txt_Nombres" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Nombres" runat="server" ControlToValidate="txt_Nombres" ErrorMessage="Ingrese los Nombres"></asp:RequiredFieldValidator>
                </div>
                <div class="sectionMet-div">
                    <p>Apellidos</p>
                    <asp:TextBox ID="txt_Apellidos" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Apellidos" runat="server" ControlToValidate="txt_Apellidos" ErrorMessage="Ingrese los Apellidos"></asp:RequiredFieldValidator>
                </div>
                <div class="sectionMet-div">
                    <p>DNI</p>
                    <p>
                    <asp:TextBox ID="txt_DNI" runat="server" MaxLength="8"></asp:TextBox>
                    </p>
                    <asp:RequiredFieldValidator ID="rfv_DNI" runat="server" ControlToValidate="txt_DNI" ErrorMessage="Ingrese el DNI"></asp:RequiredFieldValidator>
                </div>
                <div class="sectionMet-div">
                    <p>Direccion de Facturación</p>
                    <asp:TextBox ID="txt_Direccion" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Direccion" runat="server" ControlToValidate="txt_Direccion" ErrorMessage="Ingrese la Direccción"></asp:RequiredFieldValidator>
                </div>
                <div class="sectionMet-div">
                    <p>Codigo Postal</p>
                     <asp:TextBox ID="txt_CodigoPostal" runat="server" MaxLength="5"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv_CodigoPostal" runat="server"  ControlToValidate="txt_CodigoPostal" ErrorMessage="Ingrese el Codigo Postal"></asp:RequiredFieldValidator>
                </div>
                <div class="sectionMet-div">
                    <p>Email</p>
                    <asp:TextBox ID="txt_Email" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="txt_Email" ErrorMessage="Ingrese el Email"></asp:RequiredFieldValidator>
                </div>
                <div class="sectionMet-div">
                    <p>Telefono</p>
                    <asp:TextBox ID="Txt_Telefono" runat="server" TextMode="Phone" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Telefono" runat="server" ControlToValidate="txt_Telefono" ErrorMessage="Ingrese el Telefono"></asp:RequiredFieldValidator>
                </div>
                
             <asp:Button ID="btn_agregar" runat="server" Text="Agregar" OnClick="btn_agregar_Click" />
                <asp:Label ID="lbl_verif" runat="server" Text=""></asp:Label>
            </div>
         </section>
        </section>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT * FROM [Metodos_Pago]
where Estado_MP = 'true'"></asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
