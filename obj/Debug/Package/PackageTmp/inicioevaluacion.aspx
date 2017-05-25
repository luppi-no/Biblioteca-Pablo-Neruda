<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="inicioevaluacion.aspx.cs" Inherits="Proyecto.inicioevaluacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Inicio de Evaluación
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#inicioevaluacion"><span class="icon-home"></span>&nbsp;Menú
                Principal</a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <asp:Label ID="lblApePatNombre" runat="server" Text=""></asp:Label>&nbsp;<span class="icon-cog"></span>
            </a>
                <ul class="dropdown-menu" style="text-align: center">
                    <asp:LinkButton ID="lnkbSalir" runat="server" OnClick="lnkbSalir_Click"><span class="icon-off">
                    </span>&nbsp;Salir</asp:LinkButton>
                </ul>
            </li>
        </ul>
        <div class="tab-content">
            <br />
            <table style="width: 100%;">
                <tr style="height: 100px;">
                    <td width="50%" style="text-align: center">
                        <asp:LinkButton ID="lnkbEvaluaciones" runat="server" OnClick="lnkbEvaluaciones_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Mis Evaluaciones</asp:LinkButton>
                    </td>
                    <td width="50%" style="text-align: center">
                        <asp:LinkButton ID="lnkbInformes" runat="server" CssClass="btn-link btn-lg" OnClick="lnkbInformes_Click"
                            Visible="false"><span class="icon-link"></span>&nbsp;Informes</asp:LinkButton>
                    </td>
                </tr>
                <tr style="height: 100px;">
                    <td width="50%" style="text-align: center">
                    </td>
                    <td width="50%" style="text-align: center">
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
