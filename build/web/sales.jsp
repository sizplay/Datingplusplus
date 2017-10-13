<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	
</head>

<body>

    <div id="wrapper">
	    <%@ include file="navbar.jsp" %>
		<script>
		$("#sales").addClass("active");
		</script>
		
        <div id="page-wrapper">
			
            <div class="container-fluid">
				
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Revenue<small></small>
                        </h1>
                    </div>
                </div>
				
    <div class="row">
		<div class="col-lg-6">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">Monthly Sales Reports</h3>
				</div>
				<div class="panel-body">
                    <p>
					  Obtain a sales report for a particular month.
					</p>
					<form name="monthlyreport" action="salesReport.jsp" method="post" 
						  onsubmit="">
					<div class="col-md-5">	  
					  <select name='month' class="form-control">
						<option selected value=''>Month</option>
						<option value='1'>January</option>
						<option value='2'>February</option>
						<option value='3'>March</option>
						<option value='4'>April</option>
						<option value='5'>May</option>
						<option value='6'>June</option>
						<option value='7'>July</option>
						<option value='8'>August</option>
						<option value='9'>September</option>
						<option value='10'>October</option>
						<option value='11'>November</option>
						<option value='12'>December</option>
					  </select>
					</div>
					<div class="col-lg-5">
					  <select name='year'class="form-control">
						<option selected value=''>Year</option>
						<% int max = new java.util.Date().getYear() + 1900 - 2011;
						   for(int i=0;i<=max;i++) { %>
						<option value='<%= 2011+i%>'><%= 2011+i%></option>
						<% } %>
					  </select>
					 </div>
					 <div class="col-lg-2">
					  <button class="btn btn-primary" value="getReport" type="submit">Send</button>
					 </div>
					</form>
				  </div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Customer Rep. Revenue</h3>
					</div>
					<div class="panel-body">
					 <div class="col-lg-12">
						<p>
						  Determine which customer representative generated most total revenue
						</p>
						<form name="EmployeeOfTheCompany" action="mostRevenueCusRep.jsp" method="post">
						  <button class="btn btn-primary pull-right" type="submit">Query</button>
						</form>
					  </div>
					 </div> 
					</div>
				  </div>
			<div class="col-lg-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Customer Revenue</h3>
					</div>
					<div class="panel-body">
					  <div class="col-lg-12">
						<p>
						  Determine which customer generated most total revenue
						</p>
						<form name="BestCustomer" action="mostRevenueCus.jsp" method="post">
						  <button class="btn btn-primary pull-right" type="submit">Query</button>
						</form>
								
							
					  </div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row equal">
			<div class="col-lg-6">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">Date Revenue Listing</h3>
						</div>
						<div class="panel-body">
						    <p>
							  Produce a summary listing of revenue on a particular calendar date.
							</p>
								<form name="monthlyreport" action="salesReportByDay.jsp" method="post" onsubmit="">
								<div class="col-md-4">	  
								  <select name='month' class="form-control">
									<option selected value=''>Month</option>
									<option value='1'>January</option>
									<option value='2'>February</option>
									<option value='3'>March</option>
									<option value='4'>April</option>
									<option value='5'>May</option>
									<option value='6'>June</option>
									<option value='7'>July</option>
									<option value='8'>August</option>
									<option value='9'>September</option>
									<option value='10'>October</option>
									<option value='11'>November</option>
									<option value='12'>December</option>
								  </select>
								</div>
								<div class="col-lg-3">
								  <select name='day'class="form-control">
									<option selected value=''>Day</option>
									<% max = 31;
									   for(int i=1;i<=max;i++) { %>
									<option value='<%=i%>'><%=i%></option>
									<% } %>
								  </select>
								 </div>
								<div class="col-lg-3">
								  <select name='year'class="form-control">
									<option selected value=''>Year</option>
									<% max = new java.util.Date().getYear() + 1900 - 2011;
									   for(int i=0;i<=max;i++) { %>
									<option value='<%= 2011+i%>'><%= 2011+i%></option>
									<% } %>
								  </select>
								 </div>
								 <div class="col-lg-2">
								  <button class="btn btn-primary" value="getReport" type="submit">Query</button>
								 </div>
								</form>
						</div>
				</div>
			</div>
			<div class="col-lg-6">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">Date Revenue Listing</h3>
						</div>
						<div class="panel-body">
						    <p>
							  Produce a summary listing of revenue involving a particular customer.
							</p>
							Customer Name: 
							<form class="in-line" name="RevenueCus" action="salesReportByCustomer.jsp" method="post">
								<div class="input-group">
								  <input type="text" class="form-control" name="fullName">
								  <span class="input-group-btn">
									<button class="btn btn-primary" type="submit">Query</button>
								  </span>
								</div>
							</form>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
