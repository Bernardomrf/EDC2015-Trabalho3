<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Property.aspx.cs" Inherits="EDC2015_Trabalho3.Properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="propertie" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" GridLines="None" CssClass="table table-strip table-hover" AllowPaging="True" OnRowCommand="property_RowCommand" OnRowUpdating="propertie_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="Land Register">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("land_register", "Property.aspx?ID={0}") %>' Text='<%# Eval("land_register") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="city">
                <FooterTemplate>
                    <asp:TextBox ID="cityBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Street" SortExpression="street">
                <FooterTemplate>
                    <asp:TextBox ID="streetBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("street") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("street") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Port Number" SortExpression="port_number">
                <FooterTemplate>
                    <asp:TextBox ID="portBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("port_number") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("port_number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Value" SortExpression="value">
                <FooterTemplate>
                    <asp:TextBox ID="valueBox" runat="server"></asp:TextBox>
                </FooterTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("value") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("value", "{0:C2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" />
            
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Owner.aspx?ID=" + Eval("land_register")%>'><i class="fa fa-user"></i></asp:HyperLink>
                </ItemTemplate>

                <FooterTemplate>
                    <asp:LinkButton ID="btnInsert" runat="Server" Text="Insert" CommandName="Insert" UseSubmitBehavior="False"/>
                </FooterTemplate>


            </asp:TemplateField>
            

        </Columns>

        
        

        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                <h4>Atenção!</h4>
                <p>Não há imoveis desse tipo nessa instituição!</p>
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:LinkButton ID="btnAdd" runat="server" Text="Add" OnClick="AddNewRecord" />

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/imoveis.xml" TransformFile="~/App_Data/properties.xsl" EnableCaching="False"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/imoveis.xml" EnableCaching="False"></asp:XmlDataSource>

</asp:Content>
