<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="ProcurarPedidos.aspx.cs" Inherits="PW_Final.Oficina.ProcurarPedidos" %>


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


                            

                            


<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
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
                            <asp:LinkButton ID="btnResposta" runat="server" Text="Responder" OnClick="NovaResposta" CssClass="btn btn-default" />
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                    
                    
                    
                </Columns>
                
            </asp:GridView>
            
        </div>
        <asp:Panel ID="respostaPanel" runat="server" CssClass="col-md-4" Visible="false">
            <section id="respForm">
                <div class="form-horizontal">
                    <h4>Escreva o valor do orçamento.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="false">
                    <p>
                        Novo Orçamento Adicionado
                    </p>
                </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Valor" CssClass="col-md-2 control-label">Nome</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Valor" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Valor"
                                CssClass="text-danger" ErrorMessage="Escreva o Valor do Orçamento." />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" OnClick="AddNew" Text="Adicionar" CssClass="btn btn-default" />
                        </div>
                    </div>
                        
                </div>
                
            </section>

        </asp:Panel>
    </div>
</asp:Content>