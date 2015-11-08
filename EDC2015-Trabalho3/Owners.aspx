<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Owners.aspx.cs" Inherits="EDC2015_Trabalho3.Owners" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="own" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" GridLines="None" CssClass="table table-strip table-hover" AllowPaging="True" OnRowCommand="owners_RowCommand" OnRowUpdating="owners_RowUpdating">
        <Columns>
            
            <asp:TemplateField HeaderText="Tax Number" SortExpression="tax_number">
                <FooterTemplate>
                    <asp:TextBox ID="taxBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("@tax_number") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("@tax_number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <FooterTemplate>
                    <asp:TextBox ID="nameBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("/owners/name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("/owners/name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Purchase Date" SortExpression="purchase_date">
                <FooterTemplate>
                    <asp:TextBox ID="purchaseBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("/owners/@purchase_date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("/owners/@purchase_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sale Date" SortExpression="sale_date">
                <FooterTemplate>
                    <asp:TextBox ID="saleBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("/owners/@sale_date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("/owners/sale_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />
            
            <asp:TemplateField>

                <FooterTemplate>
                    <asp:LinkButton ID="btnInsert" runat="Server" Text="Insert" CommandName="Insert" UseSubmitBehavior="False"/>
                </FooterTemplate>


            </asp:TemplateField>
            

        </Columns>

        
        

        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                <h4>Atenção!</h4>
                <p>Não há proprietarios desse tipo!</p>
            </div>
        </EmptyDataTemplate>


    </asp:GridView>

    <asp:LinkButton ID="btnAdd" runat="server" Text="Add" OnClick="AddNewRecord" />

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/imoveis.xml" EnableCaching="False"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/imoveis.xml" EnableCaching="False"></asp:XmlDataSource>

</asp:Content>
