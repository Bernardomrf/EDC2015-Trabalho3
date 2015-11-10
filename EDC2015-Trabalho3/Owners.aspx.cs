using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Diagnostics;

namespace EDC2015_Trabalho3
{
    public partial class Owners : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.QueryString["ID"];
            XmlDataSource1.XPath = "/owners/owner[@land_register = \"" + url + "\"]";
            if (!IsPostBack)
            {
               
                if (url != "" || url == null)
                {
                    XmlDataSource1.XPath = "/owners/owner[@land_register = \"" + url + "\"]";

                }

            }
        }

        protected void owners_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            XmlDocument xDoc = XmlDataSource2.GetXmlDocument();
            string url = Request.QueryString["ID"];
           

            GridViewRow row = own.Rows[e.RowIndex];
            TextBox tax = (TextBox)row.FindControl("TextBox1");

            XmlElement property = xDoc.SelectSingleNode("properties/property[land_register/text() = \"" + url + "\"]/owners/owner[@tax_number='" + tax.Text + "']") as XmlElement;



            property.Attributes["name"].Value = e.NewValues["name"].ToString();
            property.Attributes["tax_number"].Value = e.NewValues["tax_number"].ToString();
            property.Attributes["purchase_date"].Value = e.NewValues["purchase_date"].ToString();
            if (e.NewValues["sale_date"] != null)
            {
                property.Attributes["sale_date"].Value = e.NewValues["sale_date"].ToString();
            }
            else
            {
                property.Attributes["sale_date"].Value = "";
            }


            XmlDataSource2.Save();

            XmlDataSource2.DataBind();
            XmlDataSource1.DataBind();

            e.Cancel = true;
            own.EditIndex = -1;
        }

        protected void owners_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                //fetch the values of the new product
                TextBox tax = own.FooterRow.FindControl("taxBox") as TextBox;
                TextBox name = own.FooterRow.FindControl("nameBox") as TextBox;
                TextBox purchase = own.FooterRow.FindControl("purchaseBox") as TextBox;


                //insert the new product
                InsertProduct(tax.Text, name.Text, purchase.Text);

                //hide the footer
                own.ShowFooter = false;

                // rebind the data
                DataBind();
            }
        }

        private void InsertProduct(string tax, string name, string purchase)
        {
            string url = Request.QueryString["ID"];
            XmlDocument xDoc = XmlDataSource2.GetXmlDocument();
            XmlElement property = xDoc.SelectSingleNode("properties/property[land_register/text() = \"" + url + "\"]") as XmlElement;

            XmlElement ownersList = property.SelectSingleNode("owners") as XmlElement;
            if (ownersList == null)
            {
                ownersList = xDoc.CreateElement("owners");
                property.AppendChild(ownersList);
            }else
            {
                XmlElement oldOwner = ownersList.SelectSingleNode("//owner[@sale_date = \"\"]") as XmlElement;
                oldOwner.Attributes["sale_date"].Value = purchase;
                XmlDataSource2.Save();
            }

            XmlElement newOwner = xDoc.CreateElement("owner");

            XmlAttribute newtax = xDoc.CreateAttribute("tax_number");
            XmlAttribute newname = xDoc.CreateAttribute("name");
            XmlAttribute newpurchase = xDoc.CreateAttribute("purchase_date");
            XmlAttribute newsale = xDoc.CreateAttribute("sale_date");

            newtax.Value = tax;
            newname.Value = name;
            newpurchase.Value = purchase;
            newsale.Value = "";

            newOwner.Attributes.Append(newtax);
            newOwner.Attributes.Append(newname);
            newOwner.Attributes.Append(newpurchase);
            newOwner.Attributes.Append(newsale);

            ownersList.AppendChild(newOwner);

            XmlDataSource2.Save();

            own.PageIndex = xDoc.DocumentElement.ChildNodes.Count - 1;

            XmlDataSource1.DataBind();
            XmlDataSource2.DataBind();

            if (url != "" || url == null)
            {
                XmlDataSource1.XPath = "/owners/owner[@land_register = \"" + url + "\"]";
            }
        }

        protected void AddNewRecord(object sender, EventArgs e)
        {
            string url = Request.QueryString["ID"];
            if (url != "" || url == null)
            {
                XmlDataSource1.XPath = "/owners/owner[@land_register = \"" + url + "\"]";

            }
            own.ShowFooter = true;
            DataBind();

        }

        protected void own_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = own.Rows[e.RowIndex];

            Label tax = (Label)row.FindControl("label1");

            string url = Request.QueryString["ID"];
            XmlDocument xdoc = XmlDataSource2.GetXmlDocument();

            XmlElement owners = xdoc.SelectSingleNode("properties/property/owners[../land_register/text()='" + url + "']") as XmlElement;
            XmlElement owner = owners.SelectSingleNode("owner[@tax_number='" + tax.Text + "']") as XmlElement;

            owners.RemoveChild(owner);

            XmlDataSource2.Save();

            XmlDataSource2.DataBind();
            XmlDataSource1.DataBind();

            e.Cancel = true;

            own.DataBind();
        }
    }
}