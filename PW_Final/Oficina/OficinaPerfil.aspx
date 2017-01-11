<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="OficinaPerfil.aspx.cs" Inherits="PW_Final.Oficina.OficinaPerfil" %>


<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

               <ul class="sidebar-nav">
                
                        <li>
                            <a href="/Oficina/OficinaHome">Dashboard</a>
                        </li>
                        <li>
                            <a href="/Oficina/ProcurarPedidos.aspx">Serviços</a>
                            <ul class="sub-menu">
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Mostrar Novos</a></li>
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Mostrar Historico</a></li>
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Os Meus Pendentes</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/Oficina/Respostas.aspx">Os Meus Orçamentos</a>  
                                
                        </li>
                        <li>
                            <a href="/Oficina/Respostas.aspx">Os meus Relatórios</a>  
                                
                        </li>
                    </ul>
                
                            
</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="DashContent">
    <!--perfil-->
        <div class="profile" >
            
            <div class="row">
                
                    <asp:Label runat="server">Nome</asp:Label>
                                  
                    <asp:Label ID="lblNome" runat="server">val</asp:Label>   
                 
            </div>
            <div class="row">
                
                    <asp:Label runat="server">Morada</asp:Label>
                                  
                    <asp:Label ID="lblMorada" runat="server">val</asp:Label>   
                 
            </div>
            <div class="row">
                
                    <asp:Label runat="server" >Telefone</asp:Label>
                                 
                    <asp:Label ID="lblTelefone" runat="server" >val</asp:Label>   
                 
            </div>
            <div class="row">
                
                    <asp:Label runat="server" >Tipo</asp:Label>
                                 
                    <asp:Label ID="lblTipo" runat="server" >val</asp:Label>   
                 
            </div>
            <div class="row">
                
                    <asp:Label runat="server">Avaliacao</asp:Label>
                                
                    <asp:Label ID="lblAvaliacao" runat="server">val</asp:Label>   
                 
            </div>
            <div class="row">
                
                    <asp:Label runat="server">Total de Avaliações</asp:Label>
                                   
                    <asp:Label ID="lblNAvaliacoes" runat="server">val</asp:Label>   
                 
            </div>
        </div>
        <!--Lista de reviews-->
        <div class="row">
            <asp:GridView ID="reviewsGridView" CssClass="table table-bordered" runat="server" BorderStyle="None" AutoGenerateColumns="false" >
                <Columns >
                    
                    
                    <asp:BoundField DataField="Utilizador" HeaderText="Utilizador" />
                    <asp:BoundField DataField="Avaliacao" HeaderText="Avaliacao" />
                    <asp:BoundField DataField="Comentario" HeaderText="Comentário" />                    
                    
                    
                    
                    
                </Columns>
                
            </asp:GridView>
        </div>

    
</asp:Content>
                            
