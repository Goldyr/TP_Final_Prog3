<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarJuegos.aspx.cs" Inherits="WebApplication1.WebForm10" %>

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
         <header class="main-header">
            <nav class="main-header__nav-menu">
                <ul class="nav-menu">
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
          
                    <li>
                        <asp:TextBox runat="server" ID="tbPrueba" Text="Buscar"></asp:TextBox>
                    </li>
                </ul>
            </nav>
          </header>
        <div>
            <h1>AGREGAR JUEGOS</h1>
              <h4>Esta seccion se accede desde el HyperLink AGREGAR JUEGOS ubicado en OPCIONES DE ADMINISTRADOR</h4>
            <div class="AgregarJuegos__div">
                <p>Nombre</p>
                 <asp:TextBox ID="Nom_J_txtBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_Nombre" runat="server" ControlToValidate="Nom_J_txtBox" ErrorMessage="Ingrese un nombre"></asp:RequiredFieldValidator>
            </div>
            <div class="AgregarJuegos__div">
                <p>Descripcion</p>
                  <asp:TextBox ID="Des_J_txtBox" runat="server" Height="43px" MaxLength="400"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_Descripcion" runat="server" ControlToValidate="Des_J_txtBox" ErrorMessage="Ingrese una descripcion"></asp:RequiredFieldValidator>
            </div>
            <div class="AgregarJuegos__div">
                <p>Imagen</p>
                <asp:TextBox ID="Img_J_txtBox" runat="server"></asp:TextBox>
            </div>
            <div class="AgregarJuegos__div">
                <p>Fecha Lanzamiento</p>
                 <asp:TextBox ID="FL_J_txtBox" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_Fecha" runat="server" ControlToValidate="FL_J_txtBox" ErrorMessage="Ingrese una Fecha de Lanzamiento"></asp:RequiredFieldValidator>
            </div >
            <div class="AgregarJuegos__div">
                <p>Descuento</p>
                <asp:TextBox ID="Desc_J_txtBox" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_Descuento" runat="server" ControlToValidate="Desc_J_txtBox" ErrorMessage="Ingrese un Descuento"></asp:RequiredFieldValidator>
            </div>
            <div class="AgregarJuegos__div">
                <p>Precio</p>
                <asp:TextBox ID="Pre_J_txtBox" runat="server" ></asp:TextBox>
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

   
   
            <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar" OnClick="btn_confirmar_Click" />
        
            <asp:Label ID="lbl_prueba" runat="server"></asp:Label>
       
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_Dis], [Codigo_Dis] FROM [Distribuidoras]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Codigo_Des], [Nombre_Des] FROM [Desarrolladores]"></asp:SqlDataSource>
         </div>
    </form>
</body>
</html>
