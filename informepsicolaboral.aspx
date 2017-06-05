<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="informepsicolaboral.aspx.cs" Inherits="Proyecto.informepsicolaboral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style type="text/css">
        .auto-style9 {
            font-size: large;
        }
        .auto-style10 {
            width: 64px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table class="nav-justified">
        <tr>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style10"><strong>
                <asp:Button ID="Button1" runat="server" BackColor="#006600" BorderColor="#003300" BorderStyle="Dotted" CssClass="thumbnail" ForeColor="White" OnClick="Button1_Click" Text="Exportar a Excel" />
                </strong></td>
                        <td>
                    <input type="button" name="imprimir" value="Imprimir"  onclick="window.print();" class="thumbnail"></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td>&nbsp;</td>
                        <td><strong>
                            <asp:Label ID="Label1" runat="server" CssClass="auto-style9" Text="Resultados Test de Alerta"></asp:Label>
                            </strong></td>
                        <td><strong>
                            <asp:Label ID="Label2" runat="server" CssClass="auto-style9" Text="Nivel de Cargo"></asp:Label>
                            </strong></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource1">
                                <Series>
                                    <asp:Series ChartType="Pie" Name="Series1" XValueMember="resaler" YValueMembers="IDpsicolaboral">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </td>
                        <td>
                            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="resglo" YValueMembers="IDpsicolaboral">
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
                        <td><strong>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT psicolaboral.rut, trabajador.rut AS Expr1, psicolaboral.IDpsicolaboral, trabajador.IDpersona, trabajador.nombre, trabajador.apellido, psicolaboral.fechaev, psicolaboral.resaler, psicolaboral.resot, psicolaboral.resperllu, psicolaboral.reslu, psicolaboral.resent, psicolaboral.resglo, psicolaboral.alerta FROM psicolaboral INNER JOIN trabajador ON psicolaboral.rut = trabajador.rut"></asp:SqlDataSource>
                </strong></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="text-left">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDpsicolaboral,IDpersona" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="fechaev" HeaderText="fechaev" SortExpression="fechaev" />
                        <asp:BoundField DataField="resaler" HeaderText="resaler" SortExpression="resaler" />
                        <asp:BoundField DataField="resot" HeaderText="resot" SortExpression="resot" />
                        <asp:BoundField DataField="resperllu" HeaderText="resperllu" SortExpression="resperllu" />
                        <asp:BoundField DataField="reslu" HeaderText="reslu" SortExpression="reslu" />
                        <asp:BoundField DataField="resent" HeaderText="resent" SortExpression="resent" />
                        <asp:BoundField DataField="resglo" HeaderText="resglo" SortExpression="resglo" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
