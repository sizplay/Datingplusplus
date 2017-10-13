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
	
	<style>
	#editButton {
		background:none!important;
		 border:none; 
		 padding:0!important;
		/*border is optional*/
		 border-bottom:0px solid #444; 
		 cursor: pointer;
	}
	</style>	
</head>

<body>

    <div id="wrapper">
	    <%@ include file="navbar.jsp" %>
		<script>
		$("#customers").addClass("active");
		</script>
		
        <div id="page-wrapper">
			
            <div class="container-fluid">
				<!-- Updating Infomation Alert -->		
				<script>
					window.setTimeout(function() {
					$(".alert").fadeTo(500, 0).slideUp(500, function(){
						$(this).remove(); 
					});
				}, 2000);
				</script>
				<%  if((String)session.getAttribute("success") != null){
					String success = (String)session.getAttribute("success");
					if(success.equals("successDelete")){%>
								<div class="alert alert-success" role="alert">Customer has been deleted.</div>
				<%}	session.setAttribute("success", "failure");		
					}
					%>
				<!-- Updating Infomation Alert -->	
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Customers<small></small>
                        </h1>
                    </div>
                </div>
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">Highest Rated Customer</h3>
								</div>
								<div class="panel-body">
								<p>
								Obtain a list of customers based upon ratings.
								</p>
								<form name="highestRatedCustomer" action="highestRated.jsp" method="post">
									<button class="btn btn-primary pull-right" type="submit">Query</button>
								</form>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">Most Active Customer</h3>
								</div>
								<div class="panel-body">
								<p>
								Obtain a list of active customers based upon a weighted average.
								</p>
								<form name="activeCustomers" action="activeCustomers.jsp" method="post">
									<button class="btn btn-primary pull-right" type="submit">Query</button>
								</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				 <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr class="info">
                                        <th> Name </th>
                                        <th> Email </th>
                                        <th> Address </th>    
                                        <th> Telephone </th>
										<th> SSN </th>
										<th> </th>
                                    </tr>
                                </thead>
								<tbody>
<%								
				String query = "SELECT DISTINCT Person.FirstName, Person.LastName, Person.Email, Person.Street, Person.City, Person.State, Person.ZipCode, Person.Telephone, Person.SSN FROM Person INNER JOIN Profile ON Profile.OwnerSSN=Person.SSN";
				/*
				SELECT DISTINCT Person.FirstName, Person.LastName, Person.Street, Person.City, Person.State, Person.ZipCode, Person.Email, Person.Telephone, Person.SSN
				FROM Person
				INNER JOIN Profile
				ON Profile.OwnerSSN=Person.SSN;
				*/
				java.sql.ResultSet rs = DBConnection.ExecQuery(query);
				while(rs.next()){
%>
                                  <tr>
                                     <td> <% out.print(rs.getString(1)) ;%> <% out.print(rs.getString(2));%> </td>
                                     <td> <% out.print(rs.getString(3)); %> </td>
                                     <td> <% out.print(rs.getString(4)); %> <% out.print(rs.getString(5)); %>, <% out.print(rs.getString(6)); %> <% out.print(rs.getString(7)); %> </td>
                                     <td> <% out.print(rs.getString(8)); %> </td>
									 <td> <% out.print(rs.getString(9)); %> </td>
									 <td>
										<form action="viewCustomer.jsp" method="post">
												<input type="hidden" name="SSN" value="<%=rs.getString(9)%>"/>
											<h5 style="color:blue"><button id="editButton" name="viewCustomer" type="submit" style="" class="pull-right">View</button></h5>
										</form>		
									</td>
                                  </tr>
<%
				}
%>				
                                </tbody>
                            </table>
                        </div>
				
				
				
            </div>
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
