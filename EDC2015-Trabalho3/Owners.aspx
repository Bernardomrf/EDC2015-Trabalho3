<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Owners.aspx.cs" Inherits="EDC2015_Trabalho3.Owners" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2>Lista de Donos</h2>
    <hr />
    <asp:GridView ID="own" runat="server" AutoGenerateColumns="False" OnRowDeleting="own_RowDeleting"  DataSourceID="XmlDataSource1" GridLines="None" CssClass="table table-strip table-hover" AllowPaging="True" OnRowCommand="owners_RowCommand" OnRowUpdating="owners_RowUpdating">
        <Columns>
            
            <asp:TemplateField HeaderText="Tax Number" SortExpression="tax_number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tax_number") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("tax_number") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="taxBox" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="nameBox" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Purchase Date" SortExpression="purchase_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("purchase_date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("purchase_date") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="purchaseBox" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sale Date" SortExpression="sale_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("sale_date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("sale_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Land Register" SortExpression="land_register">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("land_register") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("land_register") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="btnInsert" runat="Server" Text="Insert" CommandName="Insert" UseSubmitBehavior="False"/>
                </FooterTemplate>
            </asp:TemplateField>
            

            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><i class="fa fa-floppy-o"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="fa fa-ban"></i></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><i class="fa fa-pencil"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="fa fa-trash-o"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            

        </Columns>

        
        

        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                <h4>Atenção!</h4>
                <p>Não há proprietarios desse imovel!</p>
            </div>
        </EmptyDataTemplate>


    </asp:GridView>

    <asp:LinkButton ID="btnAdd" runat="server" OnClick="AddNewRecord"><i class="fa fa-plus fa-3"></i></asp:LinkButton>

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/imoveis.xml" TransformFile="~/App_Data/owners.xsl" EnableCaching="False"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/imoveis.xml" EnableCaching="False"></asp:XmlDataSource>

</asp:Content>
