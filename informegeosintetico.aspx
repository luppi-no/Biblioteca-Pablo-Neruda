<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="informegeosintetico.aspx.cs" Inherits="Proyecto.informegeosintetico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style type="text/css">
        .auto-style9 {
            height: 35px;
        }

        .auto-style10 {
            height: 22px;
        }

        .auto-style11 {
            font-family: calibri;
            font-size: large;
        }

        .auto-style12 {
            font-size: large;
        }

        .auto-style13 {
            width: 100%;
            height: 36px;
        }

        .auto-style14 {
            width: 69px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style9">

                <table class="auto-style13">
                    <tr>
                        <td class="auto-style14">
                            <strong>
                                <asp:Button ID="Button1" runat="server" BackColor="#006600" BorderColor="#003300" BorderStyle="Dotted" CssClass="thumbnail" ForeColor="White" OnClick="Button1_Click" Text="Exportar a Excel" />
                            </strong>
                        </td>
                        <td>
                            <input type="button" name="imprimir" value="Imprimir" onclick="window.print();" class="thumbnail"></td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT geosinteticos.rut, trabajador.nombre, trabajador.apellido, geosinteticos.resevteo, geosinteticos.resevpra, geosinteticos.resglo, geosinteticos.IDgeo, trabajador.IDpersona, trabajador.rut AS Expr1, geosinteticos.Promedio FROM geosinteticos INNER JOIN trabajador ON geosinteticos.rut = trabajador.rut"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td class="text-left">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDgeo,IDpersona" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="resevteo" HeaderText="Evaluación Teórica" SortExpression="resevteo" />
                        <asp:BoundField DataField="resevpra" HeaderText="Evaluación Práctica" SortExpression="resevpra" />
                        <asp:BoundField DataField="Promedio" HeaderText="Promedio" SortExpression="Promedio" />
                        <asp:BoundField DataField="resglo" HeaderText="Resultado Global" SortExpression="resglo" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
        <table class="nav-justified">
            <tr>
                <td><strong>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style11" Text="¿Que Obtuvimos?"></asp:Label>
                </strong></td>
                <td>
                    <strong>
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style12" Text="RANKING"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" OnLoad="Chart1_Load" Palette="SeaGreen" Width="400px">
                        <Series>
                            <asp:Series ChartType="Pie" Name="Series1" XValueMember="resglo" YValueMembers="IDgeo">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
                <td class="auto-style10">
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Palette="SeaGreen" Width="400px">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1" XValueMember="nombre" YValueMembers="Promedio">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </table>

</asp:Content>
