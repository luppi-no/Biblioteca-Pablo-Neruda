<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="personamaquinaria.aspx.cs" Inherits="Proyecto.personamaquinaria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style type="text/css">
        .auto-style9 {
            font-family: calibri;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style9" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" />
                    </Fields>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                </asp:DetailsView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT [rut], [nombre], [apellido] FROM [trabajador] WHERE ([rut] = @rut)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="rut" QueryStringField="code" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT * FROM [maquinaria] WHERE ([rut] = @rut)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="rut" QueryStringField="code" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDmaquinaria" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="IDmaquinaria" HeaderText="IDmaquinaria" InsertVisible="False" ReadOnly="True" SortExpression="IDmaquinaria" />
                        <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                        <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                        <asp:BoundField DataField="especialidad" HeaderText="especialidad" SortExpression="especialidad" />
                        <asp:BoundField DataField="eqeva" HeaderText="eqeva" SortExpression="eqeva" />
                        <asp:BoundField DataField="maeq" HeaderText="maeq" SortExpression="maeq" />
                        <asp:BoundField DataField="moeq" HeaderText="moeq" SortExpression="moeq" />
                        <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                        <asp:BoundField DataField="revateo" HeaderText="revateo" SortExpression="revateo" />
                        <asp:BoundField DataField="revapra" HeaderText="revapra" SortExpression="revapra" />
                        <asp:BoundField DataField="reglo" HeaderText="reglo" SortExpression="reglo" />
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
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
