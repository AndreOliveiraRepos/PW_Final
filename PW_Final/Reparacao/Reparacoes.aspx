<%@ Page Title="Reparações" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reparacoes.aspx.cs" Inherits="PW_Final.Reparacao.Reparacoes" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <asp:GridView ID="pendingGridView" runat="server" Width="374px">
        <Columns>
            <asp:BoundField DataField="DataPedido" HeaderText="Data" />
            <asp:BoundField AccessibleHeaderText="tipoReparacao" DataField="Tipo" HeaderText="Tipo" />
            <asp:CheckBoxField HeaderText="Respondido" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" />
            <asp:ButtonField Text="btnGo" />
        </Columns>
    </asp:GridView>
    <div>
        
    </div>
</asp:Content>
