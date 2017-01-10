<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="OficinaHome.aspx.cs" Inherits="PW_Final.Oficina.OficinaHome" %>

<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

                <asp:HyperLink ID="homeHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Oficina/OficinaHome">Home</asp:HyperLink>
                <asp:HyperLink ID="searchRequestsHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Oficina/ProcurarPedidos.aspx">Procurar Pedidos</asp:HyperLink>
                <asp:HyperLink ID="manageAnswersHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Oficina/Respostas.aspx">Listar as minhas respostas</asp:HyperLink>
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    TESTE
</asp:Content>