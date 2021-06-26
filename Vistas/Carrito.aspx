<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApplication1.WebForm4" %>

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
                   <li class="seleccionado">
                          <a href="Carrito.aspx" class="nav-menu__ul__carrito">
                            <i class="fas fa-shopping-cart"></i>
                            <p>Carrito</p>
                        </a>
                   </li>
       
                </ul>
            </nav>
          </header>
        
           <section>
               <h1>COMPRA</h1>
               <h4>Se accede a esta seccion cuando se hace click sobre "Carrito" en Inicio</h4>
               <h4>Al principio muestra los juegos que el usuario selecciono y el monto total></h4>
               <div>
                    <asp:BulletedList ID="BulletedList1" runat="server">
                    </asp:BulletedList>
               </div>
                <div class="compra">
                    <p>Ingrese numero tarjeta</p>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="Label7" runat="server" Text="Monto a pagar"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="Comprar" />
           </section>
            <section>
                <h1>DETALLES DE COMPRA</h1>
                <h4>Cuando presione el boton COMPRAR, van a aparecer los detalles de la compra</h4>
                <div class="detalles_compra">
                    <asp:Label runat="server" Text="" ID="lblMonto_DC"></asp:Label>
                    <asp:Label runat="server" Text="" ID="lblJuegos_DC"></asp:Label>
                    <asp:Label runat="server" Text="" ID="lblFecha_DC"></asp:Label>
                    <asp:Label runat="server" Text="" ID="lblnFac_DC"></asp:Label>
                    <asp:Label runat="server" Text="" ID="lblKeys_DC"></asp:Label>
                 </div>
            </section>
    </form>
</body>
</html>
