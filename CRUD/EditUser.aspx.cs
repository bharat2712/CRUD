using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UserID"] != null)
                {
                    int userId = Convert.ToInt32(Request.QueryString["UserID"]);
                    PopulateUserData(userId);
                }
                BindStateDropdown();
                BindUserTypeDropdown();
            }
        }

        private void PopulateUserData(int userId)
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
                    hfUserID.Value = rdr["UserID"].ToString();
                    txtFirstName.Text = rdr["FirstName"].ToString();
                    txtLastName.Text = rdr["LastName"].ToString();
                    txtEmailAddress.Text = rdr["EmailAddress"].ToString();
                    txtContactNumber.Text = rdr["ContactNumber"].ToString();
                    txtFax.Text = rdr["Fax"].ToString();
                    ddlState.SelectedValue = rdr["StateID"].ToString();
                    ddlUserType.SelectedValue = rdr["UserType"].ToString();
                    txtProfessionBackground.Text = rdr["ProfessionalBackground"].ToString();
                    SetEducationCompleted(rdr["EducationCompleted"].ToString());
                    rbMembership.SelectedValue = rdr["Membership"].ToString() == "True" ? "Yes" : "No";
                    txtMembershipDuration.Text = rdr["MembershipDuration"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(hfUserID.Value);
            string connectionString = ConfigurationManager.ConnectionStrings["ADOConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_UpdateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailAddress", txtEmailAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNumber", txtContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@Fax", txtFax.Text.Trim());
                cmd.Parameters.AddWithValue("@StateID", ddlState.SelectedValue);
                cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedValue);
                cmd.Parameters.AddWithValue("@ProfessionalBackground", txtProfessionBackground.Text.Trim());
                cmd.Parameters.AddWithValue("@EducationCompleted", GetEducationCompleted());
                cmd.Parameters.AddWithValue("@Membership", rbMembership.SelectedValue == "Yes");
                cmd.Parameters.AddWithValue("@MembershipDuration", rbMembership.SelectedValue == "Yes" ? Convert.ToInt32(txtMembershipDuration.Text.Trim()) : 0);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Users.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }

        private void BindStateDropdown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ADOConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllStates", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                ddlState.DataSource = rdr;
                ddlState.DataTextField = "StateName";
                ddlState.DataValueField = "StateID";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("-- Select State --", ""));
            }
        }

        private void BindUserTypeDropdown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ADOConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllUserTypes", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                ddlUserType.DataSource = rdr;
                ddlUserType.DataTextField = "UserType";
                ddlUserType.DataValueField = "UserType";
                ddlUserType.DataBind();
                ddlUserType.Items.Insert(0, new ListItem("-- Select User Type --", ""));
            }
        }

        private void SetEducationCompleted(string educationCompleted)
        {
            foreach (ListItem item in cblEducationCompleted.Items)
            {
                if (educationCompleted.Contains(item.Value))
                {
                    item.Selected = true;
                }
            }
        }

        private string GetEducationCompleted()
        {
            string educationCompleted = "";
            foreach (ListItem item in cblEducationCompleted.Items)
            {
                if (item.Selected)
                {
                    educationCompleted += item.Value + ",";
                }
            }
            return educationCompleted.TrimEnd(',');
        }
    }
}
