using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rbMembership.SelectedValue = "No";
                BindStateDropdown();
                BindUserDropdown();
            }
        }

        public void btnSave_Click(object sender, EventArgs e) {
            string connectionString = ConfigurationManager.ConnectionStrings["ADOConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertUser", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FirstName",txtfirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", txtlastName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNumber", txtContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@Fax", txtFax.Text.Trim());

                cmd.Parameters.AddWithValue("@StateID", ddlState.SelectedValue);
                cmd.Parameters.AddWithValue("@UserType",ddlUserType.SelectedValue);

                cmd.Parameters.AddWithValue("@ProfessionalBackground", txtProfessionalBackground.Enabled ? txtProfessionalBackground.Text : "N/A");
                cmd.Parameters.AddWithValue("@EducationCompleted", GetEducationCompleted());
                cmd.Parameters.AddWithValue("@Membership", rbMembership.SelectedValue == "Yes");
                cmd.Parameters.AddWithValue("@MembershipDuration", string.IsNullOrEmpty(txtMembershipDuration.Text.Trim()) ? 0 : (object)Convert.ToInt32(txtMembershipDuration.Text.Trim()));

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Users.aspx");
           
        }

        protected void ddlUserType_SelectedIndexChanged(object sender, EventArgs e) { 
            if(ddlUserType.SelectedValue == "Professional Use")
            {
                txtProfessionalBackground.Enabled = true;
            }
            else
            {
                txtProfessionalBackground.Enabled = false;
                txtProfessionalBackground.Text = "N/A";
            }
        }

        protected void rbMembershipIndexChange(object sender, EventArgs e)
        {
            txtMembershipDuration.Enabled = rbMembership.SelectedValue == "Yes";
            if (!txtMembershipDuration.Enabled)
            {
                txtMembershipDuration.Text = "";
            }
        }
        protected string GetEducationCompleted()
        {
            string educationCompleted = "";
            foreach(ListItem item in cblEducationCompleted.Items)
            {
                if (item.Selected)
                {
                    educationCompleted += item.Text + ",";
                }
            }
            return educationCompleted.TrimEnd(',');
        }
        protected void BindStateDropdown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ADOConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllStates", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlState.DataSource = reader;
                ddlState.DataTextField = "StateName";
                ddlState.DataValueField = "StateID";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("---Select State---"));
            }
        }

        protected void BindUserDropdown() {
            string connectionString = ConfigurationManager.ConnectionStrings["ADOConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllUserTypes", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlUserType.DataSource = reader;
                ddlUserType.DataTextField = "UserType";
                ddlUserType.DataValueField = "UserType";
                ddlUserType.DataBind();
                ddlUserType.Items.Insert(0, new ListItem("---Select UserType---"));
            }
        }
    }
}