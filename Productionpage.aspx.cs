using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;



public partial class Productionpage : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            BindGrid();
            GetChart();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("Usp_InsertProductionData", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
            cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
            cmd.Parameters.AddWithValue("@CompanyAddress", txtCompanyAddress.Text);
            cmd.Parameters.AddWithValue("@ProductionDate", txtProductionDate.Text);
            cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text));
            cmd.Parameters.AddWithValue("@Shift", ddlShift.SelectedValue);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            BindGrid();
            gvProductionData.Visible = false;


            txtProductName.Text = "";
            txtCompanyName.Text = "";
            txtCompanyAddress.Text = "";
            txtProductionDate.Text = "";
            txtQuantity.Text = "";
            ddlShift.SelectedValue = "";
        }
    }




    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid(txtSearchProductName.Text.Trim());
        gvProductionData1.Visible = true;
        gvProductionData.Visible = false;
    }

    private void BindGrid(string searchProductName = "")
    {
        string connStr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("Usp_GetProductionData", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductName", searchProductName);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvProductionData.DataSource = dt;
            gvProductionData.DataBind();

            gvProductionData1.DataSource = dt;
            gvProductionData1.DataBind();
        }
    }

    protected void ShowReport_Click(object sender, EventArgs e)
    {
        BindGrid();
        gvProductionData1.Visible = false;
        gvProductionData.Visible = true;
    }

    protected void btnCompanyMaster_Click(object sender, EventArgs e)
    {
        CompantMaster.Visible = true;
        SearchProduct.Visible = false;
        Report.Visible = false;
        Dashboard.Visible = false;
    }

    protected void btnSearchProduct_Click(object sender, EventArgs e)
    {
        CompantMaster.Visible = false;
        SearchProduct.Visible = true;
        Report.Visible = false;
        Dashboard.Visible = false;
    }

    protected void btnReport_Click(object sender, EventArgs e)
    {
        CompantMaster.Visible = false;
        SearchProduct.Visible = false;
        Report.Visible = true;
        Dashboard.Visible = false;
    }

    protected void btnDashBoard_Click(object sender, EventArgs e)
    {
        CompantMaster.Visible = false;
        SearchProduct.Visible = false;
        Report.Visible = false;
        Dashboard.Visible = true;
    }




    protected void GetChart()
    {
        DataSet dsDates = new DataSet();
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("USP_GetDistinctProductionDates", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dsDates);
        }

        StringBuilder sb = new StringBuilder();
        sb.Append("<div id=\"containerClient\"></div>");
        sb.Append("<script>");
        sb.Append("Highcharts.chart('containerClient', {");
        sb.Append("    chart: { type: 'column' },");
        sb.Append("    title: { text: 'Product Quantity by Date' },");
        sb.Append("    xAxis: { type: 'category' },");
        sb.Append("    yAxis: { title: { text: 'Quantity' } },");
        sb.Append("    series: [{");
        sb.Append("        name: 'Products',");
        sb.Append("        colorByPoint: true,");
        sb.Append("        data: [");

        foreach (DataRow row in dsDates.Tables[0].Rows)
        {
            DataSet dsProducts = new DataSet();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("USP_GetProductQuantityByDate", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductionDate", row["ProductionDate"]);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dsProducts);
            }

            foreach (DataRow productRow in dsProducts.Tables[0].Rows)
            {
                sb.Append("{ name: '").Append(productRow["ProductName"]).Append("', y: ").Append(productRow["ProductQuantity"]).Append(" },");
            }
        }

        if (sb.Length > 0 && sb[sb.Length - 1] == ',')
            sb.Length--;

        sb.Append("        ]");
        sb.Append("    }]");
        sb.Append("});");
        sb.Append("</script>");

        containerClient.InnerHtml = sb.ToString();
    }

}







