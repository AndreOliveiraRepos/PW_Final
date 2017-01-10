<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="ProcurarPedidos.aspx.cs" Inherits="PW_Final.Oficina.ProcurarPedidos" %>


<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">

                <asp:HyperLink ID="homeHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Oficina/OficinaHome">Home</asp:HyperLink>
                <asp:HyperLink ID="searchRequestsHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Oficina/ProcurarPedidos.aspx">Procurar Pedidos</asp:HyperLink>
                <asp:HyperLink ID="manageAnswersHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Oficina/Respostas.aspx">Listar as minhas respostas</asp:HyperLink>
                
                 <div class="col-md-2">
            
        </div>
                            
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="DashContent">
    <!--Inserir caixa de mensagem aqui-->
    <div class="row">
        <div class="col-md-8">
            <asp:GridView ID="pedidosGridView" CssClass="table table-bordered" runat="server" BorderStyle="None" AutoGenerateColumns="false" >
                <Columns >
                    
                    
                    <asp:BoundField DataField="Descricao" HeaderText="Descrição" />
                    <asp:BoundField DataField="Data" HeaderText="Data" />
                    <asp:BoundField DataField="Avaliacao" HeaderText="Avaliação" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                    <asp:BoundField DataField="Respostas" HeaderText="Respostas" />
                    
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
