<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="PW_Final.Admin.AdminHome" %>

<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">
                <asp:HyperLink ID="homeHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Admin/AdminHome">Home</asp:HyperLink>
                <asp:HyperLink ID="manageRolesHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Admin/ListaRoles.aspx">Gerir Roles</asp:HyperLink>
                <asp:HyperLink ID="manageRepaorHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Admin/ListaTipoOficina.aspx">Gerir Tipos Reparação</asp:HyperLink>
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    TESTE
</asp:Content>