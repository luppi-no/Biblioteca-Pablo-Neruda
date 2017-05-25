<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="iniciocapacitacion.aspx.cs" Inherits="Proyecto.iniciocapacitacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Administración de Capacitaciones
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#iniciocapacitacion"><span class="icon-home"></span>&nbsp;Menú
                Principal</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <table style="width: 100%;">
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkbMisEvaluaciones" runat="server" CssClass="btn-link btn-lg"
                            OnClick="lnkbMisEvaluaciones_Click"><span class="icon-link"></span>Mis Evaluaciones</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkCapacitaciones" runat="server" OnClick="lnkCapacitaciones_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>Capacitaciones - Tipos</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkProveedores" runat="server" OnClick="lnkProveedores_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>Proveedores - Asignaciones</asp:LinkButton>
                    </td>
                </tr>
                <tr style="height: 100px;">
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkListaCapacitacion" runat="server" OnClick="lnkListaCapacitaciones_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>Lista de Capacitaciones</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                        <asp:LinkButton ID="lnkEvaluacionesACapacitar" runat="server" OnClick="lnkEvaluacionesACapacitar_Click"
                            CssClass="btn-link btn-lg"><span class="icon-link"></span>Evaluados a Capacitar</asp:LinkButton>
                    </td>
                    <td width="33.33%" style="text-align: center">
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
