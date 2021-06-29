<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DescripcionJuego.aspx.cs" Inherits="WebApplication1.WebForm3" %>

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
        <asp:ListView ID="ListView1" runat="server" DataSourceID="sdsJuego" GroupItemCount="3">
            <%--<AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">Nombre_J:
                    <asp:Label ID="Nombre_JLabel" runat="server" Text='<%# Eval("Nombre_J") %>' />
                    <br />PU_J:
                    <asp:Label ID="PU_JLabel" runat="server" Text='<%# Eval("PU_J") %>' />
                    <br />Descuento_J:
                    <asp:Label ID="Descuento_JLabel" runat="server" Text='<%# Eval("Descuento_J") %>' />
                    <br />Descripcion_J:
                    <asp:Label ID="Descripcion_JLabel" runat="server" Text='<%# Eval("Descripcion_J") %>' />
                    <br />Imagen_J:
                    <asp:Label ID="Imagen_JLabel" runat="server" Text='<%# Eval("Imagen_J") %>' />
                    <br /></td>
            </AlternatingItemTemplate>--%>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">Nombre_J:
                    <asp:TextBox ID="Nombre_JTextBox" runat="server" Text='<%# Bind("Nombre_J") %>' />
                    <br />PU_J:
                    <asp:TextBox ID="PU_JTextBox" runat="server" Text='<%# Bind("PU_J") %>' />
                    <br />Descuento_J:
                    <asp:TextBox ID="Descuento_JTextBox" runat="server" Text='<%# Bind("Descuento_J") %>' />
                    <br />Descripcion_J:
                    <asp:TextBox ID="Descripcion_JTextBox" runat="server" Text='<%# Bind("Descripcion_J") %>' />
                    <br />Imagen_J:
                    <asp:TextBox ID="Imagen_JTextBox" runat="server" Text='<%# Bind("Imagen_J") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No se han devuelto datos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Nombre_J:
                    <asp:TextBox ID="Nombre_JTextBox" runat="server" Text='<%# Bind("Nombre_J") %>' />
                    <br />PU_J:
                    <asp:TextBox ID="PU_JTextBox" runat="server" Text='<%# Bind("PU_J") %>' />
                    <br />Descuento_J:
                    <asp:TextBox ID="Descuento_JTextBox" runat="server" Text='<%# Bind("Descuento_J") %>' />
                    <br />Descripcion_J:
                    <asp:TextBox ID="Descripcion_JTextBox" runat="server" Text='<%# Bind("Descripcion_J") %>' />
                    <br />Imagen_J:
                    <asp:TextBox ID="Imagen_JTextBox" runat="server" Text='<%# Bind("Imagen_J") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="102px" ImageUrl='<%# Eval("Imagen_J") %>' Width="100px" />
                    <br />
                    <asp:Label ID="Nombre_JLabel" runat="server" Text='<%# Eval("Nombre_J") %>' />
                    <br />
                    <asp:Label ID="PU_JLabel" runat="server" Text='<%# Eval("PU_J") %>' />
                    <br />
                    <asp:Label ID="Descuento_JLabel" runat="server" Text='<%# Eval("Descuento_J") %>' />
                    <br />
                    <asp:Label ID="Descripcion_JLabel" runat="server" Text='<%# Eval("Descripcion_J") %>' />
                    <br />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Nombre_J:
                    <asp:Label ID="Nombre_JLabel" runat="server" Text='<%# Eval("Nombre_J") %>' />
                    <br />PU_J:
                    <asp:Label ID="PU_JLabel" runat="server" Text='<%# Eval("PU_J") %>' />
                    <br />Descuento_J:
                    <asp:Label ID="Descuento_JLabel" runat="server" Text='<%# Eval("Descuento_J") %>' />
                    <br />Descripcion_J:
                    <asp:Label ID="Descripcion_JLabel" runat="server" Text='<%# Eval("Descripcion_J") %>' />
                    <br />Imagen_J:
                    <asp:Label ID="Imagen_JLabel" runat="server" Text='<%# Eval("Imagen_J") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <br />
        <asp:SqlDataSource ID="sdsJuego" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Nombre_J], [PU_J], [Descuento_J], [Descripcion_J], [Imagen_J] FROM [Juegos]"></asp:SqlDataSource>
    </form>
</body>
</html>
