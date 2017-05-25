<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prueba.aspx.cs" Inherits="Proyecto.prueba" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="aa" runat="server">
    </asp:ScriptManager>
    <div>
        <table>
            <tr>
                <td>
                    Enter Customer ID:
                </td>
                <!--  <td><asp:TextBox Width="180" runat="server" ID="txtparam"/></td> -->
                <td>
                    <asp:Button Text="Show Report" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <rsweb:ReportViewer ID="rptvw" runat="server" Height="800px" Width="1300px">
        </rsweb:ReportViewer>
    </div>


    <table width="100%">
                    <tr>
                        <td colspan="4" style="width: 100%">
                            <p class="title">
                                Búsqueda - Evaluados a Capacitar
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 25%">
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="lblRut" runat="server" Text="Rut  "></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:TextBox ID="tbRut" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td style="width: 25%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 25%">
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="lblNomEvaluado" runat="server" Text="Evaluado  "></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:TextBox ID="tbNomEvaluado" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td style="width: 25%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 25%">
                        </td>
                        <td style="width: 25%">
                            <asp:Label ID="lblCargo" runat="server" Text="Cargo  "></asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:TextBox ID="tbCargo" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td style="width: 25%">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <br />
                            <asp:LinkButton ID="lnkbBuscar" runat="server" OnClick="lnkbBuscar_Click" CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="lnkbLimpiar" runat="server" OnClick="lnkbLimpiar_Click" CssClass="btn btn-danger btneminmedium"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </td>
                    </tr>
                </table>










                <table width="100%">
                    <tr>
                        <td colspan="4" style="width: 100%">
                            <p class="title">
                                Búsqueda - Capacitaciones
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; text-align: right">
                            <asp:Label ID="lblArea" runat="server" Text="Area  "></asp:Label>
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="tbArea" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td style="width: 15%; text-align: right">
                            <asp:Label ID="lblProveedor" runat="server" Text="Proveedor  "></asp:Label>
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="tbProveedor" runat="server" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; text-align: right">
                            <asp:Label ID="lblCentroCosto" runat="server" Text="Centro Costo  "></asp:Label>
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="tbCentroCosto" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td style="width: 15%; text-align: right">
                            <asp:Label ID="lblCapacitacion" runat="server" Text="Capacitación  "></asp:Label>
                        </td>
                        <td style="width: 35%">
                            <asp:TextBox ID="tbCapacitacion" runat="server" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <br />
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkbBuscar_Click" CssClass="btn btn-default btneminmedium"><span class="icon-search"></span>&nbsp;Buscar</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="lnkbLimpiar_Click" CssClass="btn btn-danger btneminmedium"><span class="icon-ban-circle"></span>&nbsp;Quitar Filtro</asp:LinkButton>
                        </td>
                    </tr>
                </table>







    </form>
</body>
</html>
