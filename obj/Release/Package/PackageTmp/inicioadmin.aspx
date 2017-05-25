<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="inicioadmin.aspx.cs" Inherits="Proyecto.inicioadmin" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Title">
    EMIN - Administración Global
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#inicio"><span class="icon-home"></span>&nbsp;Administración</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <table style="width: 100%;">
                <tr style="height: 100px;">
                    <td width="50%" style="text-align: center">
                    </td>
                    <td width="50%" style="text-align: center">
                    </td>
                </tr>
                <tr style="height: 100px;">
                    <td width="50%" style="text-align: center">
                        <asp:LinkButton ID="lnkbAdminEvaluacion" runat="server" CssClass="btn-link btn-lg"
                            OnClick="lnkbAdminEvaluacion_Click"><span class="icon-link"></span>&nbsp;Administración de Evaluaciones</asp:LinkButton>
                    </td>
                    <td width="50%" style="text-align: center">
                        <asp:LinkButton ID="lnkbAdminCapacitacion" runat="server" CssClass="btn-link btn-lg"
                            OnClick="lnkbAdminCapacitacion_Click"><span class="icon-link"></span>&nbsp;Administración de Capacitaciones</asp:LinkButton>
                    </td>
                </tr>
                <tr style="height: 100px;">
                    <td width="50%" style="text-align: center">
                    </td>
                    <td width="50%" style="text-align: center">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
