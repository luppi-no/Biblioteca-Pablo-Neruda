<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="inicio.aspx.cs" Inherits="Proyecto.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Administración de Evaluaciones
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#inicio"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <table style="width: 100%;">
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                </tr>
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                </tr>
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Enviar Mail</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                </tr>
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                    <td width="33.33%" style="text-align: center">
                        &nbsp;</td>
                    <td width="33.33%" style="text-align: center">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
