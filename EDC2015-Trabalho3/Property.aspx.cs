using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho3
{
    public partial class Properties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            
        }

        protected void AddNewRecord(object sender, EventArgs e)
        {
            propertie.ShowFooter = true;
            DataBind();

        }

        protected void property_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // If multiple ButtonField column fields are used, use the
            // CommandName property to determine if "Insert" button was clicked.
            if (e.CommandName.Equals("Insert"))
            {
                //fetch the values of the new product
                TextBox city = propertie.FooterRow.FindControl("cityBox") as TextBox;
                TextBox street = propertie.FooterRow.FindControl("streetBox") as TextBox;
                TextBox port = propertie.FooterRow.FindControl("portBox") as TextBox;
                TextBox value = propertie.FooterRow.FindControl("valueBox") as TextBox;


                //insert the new product
                InsertProduct(city.Text, street.Text, port.Text, value.Text);

                //hide the footer
                propertie.ShowFooter = false;

                // rebind the data
                DataBind();
            }
        }

        private void InsertProduct(string city, string street, string port, string value)
        {
            XmlDocument xDoc = XmlDataSource2.GetXmlDocument();
            XmlElement newProperty = xDoc.CreateElement("Property");

            XmlElement newLand = xDoc.CreateElement("land_register");

            XmlElement newAddress = xDoc.CreateElement("address");
            XmlElement newCity = xDoc.CreateElement("city");
            XmlElement newStreet = xDoc.CreateElement("street");
            XmlElement newPort = xDoc.CreateElement("port_number");

            XmlElement newValue = xDoc.CreateElement("value");

            newCity.InnerText = city;
            newStreet.InnerText = street;
            newPort.InnerText = port;

            newAddress.AppendChild(newCity);
            newAddress.AppendChild(newStreet);
            newAddress.AppendChild(newPort);

            String land = "16";
            newLand.InnerText = land;

            newValue.InnerText = value;

            newProperty.AppendChild(newLand);
            newProperty.AppendChild(newAddress);
            newProperty.AppendChild(newValue);

            xDoc.DocumentElement.AppendChild(newProperty);

            XmlDataSource2.Save();

            propertie.PageIndex = xDoc.DocumentElement.ChildNodes.Count - 1;

        }


    }
}