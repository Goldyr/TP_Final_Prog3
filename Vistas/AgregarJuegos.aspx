<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarJuegos.aspx.cs" Inherits="WebApplication1.WebForm10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="Estilos.css" />
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
            AGREGAR JUEGO<br />
            <br />
            DESARROLLADORA<br />
            Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Nom_Des_txtBox" runat="server"></asp:TextBox>
            <br />
            Codigo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Cod_Des_txtBox" runat="server"></asp:TextBox>
            <br />
            <br />
            DISTRIBUIDORA<br />
            Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Nom_Dis_txtBox" runat="server"></asp:TextBox>
            <br />
            Codigo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Cod_Dis_txtBox" runat="server"></asp:TextBox>
            <br />
            <br />
            JUEGO<br />
            Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Nom_J_txtBox" runat="server"></asp:TextBox>
            <br />
            <!-- Codigo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="Cod_J_txtBox" runat="server"></asp:TextBox> -->
            <br />
            Descripcion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Des_J_txtBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            Imagen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Img_J_txtBox" runat="server"></asp:TextBox>
            <br />
            Fecha Lanzamiento&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="FL_J_txtBox" runat="server" ></asp:TextBox>
            <br />
            Descuento&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Desc_J_txtBox" runat="server" ></asp:TextBox>
            <br />
            Precio&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Pre_J_txtBox" runat="server" ></asp:TextBox>
            <br />
            <br />
            Distribuidora&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddl_Dis_J" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre_Dis" DataValueField="Codigo_Dis">
            </asp:DropDownList>
            <br />
            Desarrolladora
            <asp:DropDownList ID="ddl_Des_J" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre_Des" DataValueField="Codigo_Des">
            </asp:DropDownList>
  
            <div>
                <p>Categoria</p>
                          <asp:CheckBoxList ID="Cat_Cbl_J" runat="server">
            </asp:CheckBoxList>
            </div>
            <br />
            <br />
            <asp:Button ID="btn_confirmar" runat="server" Text="Confirmar" OnClick="btn_confirmar_Click" />
            <br />
            <br />
            <asp:Label ID="lbl_prueba" runat="server"></asp:Label>
            <br />
            <br />
            Esta seccion se accede desde el HyperLink AGREGAR JUEGOS ubicado en OPCIONES DE ADMINISTRADOR<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_Dis], [Codigo_Dis] FROM [Distribuidoras]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Codigo_Des], [Nombre_Des] FROM [Desarrolladores]"></asp:SqlDataSource>
         </div>
    </form>
</body>
</html>
