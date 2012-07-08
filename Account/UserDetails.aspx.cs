using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using RiesgoLaboral.DAL;


namespace RiesgoLaboral.Account
{
    public partial class UserDetails : System.Web.UI.Page
    {
        LaboralMembershipUserDataContext db = new LaboralMembershipUserDataContext();
        Guid UserID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //Obtaining user id
            UserID = new Guid(Membership.GetUser(User.Identity.Name).ProviderUserKey.ToString());
            if (!Page.IsPostBack)
            ReturnRowset(UserID);
            
        }

        // Call the stored procedure.
        void ReturnRowset(System.Guid pUserID)
        {
            ISingleResult<UsersDetailsbyIDResult> result =
                db.UsersDetailsbyID(pUserID);
            foreach (UsersDetailsbyIDResult Users in result)
            {
                 txtFirstName.Text = Users.Nombre != null ? Users.Nombre.ToString() : "";
                 txtLastPName.Text = Users.ApPaterno != null ? Users.ApPaterno.ToString() : "";
                 txtLastMName.Text = Users.ApMaterno != null ? Users.ApMaterno.ToString() : "";
                 txtCompany.Text = Users.Company != null ? Users.Company.ToString() : "";
                 txtAddress.Text = Users.Direccion != null ? Users.Direccion.ToString() : "";
                 txtColonia.Text = Users.Colonia != null ? Users.Colonia.ToString() : "";
                 txtCity.Text = Users.Municipio != null ? Users.Municipio.ToString() : "";
                 txtState.Text = Users.Estado != null ? Users.Estado.ToString() : "";
                 txtZipCode.Text = Users.CodigoPostal != null ? Users.CodigoPostal.ToString() : "";
                 txtPhone.Text = Users.TelFijo != null ? Users.TelFijo.ToString() : "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtZipCode.Text.Length == 0)
                txtZipCode.Text = "0";
            db.InsUpdUserDetails(UserID, txtFirstName.Text.ToString(), txtLastPName.Text.ToString(), txtLastMName.Text.ToString(),
                txtCompany.Text.ToString(), txtAddress.Text.ToString(), txtColonia.Text.ToString(), txtCity.Text.ToString(),
                txtState.Text.ToString(), Convert.ToDecimal(txtZipCode.Text.ToString()), txtPhone.Text.ToString(), "");
        }

    }
}