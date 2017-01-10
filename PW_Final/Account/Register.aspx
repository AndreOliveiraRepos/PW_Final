<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PW_Final.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="RoleDropDownList" CssClass ="col-md-2 control-label">Tipo de conta</asp:Label>
            <div class="col-md-10">
                 <asp:DropDownList ID="RoleDropDownList" CssClass="form-control" OnSelectedIndexChanged="ChangeForm" runat="server" AutoPostBack="True"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="RoleDropDownList"
                    CssClass="text-danger" ErrorMessage="Escolha o tipo de conta." />
            </div>
        </div>
        <!--Register form-->
        <asp:Panel ID="commonPanel" runat="server" Visible="false">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                </div>
            </div>

        </asp:Panel>

        <asp:Panel ID="oficinaPanel" runat="server" Visible="false">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NomeOficina" CssClass="col-md-2 control-label">Nome da Oficina</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="NomeOficina" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NomeOficina"
                        CssClass="text-danger" ErrorMessage="O nome da oficina é necessário" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="MoradaOficina" CssClass="col-md-2 control-label">Morada da Oficina</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="MoradaOficina" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="MoradaOficina"
                        CssClass="text-danger" ErrorMessage="A morada da oficina é necessária" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="TelefoneOficina" CssClass="col-md-2 control-label">Telefone da Oficina</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="TelefoneOficina" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TelefoneOficina"
                        CssClass="text-danger" ErrorMessage="O telefone da oficina é necessário" />
                </div>
            </div>
            <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="tipoDropDownList" CssClass ="col-md-2 control-label">Tipo de Repações da Ofina</asp:Label>
            <div class="col-md-10">
                 <asp:DropDownList ID="tipoDropDownList" CssClass="form-control" runat="server" ></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tipoDropDownList"
                    CssClass="text-danger" ErrorMessage="Escolha o tipo de reparação." />
            </div>
        </div>
        </asp:Panel>
        
        <!--confirmation-->
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
