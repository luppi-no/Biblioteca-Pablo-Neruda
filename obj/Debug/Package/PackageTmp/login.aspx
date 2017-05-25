<%@ Page Title="" Language="C#" MasterPageFile="~/Ingreso.Master" AutoEventWireup="true"
    CodeBehind="login.aspx.cs" Inherits="Proyecto.login" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Ingresar
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentLeft" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="server">
    <div>
        <p class="title">
            Ingresar</p>
        <br />
        <table width="100%">
            <tbody>
                <tr>
                    <td width="25%">
                        <asp:Label ID="lblUsuario" runat="server" Text="* Usuario"></asp:Label>
                    </td>
                    <td width="70%">
                        <asp:TextBox ID="tbUsuario" runat="server" placeholder="Ingrese Usuario (Ej: 12345678-9)" MaxLength="10"
                            Width="100%"></asp:TextBox>
                    </td>
                    <td width="5%">
                        <%--<asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ErrorMessage="(*)" ValidationGroup="vgLogin"
                            ControlToValidate="tbUsuario"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td width="25%">
                        <asp:Label ID="lblPassword" runat="server" Text="* Contraseña"></asp:Label>
                    </td>
                    <td width="70%">
                        <asp:TextBox ID="tbPassword" runat="server" placeholder="Ingrese Contraseña" Width="100%"
                            TextMode="Password"></asp:TextBox>
                    </td>
                    <td width="5%">
                        <%--<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="(*)" ValidationGroup="vgLogin"
                            ControlToValidate="tbPassword"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Label ID="lblObligatorios" runat="server" Text="Los campos con (*) son obligatorios."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="btn btn-default btn-emin"
                            OnClick="btnIngresar_Click" CausesValidation="true" ValidationGroup="vgLogin"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
