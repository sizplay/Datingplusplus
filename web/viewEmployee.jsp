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
		$("#employees").addClass("active");
		</script>
		
        <div id="page-wrapper">

            <div class="container-fluid">
    
                <!-- Page Heading -->
				
				<!-- Updating Infomation Alert -->		
				<script>
					window.setTimeout(function() {
					$(".alert").fadeTo(500, 0).slideUp(500, function(){
						$(this).remove(); 
					});
				}, 1500);
				</script>
				<%  if((String)session.getAttribute("success") != null){
					String success = (String)session.getAttribute("success");
					if(success.equals("success")){%>
								<div class="alert alert-success" role="alert">Information successfully updated.</div>
				<%	session.setAttribute("success", "failure");		
					}}
					%>
				<!-- Updating Infomation Alert -->	
				
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
						<div> 
							<button type="btn btn-primary" class="btn btn-primary" style="height:40px; width:100%;" data-toggle="modal" data-target="#editModal">Edit Information</button>
						</div>
						<br>
						<div>	
							<button type="btn btn-danger" class="btn btn-danger" style="height:40px; width:100%;" data-toggle="modal" data-target="#deleteModal">Delete this Employee</button>
						</div>
                </div>
			<%
			query = "SELECT Table2.FirstName, Table2.LastName,Table2.Email, Table2.Role, Table2.SSN, Table2.StartDate, Table2.HourlyRate, Table2.Street, Table2.City, Table2.State, Table2.City, Table2.Telephone, Table2.Zipcode FROM( SELECT * FROM ( SELECT DISTINCT Person.SSN as PersonSSN, Person.FirstName, Person.LastName, Person.Email, Person.Password, Person.Street, Person.City, Person.State, Person.Telephone, Person.ZipCode FROM Person INNER JOIN Employee ON Employee.SSN=Person.SSN) as Table1 RIGHT JOIN Employee ON Employee.SSN=Table1.PersonSSN) as Table2 WHERE Table2.SSN = + '" + SSN + "' ";
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
                                                        <td colspan="3"><strong>Employee Information</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Role</td>
                                                        <td><%out.print(rs.getString("Role"));%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Start Date</td>
                                                        <td><%out.print(rs.getString("StartDate"));%></td>
                                                    </tr>            
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Hourly Rate</td>
                                                        <td>$<%out.print(rs.getString("HourlyRate"));%>/hr</td>
                                                    </tr>                         
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				
				<!-- EditModal -->
					<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title" id="myModalLabel">Editing Information for <% out.print(rs.getString(1)) ;%> <% out.print(rs.getString(2));%> </h4>
								</div>
								<div class="modal-body">
									<!-- The form is placed inside the body of modal -->
									<form id="updateInformation" method="post" class="form-horizontal" action="editEmployee.jsp">
									
										<div class="form-group">
										<label class="col-sm-3 control-label"></label>
											<div class="col-sm-5">
													<input type="hidden" name="SSN" value="<%=rs.getString(5)%>"/>
											</div>
										</div>
										
										<div class="form-group">
										<label class="col-sm-3 control-label"></label>
											<div class="col-sm-5">
													<input type="hidden" name="redirected" value="viewEmployee"/>
											</div>
										</div>
								
										<div class="form-group">
											<label class="col-sm-3 control-label">First Name</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="firstName" value="<% out.print(rs.getString(1));%>"/>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 control-label">Last Name</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="lastName" value="<% out.print(rs.getString(2));%>"/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Street</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="street" value="<%out.print(rs.getString("Street"));%>"/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">City</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="city" value="<% out.print(rs.getString("City"));%>"/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">State</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="state" value="<% out.print(rs.getString("State"));%>"/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Zip Code</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="zipCode" value="<% out.print(rs.getString("Zipcode"));%>"/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Telephone</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="telephone" value="<% out.print(rs.getString("Telephone"));%>"/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">SSN</label>
											<div class="col-sm-5">
												<input id="disabledInput" type="text" class="form-control" name="SSNf" value="<% out.print(rs.getString("SSN"));%>" disabled>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Role</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="role" value="<% out.print(rs.getString("Role"));%>"/>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Start Date</label>
											<div class="col-sm-5">
												<input id="disabledInput" type="text" class="form-control" name="startDate" value="<% out.print(rs.getString("StartDate"));%>" disabled>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label">Hourly Rate</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" name="hourlyRate" value="<% out.print(rs.getString("HourlyRate"));%>"/>
											</div>
										</div>
									</div>
									<div class="modal-footer">
												<button type="submit" class="btn btn-primary">Change</button>
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
									</div>
								</form>
							</div>
						</div>
					</div>
				<!-- EditModal -->
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
									<form id="deleteProfile" method="post" class="form-horizontal" action="deleteEmployee.jsp">
													<input type="hidden" name="SSN" value="<%=rs.getString(5)%>"/>
									<h4>Are you sure you want to delete this employee?</h4>		
								</div>
									<div class="modal-footer">
												<button type="submit" class="btn btn-danger">Delete</button>
												<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> 
									</div>
								</form>
							</div>
						</div>
					</div>
				<!-- EditModal -->
				<%
				} %>
			</div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
<style>
.panel {
    border: 0;
}
.table > thead > tr > th, .table > thead > tr > td {
    border: 0;
}

</style>
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
