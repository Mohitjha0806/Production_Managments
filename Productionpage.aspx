<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Productionpage.aspx.cs" Inherits="Productionpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HighChart</title>
    <link href="bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 310px;
            max-width: 800px;
            margin: 1em auto;
        }

        #container {
            height: 400px;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #ebebeb;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }

        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
    </style>
    <link href="bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap.bundle.min.js"></script>
</head>
<body class="bg-info-subtle">
    <form id="form1" runat="server">
        <div class="container-fluid bg-info-subtle">
            <div class="row">
                <div class="col-md-2 py-5 bg-success-subtle  align-items-center">
                    <div class="container justify-content-center">
                        <div class="row mt-5">
                            <asp:Button href="CompantMaster" Text="Company Master" CssClass=" fw-semibold btn btn-outline-primary" ID="btnCompanyMaster" runat="server" OnClick="btnCompanyMaster_Click" />
                        </div>
                        <div class="row mt-2">
                            <asp:Button href="SearchProduct" Text="Search Product" CssClass=" fw-semibold btn btn-outline-primary" ID="btnSearchProduct" runat="server" OnClick="btnSearchProduct_Click" />
                        </div>
                        <div class="row mt-2">
                            <asp:Button herf="Report" Text="Report" ID="btnReport" CssClass=" fw-semibold btn btn-outline-primary" runat="server" OnClick="btnReport_Click" />
                            <br />
                        </div>
                        <div class="row mt-2">
                            <asp:Button href="DashBoard" Text="Dashboard" CssClass=" fw-semibold btn btn-outline-primary" ID="btnDashBoard" runat="server" OnClick="btnDashBoard_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-md-10 bg-danger-subtle">
                    <div class="container-fluid">
                        <div runat="server" visible="false" id="CompantMaster" class="container-fluid bg-danger-subtle">
                            <div class="container-fluid py-5">
                                <div class="container-fluid from-group">
                                    <div class="row">
                                        <h1 class="display-6 text-Start fw-semibold">Company Master</h1>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <asp:Label ID="lblCompanyName" runat="server" Text="Company Name:" CssClass="form-label fw-semibold"></asp:Label>
                                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control border-2 border-primary-subtle" Placeholder="Company Name"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Company Name is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <asp:Label ID="lblCompanyAddress" runat="server" Text="Company Address:" CssClass="form-label fw-semibold"></asp:Label>
                                                <asp:TextBox ID="txtCompanyAddress" runat="server" CssClass="form-control border-2 border-primary-subtle" Placeholder="Company Address"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="rfvCompanyAddress" runat="server" ControlToValidate="txtCompanyAddress" ErrorMessage="Company Address is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <asp:Label ID="lblProductionDate" runat="server" Text="Production Date:" CssClass="form-label fw-semibold"></asp:Label>
                                                <asp:TextBox ID="txtProductionDate" runat="server" CssClass="form-control border-2 border-primary-subtle" Placeholder="(YYYY-MM-DD)" TextMode="Date"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="rfvProductionDate" runat="server" ControlToValidate="txtProductionDate" ErrorMessage="Production Date is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                <%--<asp:RegularExpressionValidator ID="revProductionDate" runat="server" ControlToValidate="txtProductionDate" ValidationExpression="^\d{4}-\d{2}$" ErrorMessage="Invalid date format. Use YYYY-MM-DD." CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <asp:Label ID="lblShift" runat="server" Text="Shift:" CssClass="form-label fw-semibold"></asp:Label>
                                                <asp:DropDownList ID="ddlShift" CssClass="form-control border-2 border-primary-subtle" runat="server">
                                                    <asp:ListItem Text="--Select Shift--" Value="" />
                                                    <asp:ListItem Text="1" />
                                                    <asp:ListItem Text="2" />
                                                    <asp:ListItem Text="3" />
                                                </asp:DropDownList>
                                                <%--<asp:RequiredFieldValidator ID="rfvShift" runat="server" ControlToValidate="ddlShift" ErrorMessage="Shift is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>



                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <asp:Label ID="lblProductName" runat="server" Text="Product Name:" CssClass="form-label fw-semibold"></asp:Label>
                                                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control border-2  border-success-subtle" Placeholder="Product Name"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="txtProductName" ErrorMessage="Product Name is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" CssClass="form-label fw-semibold"></asp:Label>
                                                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control border-2 border-primary-subtle" Placeholder="Quantity"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                <%--<asp:RegularExpressionValidator ID="revQuantity" runat="server" ControlToValidate="txtQuantity" ValidationExpression="^\d+$" ErrorMessage="Quantity must be a number." CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
                                        </div>
                                    </div>

                                    <br />
                                </div>
                            </div>
                        </div>
                        <div runat="server" visible="false" id="SearchProduct" class="container-fluid bg-danger-subtle">
                            <div class="container py-5">
                                <div class="container from-group">
                                    <div class="row mt-3">
                                        <h1 class="display-6 text-Start fw-semibold">Search Product Name</h1>
                                        <div class="row mt-3">
                                            <div class="col-md-6 mb-3 ">
                                                <asp:Label ID="lblSearchProductName" runat="server" Text="Search Product Name:" CssClass="form-label fw-semibold"></asp:Label>
                                                <asp:TextBox ID="txtSearchProductName" runat="server" CssClass="form-control border-2 border-primary-subtle" Placeholder="Search Product Name"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="rfvShift" runat="server" ControlToValidate="txtSearchProductName" ErrorMessage="Product Name is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                <br />
                                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mt-2 border-2 border-primary-subtle" OnClick="btnSearch_Click" />
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 table-responsive-md my-5">
                                                    <h1 class="fw-semibold text-bg-danger-start">Product details</h1>
                                                    <asp:GridView Visible="false" ID="gvProductionData1" runat="server" CssClass="table-success table table-striped table-hover table-bordered align-middle text-center"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div runat="server" id="Report" visible="false" class="container-fluid bg-danger-subtle py-2">
                            <div class="container mt-2">
                                <div class="containerv mt-2">
                                    <h1 class="display-5 text-center fw-bold">Report</h1>
                                    <asp:Button ID="ShowReport" runat="server" Text="Show Report" CssClass="btn btn-success" OnClick="ShowReport_Click" />
                                    <div class="col-md-12 table-responsive-md my-5">
                                        <asp:GridView Visible="false" ID="gvProductionData" runat="server" CssClass="table-success table table-striped  table-hover table-bordered align-middle text-center"></asp:GridView>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div runat="server" id="Dashboard" style="width: auto; height: 100vh;" visible="false" class="container-fluid bg-danger-subtle py-2">
                            <div class="container-fluid mt-2">
                                <div class="container-fluid mt-2">
                                    <h1 class="display-5 text-center fw-bold">DashBoard</h1>

                                    <div>
                                        <figure class="highcharts-figure">
                                            <div id="containerClient" runat="server"></div>
                                            <p class="highcharts-description">
                                                Chart showing product quantities for different dates.
                                            </p>
                                        </figure>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>


</body>
</html>
