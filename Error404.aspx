<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true"
    CodeBehind="Error404.aspx.cs" Inherits="Proyecto.Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    EMIN - Página no Encontrada
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li class="active" style="left: 2px; top: 4px"><a href="#error404" data-toggle="tab"><span class="icon-list"></span>
                &nbsp;Página no Encontrada</a></li>
        </ul>
        <br />
        <div class="tab-content">
            <div class="tab-pane active" id="error404">
                <div align="center">
                    <asp:Image ID="i404" runat="server" ImageUrl="~/Content/img/404.jpg" />
                    <br />
                    <ul>
                        <li>
                            <asp:Button ID="btnVolver" runat="server" Text="Volver al Login" 
                        CssClass="btn btn-default btneminmedium" onclick="btnVolver_Click" />
                        </li>
                    </ul>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
