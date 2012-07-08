using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    string strConnection = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
    protected void btn_OnClick(object sender, EventArgs e)
    {
        SearchText();
    }
    protected void btnConsulta_Click(object sender, EventArgs e)
    {
        //Show ModalPopup
        MPESearchNames.Show(); 
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //BindGrid();
            this.BindListView();
        }

    }
    private DataTable GetRecords()
    {

        SqlConnection conn = new SqlConnection(strConnection);
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        DataTable dataSource = (DataTable)Session["DataSource"];
        DataSet objDs = new DataSet();
        SqlDataAdapter dAdapter = new SqlDataAdapter();
        int indice = 1;
        foreach (DataRow row in dataSource.Rows)
        {
            cmd.CommandText = "select " + indice + " as ChildIndex, * " +
                     " from VwExpediente e" +
                    " where nom_actor like '" + row[1].ToString() + "'";
            dAdapter.SelectCommand = cmd;
            dAdapter.Fill(objDs);
        }
        return objDs.Tables[0];

    }
    private string GetNamesString()
    {
        string RetString = "";
        DataTable dataSource = (DataTable)Session["DataSource"];
        foreach (DataRow row in dataSource.Rows)
        {   
            RetString = RetString +",'" +row[1].ToString()+"'";
        }
        return RetString.Remove(0,1);
    }

    private void BindGrid()
    {
        //DataTable dt = GetRecords();
        DataTable dt = GetDataSource();
        DataTable dt2 = GetRecords();
        if (dt.Rows.Count > 0)
        {
            grdMaster.DataSource = dt;
            grdMaster.DataBind();
        }
    }
    private void SearchText()
    {
        this.UpdateDataSource();
        DataTable dt = GetDataSource();
        DataTable dt2 = GetRecords();
        DataView dv = new DataView(dt);
        grdMaster.DataSource = dv;
        grdMaster.DataBind();

    }
    /// <summary>
    /// Gets the current data source, or creates one if none exists.
    /// </summary>
    /// <returns></returns>
    private DataTable GetDataSource()
    {
        DataTable dataSource = null;

        if (Session["DataSource"] != null)
        {
            dataSource = (DataTable)Session["DataSource"];
        }
        else
        {
            dataSource = this.CreateDataTable();
            Session["DataSource"] = dataSource;
        }

        return dataSource;
    }
    /// <summary>
    /// Creates a new data source.
    /// </summary>
    /// <returns></returns>
    private DataTable CreateDataTable()
    {
        DataTable dt = new DataTable();
        DataRow row;

        dt.Columns.Add("rowID", typeof(int));
        dt.Columns[0].AutoIncrement = true;
        dt.Columns[0].AutoIncrementSeed = dt.Columns[0].AutoIncrementStep = 1;

        dt.Columns.Add("staffMemberName", typeof(string));

        //create a dummy row
        row = dt.NewRow();
        row[1] = string.Empty;
        dt.Rows.Add(row);

        return dt;
    }
    protected void lvDynamicTextboxes_ItemDataBound(object sender, ListViewItemEventArgs e)
    {

        if (e.Item is ListViewDataItem)
        {
            object fieldValue;

            ListViewDataItem item = (ListViewDataItem)e.Item;
            int rowID = (int)DataBinder.Eval(item.DataItem, "rowID");

            fieldValue = DataBinder.Eval(item.DataItem, "staffMemberName");
            if (fieldValue != DBNull.Value && fieldValue.ToString().Length > 0)
            {
                TextBox txt = (TextBox)e.Item.FindControl("txtName");
                txt.Text = fieldValue.ToString();
            }

        }
    }
    private void SetDataSource(DataTable dataSource)
    {
        Session["DataSource"] = dataSource;
    }
    protected void btnAddTextBox_Click(object sender, EventArgs e)
    {
        this.UpdateDataSource();

        //add an additional row to the data source
        DataTable dt = this.GetDataSource();
        this.AddDataRow(dt);
        this.SetDataSource(dt);

        this.BindListView();
        //Show ModalPopup
        MPESearchNames.Show(); 
    }
    /// <summary>
    /// Persists the current values to the data source.
    /// </summary>
    private void UpdateDataSource()
    {
        DataTable dataSource = (DataTable)Session["DataSource"];
        if (dataSource != null)
            dataSource.Rows.Clear();
        else
            dataSource = this.GetDataSource();

        string staffMemberName;

        foreach (ListViewItem item in this.lvDynamicTextboxes.Items)
        {
            if (item is ListViewDataItem)
            {
                staffMemberName = ((TextBox)item.FindControl("txtName")).Text;


                this.AddDataRow(dataSource, staffMemberName);
            }

        }

        this.SetDataSource(dataSource);
    }
    /// <summary>
    /// Adds an additional row to the specified data table.
    /// </summary>
    /// <param name="dataSource"></param>
    /// <param name="staffMemberName"></param>
    private void AddDataRow(DataTable dataSource, string staffMemberName)
    {
        DataRow row = dataSource.NewRow();
        row[1] = staffMemberName;
        dataSource.Rows.Add(row);
    }
    /// <summary>
    /// Adds an additional row to the specified data table.
    /// </summary>
    /// <param name="dataSource"></param>
    private void AddDataRow(DataTable dataSource)
    {
        this.AddDataRow(dataSource, string.Empty);
    }
    /// <summary>
    /// Binds the listview.
    /// </summary>
    private void BindListView()
    {
        //get the data source
        DataTable dataSource = this.GetDataSource();

        //bind the listview
        this.lvDynamicTextboxes.DataSource = dataSource;
        this.lvDynamicTextboxes.DataBind();
    }
}