<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BMLJuegos.aspx.cs" Inherits="WebApplication1.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/Estilos.css" />
    <link rel="stylesheet" type="text/css" href="/css/P_BMLJuego.css" />
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
                       <span class="nav-menu__span1"></span>
                       <span class="nav-menu__span2"></span>
                       <span class="nav-menu__span3"></span>
                       <span class="nav-menu__span4"></span>
                        Inicio</a>
                   </li>

                    <li>
                       <a href="Contacto.aspx">
                       <span class="nav-menu__span1"></span>
                       <span class="nav-menu__span2"></span>
                       <span class="nav-menu__span3"></span>
                       <span class="nav-menu__span4"></span>Contacto</a>
                   </li>
                   <li>
                       <a href="Carrito.aspx" class="nav-menu__ul__carrito">
                       <span class="nav-menu__span1"></span>
                       <span class="nav-menu__span2"></span>
                       <span class="nav-menu__span3"></span>
                       <span class="nav-menu__span4"></span>
                         
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </header>

        <section class="sectionBML">
            <div class="sectionBML_container">
                <div class="sectionBML_rb">
                    <asp:RadioButtonList ID="rbl_Tipolistado" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbl_Tipolistado_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="0">Mostrar todos</asp:ListItem>
                    <asp:ListItem Value="1">Mostrar solo activos</asp:ListItem>
                    <asp:ListItem Value="2">Busqueda</asp:ListItem>
                </asp:RadioButtonList>
                </div>
                <div class="sectionBML_filtro">

                <asp:Label ID="Label1" runat="server" Text="FIltro busqueda:"></asp:Label>
                <asp:TextBox ID="tb_Busqueda" runat="server" AutoPostBack="True" OnTextChanged="tb_Busqueda_TextChanged"></asp:TextBox>

                </div>
           

                <div class="sectionBML_wrapper">
                    <asp:GridView ID="grdBMLJuegos" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" Style="margin-top: 0px; margin-bottom: 0px;" OnRowEditing="grdBMLJuegos_RowEditing" OnRowCancelingEdit="grdBMLJuegos_RowCancelingEdit" OnRowUpdating="grdBMLJuegos_RowUpdating" OnRowDeleting="grdBMLJuegos_RowDeleting">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick="return confirm('Estas seguro que vas a borrar este campo?');">Eliminar </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_Nombre" runat="server" Text='<%# Bind("Nombre_J") %>'></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="rfv_eit_Nombre" runat="server" ControlToValidate="txt_eit_Nombre">** No se permite un nombre vacio</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Nombre_BML" runat="server" Text='<%# Bind("Nombre_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Codigo">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_eit_CodJuego" runat="server" Text='<%# Bind("Codigo_J") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_CodigoJuego_BML" runat="server" Text='<%# Bind("Codigo_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Precio Unitario">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_PU_eit" runat="server" Text='<%# Bind("PU_J") %>'></asp:TextBox>

                                    <asp:CompareValidator ID="cv_eit_PU" runat="server" ControlToValidate="txt_PU_eit" Operator="GreaterThan" Type="Double" ValueToCompare="0">** El precio unitario tiene que ser mayor a 0</asp:CompareValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_PU_BML" runat="server" Text='<%# Bind("PU_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Codigo Desarrolladora">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_eit_CodDes" runat="server" DataSourceID="SQLDS_hardcoded" DataTextField="Codigo_Des" DataValueField="Codigo_Des">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SQLDS_hardcoded" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Codigo_Des] FROM [Desarrolladores]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_CodDes_BML" runat="server" Text='<%# Bind("CodigoDes_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Codigo Distribuidora">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_eit_CodDis" runat="server" DataSourceID="SQLDS_hardcoded2" DataTextField="Codigo_Dis" DataValueField="Codigo_Dis">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SQLDS_hardcoded2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Codigo_Dis] FROM [Distribuidoras]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_CodDis_BML" runat="server" Text='<%# Bind("CodigoDis_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Descuento">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Descuento_eit" runat="server" Text='<%# Bind("Descuento_J") %>'></asp:TextBox>

                                    <asp:CompareValidator ID="cv_eit_Descuento" runat="server" ControlToValidate="txt_Descuento_eit" Operator="GreaterThan" Type="Integer" ValueToCompare="-1">**El valor en descuento no puede ser negativo</asp:CompareValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Descuento_BML" runat="server" Text='<%# Bind("Descuento_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha Lanzamiento">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_eit_FechaLanzamiento" runat="server" Text='<%# Bind("Fecha_Lanzamiento_J") %>' TextMode="DateTime"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="rfv_eit_Fecha" runat="server" ControlToValidate="txt_eit_FechaLanzamiento">** Ingresar una fecha valida</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_FechaLanzamiento_BML" DataFormatString="{0:d}" runat="server" Text='<%# Bind("Fecha_Lanzamiento_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Descripcion">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Descripcion_eit" runat="server" Text='<%# Bind("Descripcion_J") %>'></asp:TextBox>


                                    <asp:CustomValidator ID="cv_eit_Desc" runat="server" ControlToValidate="txt_Descripcion_eit" OnServerValidate="cv_eit_Desc_ServerValidate">** Solo se permiten un maximo de 300 caracteres</asp:CustomValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Descripcion_BML" runat="server" Text='<%# Bind("Descripcion_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="cb_eit_Estado" runat="server" Checked='<%# Bind("Estado_J") %>' />

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Estado" runat="server" Text='<%# Bind("Estado_J") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </section>

    </form>
</body>
</html>
