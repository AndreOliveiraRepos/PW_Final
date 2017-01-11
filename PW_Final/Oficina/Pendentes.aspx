<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Pendentes.aspx.cs" Inherits="PW_Final.Oficina.Pendentes" %>



                 
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="DashMenu">

               <ul class="sidebar-nav">
                
                        <li>
                            <a href="/Oficina/OficinaHome">Dashboard</a>
                        </li>
                        <li>
                            <a href="/Oficina/ProcurarPedidos.aspx">Serviços</a>
                            <ul class="sub-menu">
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Mostrar Novos</a></li>
                                <li><a href="/Oficina/ProcurarPedidos.aspx">Mostrar Historico</a></li>
                                <li><a href="/Oficina/Pendentes.aspx">Os Meus Pendentes</a></li>
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



<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    <!--Inserir caixa de mensagem aqui-->
    <div class="row">
        <div class="col-md-8">
            <asp:GridView ID="pedidosGridView" CssClass="table table-bordered" runat="server" BorderStyle="None" AutoGenerateColumns="false" >
                <Columns >
                    
                    
                    <asp:BoundField DataField="Descricao" HeaderText="Descrição" />
                    <asp:BoundField DataField="Data" HeaderText="Data" />                    
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />     
                    
                   <asp:TemplateField HeaderText="Opções">
                        <ItemTemplate>
                            
                            <asp:HiddenField ID="idPedido" runat="server" value='<%# Eval("idPedido") %>'/>
                            <asp:HiddenField ID="idOficina" runat="server" value='<%# Eval("idOficina") %>'/>
                            <asp:LinkButton ID="btnResolver" runat="server" Text="Resolver" OnClick="Resolver" CssClass="btn btn-default" />
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                    
                    
                    
                </Columns>
                
            </asp:GridView>
            
        </div>
        
    </div>

     
    
</asp:Content>
