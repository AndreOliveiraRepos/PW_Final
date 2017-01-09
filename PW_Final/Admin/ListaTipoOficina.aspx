<%@ Page Title="Os tipos de oficina" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="ListaTipoOficina.aspx.cs" Inherits="PW_Final.Admin.ListaTipoOficina" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <asp:GridView ID="tiposGridView" runat="server" Width="374px">
        <Columns>
            
        </Columns>
        
    </asp:GridView>
    <div>
        
    </div>
</asp:Content>