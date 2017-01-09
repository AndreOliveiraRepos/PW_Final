<%@ Page Title="Os tipos de Role" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ListaRoles.aspx.cs" Inherits="PW_Final.Admin.ListaRoles" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <asp:GridView ID="tiposGridView" runat="server" Width="374px">
        <Columns>
            
        </Columns>
        
    </asp:GridView>
    <div>
        
    </div>
</asp:Content>