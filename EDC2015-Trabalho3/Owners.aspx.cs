using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDC2015_Trabalho3
{
    public partial class Owners : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void owners_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void owners_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        protected void AddNewRecord(object sender, EventArgs e)
        {
            own.ShowFooter = true;
            DataBind();

        }
    }
}