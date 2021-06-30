<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoUsuario.aspx.cs" Inherits="WebApplication1.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
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
            <h1>INFORMACION DEL USUARIO</h1>
            <p>Usuario :
                <asp:Label ID="lbl_user_IU" runat="server"></asp:Label>
                <asp:TextBox ID="txt_User_IU" runat="server" Visible="False"></asp:TextBox>
            </p>
            <div class="pInfoUsuario__content">
                <div class="pInfoUsuario__content__nombre">
                    <p>Nombres :
                    <asp:label runat="server" id="lblNombre_IU"></asp:label>
                        <asp:TextBox ID="txt_Nombre_IU" runat="server" MaxLength="40" Visible="False"></asp:TextBox>
                    </p>
                    <p>Apellidos :
                        <asp:Label ID="lblApellido_IU" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_Apellidos_IU" runat="server" MaxLength="40" Visible="False"></asp:TextBox>
                    </p>
                </div>
                <div class="pInfoUsuario__content__email">
                    <p>Email : <asp:label runat="server" id="lblEmail_IU"></asp:label>
                    </p>
                </div>
     
                <div class="pInfoUsuario__content__fechaIngreso">
                    <p>Telefono :
                        <asp:Label ID="lblTelefono_IU" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_telefono_IU" runat="server" MaxLength="30" Visible="False"></asp:TextBox>
                    </p>
                    <p>Fecha de Nacimiento :
                        <asp:Label ID="lblFecha_IU" runat="server"></asp:Label>
                    </p>
                    <p>
                        <asp:Button ID="btn_EditarPerfil" runat="server" OnClick="btn_EditarPerfil_Click" Text="Editar Datos" />
&nbsp;<asp:Button ID="btn_cancelar_IU" runat="server" OnClick="btn_cancelar_IU_Click" Text="Cancelar" Visible="False" />
&nbsp;<asp:Button ID="btn_guardar_IU" runat="server" OnClick="btn_guardar_IU_Click" Text="Guardar" Visible="False" />
                    </p>
                    <p>
                        <asp:Label ID="lbl_msg_IU" runat="server"></asp:Label>
                    </p>
                </div>
            </div>
        </section>
        <section>
        <h1>CAMBIAR CONTRASEÑA</h1>
            <p>Ingrese su Contraseña actual
                <asp:TextBox ID="txtContraseñaActual" runat="server" TextMode="Password"></asp:TextBox>
            </p>
            <p>&nbsp;<asp:Button ID="btnIngresar" runat="server" OnClick="btnIngresar_Click" Text="Enviar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblConfirmacion" runat="server"></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblContraseñaNueva" runat="server" Text="Ingrese su nueva Contraseña" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtContraseñaNueva" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="lblContraseñaNueva2" runat="server" Text="Repita su nueva Contraseña" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtContraseñaNueva2" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
&nbsp;<asp:CompareValidator ID="cvContraseña" runat="server" ControlToCompare="txtContraseñaNueva" ControlToValidate="txtContraseñaNueva2" ErrorMessage="CompareValidator" Visible="False">Las contraseñas no son iguales</asp:CompareValidator>
            </p>
            <p>
                <asp:Button ID="btnConfirmacion" runat="server" OnClick="btnConfirmacion_Click" Text="Cambiar" Visible="False" />
&nbsp;&nbsp;&nbsp; </p>
            <p>
                &nbsp;</p>
        </section>
        <section class="pInfoUsuario__historial">
            <h1>HISTORIAL DE COMPRAS</h1>
            <div>
               <h4>GridView<asp:GridView ID="grd_ventas" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_V" DataSourceID="sql_ventas">
                   <Columns>
                       <asp:BoundField DataField="ID_V" HeaderText="N°Ventas" ReadOnly="True" SortExpression="ID_V" />
                       <asp:BoundField DataField="ID_MetodoPago_V" HeaderText="Metodo De Pago" SortExpression="ID_MetodoPago_V" />
                       <asp:BoundField DataField="Fecha_V" HeaderText="Fecha De Compra" SortExpression="Fecha_V" />
                       <asp:BoundField DataField="PrecioTotal_V" HeaderText="Precio Total" SortExpression="PrecioTotal_V" />
                       <asp:TemplateField HeaderText="Detalles">
                           <ItemTemplate>
                               <asp:Button ID="Btn_Detalle" runat="server" CommandArgument='<%# Eval("ID_V") %>' CommandName="Ver_Detalle" OnCommand="Btn_Detalle_Cmd" Text="Ver Detalles" />
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
                   </asp:GridView>
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_DV" DataSourceID="sql_Detallesventas" Visible="False">
                       <Columns>
                           <asp:BoundField DataField="SerieKey_DV" HeaderText="SerieKey_DV" SortExpression="SerieKey_DV" />
                           <asp:BoundField DataField="CodJuego_DV" HeaderText="CodJuego_DV" SortExpression="CodJuego_DV" />
                           <asp:BoundField DataField="Precio_DV" HeaderText="Precio_DV" SortExpression="Precio_DV" />
                           <asp:BoundField DataField="ID_DV" HeaderText="ID_DV" ReadOnly="True" SortExpression="ID_DV" />
                       </Columns>
                   </asp:GridView>
                </h4>
            </div>
        </section>
        <asp:SqlDataSource ID="sql_ventas" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT * FROM [Ventas]"></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="sql_Detallesventas" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [SerieKey_DV], [CodJuego_DV], [Precio_DV], [ID_DV] FROM [DetalleVentas]"></asp:SqlDataSource>
    </form>
</body>
</html>
