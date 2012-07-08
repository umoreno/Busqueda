using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void NavigationMenu_Init(object sender, EventArgs e)
    {
         //Remove the admin menu for the norms 
        Boolean cUser = HttpContext.Current.User.Identity.IsAuthenticated;
 
        //If user is not in the Admin role removes the 1st menu at index 0 
        if(cUser == false) {
            NavigationMenu.Items.RemoveAt(1); 
        } 
    }
}
