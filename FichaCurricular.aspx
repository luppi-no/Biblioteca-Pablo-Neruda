<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FichaCurricular.aspx.cs" Inherits="Proyecto.WebForm8" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style7 {
            font-family: calibri;
            font-size: xx-large;
        }
        .auto-style8 {
            height: 23px;
            width: 689px;
        }
        .auto-style9 {
            width: 689px;
        }
        .auto-style10 {
            height: 13px;
            width: 689px;
        }
        .auto-style11 {
            height: 23px;
            width: 70px;
        }
        .auto-style12 {
            width: 70px;
        }
        .auto-style13 {
            height: 13px;
            width: 70px;
        }
        .auto-style14 {
            font-family: Arial;
        }
        .auto-style15 {
            height: 23px;
            width: 689px;
            text-align: center;
        }
        .auto-style16 {
            font-family: arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style8">
                    <strong>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style7" Text="Ficha "></asp:Label>
                    </strong>
                </td>
                <td class="auto-style11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style9">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style14" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="100%" Width="100%">
                        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <Fields>
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
                            <asp:BoundField DataField="emineria" HeaderText="emineria" SortExpression="emineria" />
                            <asp:BoundField DataField="ecargo" HeaderText="ecargo" SortExpression="ecargo" />
                            <asp:BoundField DataField="eemin" HeaderText="eemin" SortExpression="eemin" />
                            <asp:BoundField DataField="pretension" HeaderText="pretension" SortExpression="pretension" />
                        </Fields>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    </asp:DetailsView>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:DynamicField DataField="foto" HeaderText="foto" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT rut, nombre, apellido, fnac, region, ciudad, nfijo, nmovil, mail, licencia, nestudio, titulo, foto, fingreso, area, cargo, especialidad, certificacion, emineria, ecargo, eemin, pretension FROM trabajador WHERE (rut = @rut)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="rut" QueryStringField="code" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    &nbsp;</td>
                <td class="auto-style10">
                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style16" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
                        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="resent" HeaderText="resent" SortExpression="resent" />
                            <asp:BoundField DataField="resglo" HeaderText="resglo" SortExpression="resglo" />
                            <asp:BoundField DataField="fechaev" HeaderText="fechaev" SortExpression="fechaev" />
                            <asp:BoundField DataField="resot" HeaderText="resot" SortExpression="resot" />
                            <asp:BoundField DataField="resperllu" HeaderText="resperllu" SortExpression="resperllu" />
                            <asp:BoundField DataField="reslu" HeaderText="reslu" SortExpression="reslu" />
                        </Fields>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT [resent], [resglo], [fechaev], [resot], [resperllu], [reslu] FROM [psicolaboral] WHERE ([rut] = @rut)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="rut" QueryStringField="code" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
                <td class="auto-style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    </td>
                <td class="auto-style8">
                    <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style16" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
                        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                            <asp:BoundField DataField="resevteo" HeaderText="resevteo" SortExpression="resevteo" />
                            <asp:BoundField DataField="resevpra" HeaderText="resevpra" SortExpression="resevpra" />
                            <asp:BoundField DataField="Promedio" HeaderText="Promedio" SortExpression="Promedio" />
                            <asp:BoundField DataField="resglo" HeaderText="resglo" SortExpression="resglo" />
                        </Fields>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT [fecha], [resevteo], [resevpra], [Promedio], [resglo] FROM [geosinteticos] WHERE ([rut] = @rut)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="rut" QueryStringField="code" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                </td>
                <td class="auto-style8">
                    
                    <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style16" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%">
                        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <Fields>
                            <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                            <asp:BoundField DataField="especialidad" HeaderText="especialidad" SortExpression="especialidad" />
                            <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                            <asp:BoundField DataField="revateo" HeaderText="revateo" SortExpression="revateo" />
                            <asp:BoundField DataField="revapra" HeaderText="revapra" SortExpression="revapra" />
                            <asp:BoundField DataField="resultado" HeaderText="resultado" SortExpression="resultado" />
                            <asp:BoundField DataField="nota" HeaderText="nota" SortExpression="nota" />
                        </Fields>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CapitalhumanoConnectionString %>" SelectCommand="SELECT [fecha], [especialidad], [categoria], [revateo], [revapra], [resultado], [nota] FROM [maquinaria] WHERE ([rut] = @rut)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="rut" QueryStringField="code" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    </td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                </td>
                <td class="auto-style15">
                    <input type="button" name="imprimir" value="Imprimir" onclick="window.print();">
                </td>
                <td class="auto-style11">
                    &nbsp;</td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>
