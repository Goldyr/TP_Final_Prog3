<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpcionesAdmin.aspx.cs" Inherits="WebApplication1.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_OpcAdmin.css" />

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
            <div class="Cuadro_Opciones">
                <a class="admin" href="BMLJuegos.aspx">EDITAR/ELIMINAR JUEGOS</a>

                <a class="admin" href="AgregarJuegos.aspx">AGREGAR JUEGOS</a>

                <a class="admin" href="AgregarDisDes.aspx">AGREGAR DISTRIBUIDORA Y DESARROLLADORA</a>
            </div>
        </section>

        <section class="S_Keys">
            <div class="Cuadro_Keys">

                <div class="Interior_Keys">
                    <h1>AGREGAR KEYS</h1>
                    <p>Ingrese ID de juego</p>
                    
                    <div class="Interior_Keys_Div">
                    <asp:TextBox ID="txt_ID" runat="server"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" />                 
                    <asp:RequiredFieldValidator ID="rfvJuego" runat="server" ControlToValidate="txt_ID" ValidationGroup="key">Ingrese el id de un juego</asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="Interior_Keys_Div">
                        <p>Juego:</p>
                        <asp:Label ID="lblJuego" runat="server"></asp:Label>
                    </div>

                    <div class="Interior_Keys_Div">
                        <p>Cantidad de Keys:</p>
                        <asp:Label ID="lblKeys" runat="server"></asp:Label>
                    </div>

                    <p>Agregar Keys</p>
                    <asp:TextBox ID="txt_serialkey" runat="server" ValidationGroup="key" Font-Size="X-Large" Height="102px" TextMode="MultiLine" Width="254px"></asp:TextBox>
                    <asp:Button ID="btn_agregarkey" runat="server" OnClick="btn_agregarkey_Click" Text="Agregar" ValidationGroup="key" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_serialkey" ErrorMessage="RequiredFieldValidator" ValidationGroup="key">Debe ingresar una serial</asp:RequiredFieldValidator>

                    <asp:Label ID="lbl_key" runat="server"></asp:Label>

                </div>
               
            </div>

             <div class="Cuadro_Keys">
                    <h1> ESTADISTICAS </h1>
                    <asp:Label ID="Label1" runat="server" Text="Cantidad de usuarios activos: "></asp:Label>
                    <asp:Label ID="lbl_Stat1" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Precio promedio de los juegos:  "></asp:Label>
                    <asp:Label ID="lbl_Stat2" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="El juego mas vendido es "></asp:Label>
                    <asp:Label ID="lbl_Stat3" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Edad promedio de los usuarios "></asp:Label>
                    <asp:Label ID="lbl_Stat4" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Total hecho en ventas ="></asp:Label>
                    <asp:Label ID="lbl_Stat5" runat="server" Text="Label"></asp:Label>
                </div>
        </section>

    </form>
</body>
</html>
