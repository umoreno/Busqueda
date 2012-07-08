using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RiesgoLaboral
{
    public partial class TestEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            System.Net.Mail.SmtpClient mysmtp = new System.Net.Mail.SmtpClient();
            mysmtp.Host = "smtp.gmail.com";
            mysmtp.Port = 587;
            mysmtp.EnableSsl = true;
            mysmtp.Timeout = 15000; // it times out a lot later after removing this..


            System.Net.Mail.MailMessage msg;
            msg = new System.Net.Mail.MailMessage("ulises.moreno@laboral.somee.com", "ulisesmoreno@gmail.com","text", "still testing ...");


            System.Net.NetworkCredential smtpAuthentication = new System.Net.NetworkCredential();

            smtpAuthentication.Password = "NOum86067)";
            smtpAuthentication.UserName = "ulises.moreno@laboral.somee.com";
            mysmtp.Credentials = smtpAuthentication;
            mysmtp.Send(msg);
        }
    }
}