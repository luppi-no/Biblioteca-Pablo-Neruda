<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Informe.aspx.cs" Inherits="Proyecto.Informe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="text-left">
        <br />
    </div>
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td><strong>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT * FROM [trabajador]"></asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" BackColor="#006600" BorderColor="#003300" BorderStyle="Dotted" CssClass="thumbnail" ForeColor="White" OnClick="Button1_Click" Text="Exportar a Excel" />
            </strong></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="text-left">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="thumbnail" DataKeyNames="IDpersona" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="IDpersona" HeaderText="IDpersona" InsertVisible="False" ReadOnly="True" SortExpression="IDpersona" />
                        <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                        <asp:BoundField DataField="fnac" HeaderText="fnac" SortExpression="fnac" />
                        <asp:BoundField DataField="region" HeaderText="region" SortExpression="region" />
                        <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad" />
                        <asp:BoundField DataField="nfijo" HeaderText="nfijo" SortExpression="nfijo" />
                        <asp:BoundField DataField="nmovil" HeaderText="nmovil" SortExpression="nmovil" />
                        <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                        <asp:BoundField DataField="licencia" HeaderText="licencia" SortExpression="licencia" />
                        <asp:BoundField DataField="nestudio" HeaderText="nestudio" SortExpression="nestudio" />
                        <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                        <asp:BoundField DataField="fingreso" HeaderText="fingreso" SortExpression="fingreso" />
                        <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
                        <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo" />
                        <asp:BoundField DataField="especialidad" HeaderText="especialidad" SortExpression="especialidad" />
                        <asp:BoundField DataField="certificacion" HeaderText="certificacion" SortExpression="certificacion" />
                        <asp:BoundField DataField="ecargo" HeaderText="ecargo" SortExpression="ecargo" />
                        <asp:BoundField DataField="emineria" HeaderText="emineria" SortExpression="emineria" />
                        <asp:BoundField DataField="eemin" HeaderText="eemin" SortExpression="eemin" />
                        <asp:BoundField DataField="pretension" HeaderText="pretension" SortExpression="pretension" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
