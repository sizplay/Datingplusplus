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
	<%
	String SSN = (String)request.getParameter("SSN");
	
	String query = "SELECT Person.FirstName, Person.LastName FROM Person WHERE Person.SSN = '" + SSN + "'";
	java.sql.ResultSet rs = DBConnection.ExecQuery(query);
        String firstName2 = "";
        String lastName2= "";
	if(rs.next()){
		firstName2 = rs.getString("FirstName");
		lastName2 = rs.getString("LastName");
	}
	%>
</head>

<body>

    <div id="wrapper">
	
		<%@ include file="navbar.jsp" %>
		<script>
		$("#customer").addClass("active");
		</script>
		
        <div id="page-wrapper">

            <div class="container-fluid">
    
                <!-- Page Heading -->
				
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <%=firstName2%> <%=lastName2%><small></small>
                        </h1>
                    </div>
                </div>
			<div class="row">
					<div class="col-md-3">
                    <br>
                    <div align="center"> <img alt="User Pic" src="http://placehold.it/250x300" width="250" height="300" class="img-related"> </div>	

                    <br>
						<form action="datesByCustomer.jsp">
						<div>
							<input class="form-control" type="hidden" name="fullName" value="<%=firstName2%> <%=lastName2%>"/>
							<button type="submit" class="btn btn-primary" style="height:40px; width:100%;">View Dates</button>
						</div>
						</form>
						<br>
						<form action="usersDated.jsp">
						<div>	
							<input class="form-control" type="hidden" name="fullName" value="<%=firstName2%> <%=lastName2%>"/>
							<button type="submit" class="btn btn-success" style="height:40px; width:100%;">Users Dated</button>
						</div>
						</form>
						<br>
						<div>	
							<button type="btn btn-danger" class="btn btn-danger" style="height:40px; width:100%;" data-toggle="modal" data-target="#deleteModal">Delete this Customer</button>
						</div>
                </div>
			<%
			query = "SELECT DISTINCT Person.FirstName, Person.LastName, Person.Email, Person.Street, Person.City, Person.State, Person.ZipCode, Person.Telephone, Person.SSN FROM Person INNER JOIN Profile ON Profile.OwnerSSN=Person.SSN WHERE Person.SSN = '" + SSN + "' ";
			rs = DBConnection.ExecQuery(query);
			if(rs.next()){
			%>
				<div class="container">
                    <div class="row">

                        <div class=" toppad">
                            <div class="panel panel-info">

                                <div class="panel-body">
                                    <div class="row">

                                        <div class=" col-md-9 col-lg-9 ">
                                            <table class="table table-user-information">
                                                <tbody>
													<tr class="category info">
                                                        <td colspan="3"><strong>Personal Information</strong></td>
                                                    </tr>
													<tr>                      
                                                        <td class="trait" rowspan="1">First Name</td>
                                                        <td><%out.print(rs.getString("FirstName"));%></td>
                                                    </tr> 
													<tr>                      
                                                        <td class="trait" rowspan="1">Last Name</td>
                                                        <td><%out.print(rs.getString("LastName"));%></td>
                                                    </tr> 
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">SSN</td>
                                                        <td><%out.print(rs.getString("SSN"));%></td>
                                                    </tr> 
                                                    <tr class="category info">
                                                        <td colspan="3"><strong>Contact Information</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Street</td>
                                                        <td><%out.print(rs.getString("Street"));%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">City</td>
                                                        <td><%out.print(rs.getString("City"));%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">State</td>
                                                        <td><%out.print(rs.getString("State"));%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">ZipCode</td>
                                                        <td><%out.print(rs.getString("ZipCode"));%></td>
                                                    </tr>
													 <tr>                      
                                                        <td class="trait" rowspan="1">Email</td>
                                                        <td><%out.print(rs.getString("Email"));%></td>
                                                    </tr>
													<tr>                      
                                                        <td class="trait" rowspan="1">Telephone</td>
                                                        <td><%out.print(rs.getString("Telephone"));%></td>
                                                    </tr>
													<tr class="category info">
                                                        <td colspan="3"><strong>Payment and Account Information</strong></td>
                                                    </tr>
<%
			}
			query = "SELECT * FROM Account WHERE Account.OwnerSSN = '" + SSN + "'";
			rs = DBConnection.ExecQuery(query);
			while(rs.next()){
%>													
													<tr>                      
                                                        <td class="trait" rowspan="1">Credit Card</td>
                                                        <td><%out.print(rs.getString("CardNumber"));%></td>
                                                    </tr>
													<tr>                      
                                                        <td class="trait" rowspan="1">Account Number</td>
                                                        <td><%out.print(rs.getString("AcctNum"));%></td>
                                                    </tr>
													<tr>                      
                                                        <td class="trait" rowspan="1">Account Creation</td>
                                                        <td><%out.print(rs.getString("AcctCreation"));%></td>
                                                    </tr>
													<tr class="divider"></tr>
			
													
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- DeleteModal -->
					<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content panel-warning">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title" id="myModalLabel">Warning!</h4>
								</div>
								<div class="modal-body">
										<!-- The form is placed inside the body of modal -->
									<form id="deleteProfile" method="post" class="form-horizontal" action="deleteCustomer.jsp">
													<input type="hidden" name="SSN" value="<%=SSN%>"/>
										<h4>Are you sure you want to delete this customer?</h4>		
								</div>
								<div class="modal-footer">
												<button type="submit" class="btn btn-danger">Delete</button>
												<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> 
								</div>
								</form>
							</div>
						</div>
					</div>
				<!-- DeleteModal -->
			</div>
            <!-- /.container-fluid -->
<%
			}
%>
        </div>
        <!-- /#page-wrapper -->
		</div>
    </div>
<style>
.panel {
    border: 0;
}
.table > thead > tr > th, .table > thead > tr > td {
    border: 0;
}

</style>
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
