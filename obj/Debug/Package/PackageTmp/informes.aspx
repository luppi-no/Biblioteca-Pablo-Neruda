<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="informes.aspx.cs" Inherits="Proyecto.informes" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Informes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li><a href="inicio.aspx"><span class="icon-home"></span>&nbsp;Menú Principal</a></li>
            <li class="active"><a href="#informes"><span class="icon-list"></span>&nbsp;Informes</a></li>
        </ul>
        <div class="tab-content">
            <br />
            <div align="center">
                <p class="title">
                    Informes</p>
                <asp:Label ID="lblInforme" runat="server" Text="Informe:"></asp:Label>
                <asp:DropDownList ID="ddlInforme" runat="server" Width="20%">
                    <asp:ListItem Value="0" Selected="True" Text="Gráfico de barras"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Matriz"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Tabla"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnCargarInforme" runat="server" Text="Cargar" CssClass="btn btn-default btneminmedium"
                    OnClick="btnCargarInforme_Click" />
            </div>
            <br />
            <div align="center">
                <asp:UpdatePanel ID="upInforme" runat="server">
                    <ContentTemplate>
                        <rsweb:ReportViewer ID="rptvw" runat="server" Width="100%" ZoomMode="FullPage" 
                            Height="800px">
                        </rsweb:ReportViewer>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCargarInforme" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
