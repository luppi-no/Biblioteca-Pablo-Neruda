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
                        <asp:LinkButton ID="lnkbCompetencias" runat="server" OnClick="lnkbCompetencias_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Competencias - Tipos</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbCentrosDeCosto" runat="server" OnClick="lnkbCentrosDeCosto_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Centros de Costo</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbAreasGerencias" runat="server" OnClick="lnkbAreasGerencias_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Áreas - Gerencias - Asignaciones</asp:LinkButton>
                    </td>
                </tr>
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbCargos" runat="server" OnClick="lnkbCargos_Click" CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Cargos</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbUsuarios" runat="server" OnClick="lnkbUsuarios_Click" CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Usuarios - Asignaciones</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbFormularios" runat="server" OnClick="lnkbFormularios_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Formularios - Asignaciones</asp:LinkButton>
                    </td>
                </tr>
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbAdmEvaluaciones" runat="server" OnClick="lnkbAdmEvaluaciones_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Evaluaciones</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbCorreos" runat="server" OnClick="lnkbCorreos_Click" CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Correos</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbInformes" runat="server" OnClick="lnkbInformes_Click" CssClass="btn-link btn-lg"><span class="icon-link"></span>&nbsp;Informes</asp:LinkButton>
                    </td>
                </tr>
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbPeriodos" runat="server" CssClass="btn-link btn-lg" OnClick="lnkbPeriodos_Click"><span class="icon-link"></span>&nbsp;Periodos</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                    <asp:LinkButton ID="lnkbHistorial" runat="server" CssClass="btn-link btn-lg" 
                            onclick="lnkbHistorial_Click"><span class="icon-link"></span>&nbsp;Historial</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
