<%@ Page Title="Adicionar Tipos de Oficina" MasterPageFile="~/Dashboard.Master" Language="C#" AutoEventWireup="true" CodeBehind="AdicionaTipoReparacoes.aspx.cs" Inherits="PW_Final.Admin.AdicionaReparacoes" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="DashContent">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Definir um novo tipo.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="false">
                    <p>
                        Novo Tipo de Oficina/Reparação Adicionado
                    </p>
                </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Nome" CssClass="col-md-2 control-label">Nome</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Nome" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Nome"
                                CssClass="text-danger" ErrorMessage="Escreva o nome da Reparação/Tipo Oficina." />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" OnClick="AddNew" Text="Adicionar" CssClass="btn btn-default" />
                        </div>
                    </div>
                        
                </div>
                
            </section>
        </div>

    
    </div>
</asp:Content>
<asp:Content runat="server" ID="Menu" ContentPlaceHolderID="DashMenu">
                <asp:HyperLink ID="homeHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Admin/AdminHome">Home</asp:HyperLink>
                <asp:HyperLink ID="manageRolesHL" CssClass="list-group-item" runat="server" NavigateUrl="~/Admin/ListaRoles.aspx">Gerir Roles</asp:HyperLink>
                <asp:HyperLink ID="manageRepairHL" CssClass="list-group-item active" runat="server" NavigateUrl="~/Admin/ListaTipoOficina.aspx">Gerir Tipos Reparação</asp:HyperLink>
                            
</asp:Content>