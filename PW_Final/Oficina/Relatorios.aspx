<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Relatorios.aspx.cs" Inherits="PW_Final.Oficina.Relatorios" %>


<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

               <ul class="sidebar-nav">
                
                        <li>
                            <a href="/Oficina/OficinaHome">Dashboard</a>
                        </li>
                        <li>
                            <a href="/Oficina/ProcurarPedidos.aspx">Serviços</a>
                            <ul class="sub-menu">
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Mostrar Novos</a></li>
                                <li><a href="/Oficina/Historico.aspx">Mostrar Historico</a></li>
                                <li><a href="/Oficina/Pendentes.aspx">Pendentes</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/Oficina/MeusOrcamentos.aspx">Os Meus Orçamentos</a>  
                                
                        </li>
                        <li>
                            <a href="/Oficina/Relatorios.aspx">Os meus Relatórios</a>  
                                
                        </li>
                    </ul>
                
                            
</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="DashContent">
        <div class="row">
        <div class="col-md-8">
            <asp:GridView ID="pedidosGridView" CssClass="table table-bordered" runat="server" BorderStyle="None" AutoGenerateColumns="false" >
                <Columns >
                    
                    
                    <asp:BoundField DataField="Descricao" HeaderText="Descrição do serviço" />
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" />                    
                    
                    
                    <asp:TemplateField HeaderText="Opções">
                        <ItemTemplate>
                            
                            
                            <asp:LinkButton ID="btnResolver" runat="server" Text="Resolver" CssClass="btn btn-default" />
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                    
                    
                    
                </Columns>
                
            </asp:GridView>
            
        </div>
        
    </div>
</asp:Content>
                            
