<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="informemaquinarias.aspx.cs" Inherits="Proyecto.informemaquinarias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style type="text/css">
        .auto-style9 {
            height: 22px;
        }
        .auto-style10 {
            display: inline-block;
            display: block;
            height: auto;
            max-width: 100%;
            padding: 4px;
            line-height: 1.428571429;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 4px;
            -webkit-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
            margin-left: 0;
        }
        .auto-style11 {
            width: 100%;
            height: 39px;
        }
        .auto-style12 {
            height: 22px;
            width: 91px;
        }
        .auto-style13 {
            text-align: center;
            height: 22px;
        }
        .auto-style14 {
            text-align: center;
            height: 301px;
        }
        .auto-style15 {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <table class="auto-style11">
                    <tr>
                        <td class="auto-style12">
                <strong>
                <asp:Button ID="Button1" runat="server" BackColor="#006600" BorderColor="#003300" BorderStyle="Dotted" CssClass="thumbnail" ForeColor="White" OnClick="Button1_Click" Text="Exportar a Excel" />
                </strong>
                        </td>
                        <td class="auto-style9">
                    <input type="button" name="imprimir" value="Imprimir"  onclick="window.print();" class="auto-style10"></td>
                        
                    </tr>
                                        
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT trabajador.IDpersona, maquinaria.IDmaquinaria, trabajador.rut, maquinaria.rut AS Expr1, trabajador.nombre, trabajador.apellido, maquinaria.revateo, maquinaria.revapra, maquinaria.reglo, maquinaria.nota, maquinaria.resultado, maquinaria.comodin FROM trabajador INNER JOIN maquinaria ON trabajador.rut = maquinaria.rut">
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td class="text-left">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="IDpersona,IDmaquinaria" Width="100%" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="revateo" HeaderText="revateo" SortExpression="revateo" />
                        <asp:BoundField DataField="revapra" HeaderText="revapra" SortExpression="revapra" />
                        <asp:BoundField DataField="nota" HeaderText="nota" SortExpression="nota" />
                        <asp:BoundField DataField="resultado" HeaderText="resultado" SortExpression="resultado" />
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
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style13"><strong>
                            <asp:Label ID="Label1" runat="server" CssClass="auto-style11" Text="¿Que Obtuvimos?"></asp:Label>
                            </strong></td>
                        <td class="auto-style13"><strong>
                            <asp:Label ID="Label2" runat="server" CssClass="auto-style12" Text="RANKING"></asp:Label>
                            </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style14">
                            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource3" Palette="Chocolate" Width="400px">
                                <Series>
                                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="resultado" YValueMembers="comodin">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </td>
                        <td class="auto-style14">
                            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource3" Palette="Chocolate" Width="400px">
                                <Series>
                                    <asp:Series ChartType="Bar" Name="Series1" XValueMember="nombre" YValueMembers="nota">
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
            </td>
        </tr>
    </table>
</asp:Content>
