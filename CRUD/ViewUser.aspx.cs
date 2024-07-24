using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD
{
    public partial class ViewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["UserID"]!=null)
                {
                    int userId = Convert.ToInt32(Request.QueryString["UserID"]);
                    GetUser(userId);
                }
            }
        }

        private void GetUser(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ADOConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("getUserByID", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    lblFirstNameValue.Text = rdr["FirstName"].ToString();
                    lblLastNameValue.Text = rdr["LastName"].ToString();
                    lblEmailAddressValue.Text = rdr["EmailAddress"].ToString();
                    lblContactNumberValue.Text = rdr["ContactNumber"].ToString();
                    lblFaxValue.Text = rdr["Fax"].ToString();
                    lblStateValue.Text = rdr["StateName"].ToString();
                    lblUserTypeValue.Text = rdr["UserType"].ToString();
                    lblProfessionBackgroundValue.Text = rdr["ProfessionalBackground"].ToString();
                    lblEducationCompletedValue.Text = rdr["EducationCompleted"].ToString();
                    lblMembershipValue.Text = rdr["Membership"].ToString();
                    lblMembershipDurationValue.Text = rdr["MembershipDuration"].ToString();
                }
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }
    }
}