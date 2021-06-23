﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BMLJuegos.aspx.cs" Inherits="WebApplication1.WebForm9" %>

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
        <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div>
                <asp:GridView ID="grdBMLJuegos" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-top: 0px; margin-bottom: 0px;" OnRowEditing="grdBMLJuegos_RowEditing" OnRowCancelingEdit="grdBMLJuegos_RowCancelingEdit" OnRowUpdating="grdBMLJuegos_RowUpdating" OnSelectedIndexChanged="grdBMLJuegos_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_eit_Nombre" runat="server" Text='<%# Bind("Nombre_J") %>'></asp:TextBox>
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
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_PU_BML" runat="server" Text='<%# Bind("PU_J") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Codigo Desarrolladora">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_eit_CodDes" runat="server" DataSourceID="SQLDS_hardcoded" DataTextField="Codigo_Des" DataValueField="Codigo_Des">
                                </asp:DropDownList>
                                <br />
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
                                <br />
                                <asp:SqlDataSource ID="SQLDS_hardcoded2" runat="server" ConnectionString="<%$ ConnectionStrings:BDJuegosConnectionString %>" SelectCommand="SELECT [Codigo_Dis] FROM [Distribuidoras]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_CodDis_BML" runat="server" Text='<%# Bind("CodigoDis_J") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descuento">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Descuento_eit" runat="server" Text='<%# Bind("Descuento_J") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Descuento_BML" runat="server" Text='<%# Bind("Descuento_J") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Lanzamiento">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_eit_FechaLanzamiento" runat="server" Text='<%# Bind("Fecha_Lanzamiento_J") %>' TextMode="DateTime"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_FechaLanzamiento_BML" DataFormatString="{0:d}" runat="server" Text='<%# Bind("Fecha_Lanzamiento_J") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Descripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Descripcion_eit" runat="server" Text='<%# Bind("Descripcion_J") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Descripcion_BML" runat="server" Text='<%# Bind("Descripcion_J") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <EditItemTemplate>
                                <asp:CheckBox ID="cb_eit_Estado" runat="server" Checked='<%# Bind("Estado_J") %>' />
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Estado" runat="server" Text='<%# Bind("Estado_J") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
            </div>
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
