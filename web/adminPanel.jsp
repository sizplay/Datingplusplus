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

    <title>Dating++ Admin</title>

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
		//String login = ((String) session.getAttribute("login"));
        //String password = ((String) session.getAttribute("password"));
		//String firstName = ((String)session.getAttribute("firstName"));
		//String lastName = ((String)session.getAttribute("lastName"));
	%>

</head>

<body>

    <div id="wrapper">
		
        <%@ include file="navbar.jsp" %>
        <!-- Navigation -->
		<script>
		$("#dashboard").addClass("active");
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
                            Overview
                        </h1>
                    </div>
                </div>
				
				<div>
					<h3>
						Employees
					</h3>
				</div>
				
				 <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr class="info">
                                        <th> Name </th>
                                        <th> Email </th>
                                        <th> Role </th>    
                                        <th> SSN </th>
										<th> Start Date </th>
										<th> Hourly Rate </th>
										<th></th>
                                    </tr>
                                </thead>
								<tbody>
<%								
				String query = "SELECT Table2.FirstName, Table2.LastName,Table2.Email, Table2.Role, Table2.SSN, Table2.StartDate, Table2.HourlyRate, Table2.Street, Table2.City, Table2.State, Table2.City, Table2.Telephone, Table2.Zipcode FROM( SELECT * FROM ( SELECT DISTINCT Person.SSN as PersonSSN, Person.FirstName, Person.LastName, Person.Email, Person.Password, Person.Street, Person.City, Person.State, Person.Telephone, Person.ZipCode FROM Person INNER JOIN Employee ON Employee.SSN=Person.SSN) as Table1 RIGHT JOIN Employee ON Employee.SSN=Table1.PersonSSN) as Table2";
				int count = 1;
				java.sql.ResultSet rs = DBConnection.ExecQuery(query);
				while(rs.next()){
%>
                                  <tr>
                                     <td> <% out.print(rs.getString(1)) ;%> <% out.print(rs.getString(2));%> </td>
                                     <td> <% out.print(rs.getString(3)); %> </td>
                                     <td> <% out.print(rs.getString(4)); %> </td>
                                     <td> <% out.print(rs.getString(5)); %> </td>
									 <td> <% out.print(rs.getString(6)); %> </td>
									 <td> $<% out.print(rs.getString(7)); %> </td>
									 <td>
											<h5 style="color:blue"><button id="editButton" name="likes" type="submit" style="" class="pull-right" data-toggle="modal" data-target="#editModal<%=count%>" >Edit</button></h5>
											<!--<button id="editButton" name="edit" type="submit" style="" class="btn btn-primary pull-right" data-toggle="editM" data-target="#editModal" >Edit</button>-->
											<!-- EditModal -->
												<div class="modal fade" id="editModal<%=count%><%count++;%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
																				<input type="hidden" name="redirected" value="adminPanel"/>
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
									</td>
                                  </tr>
<%
				}
%>				
                                </tbody>
                            </table>
                        </div>
						
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
			
					<br>
				<div>
					<h3>Customers</h3>
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
                                    </tr>
                                </thead>
								<tbody>
<%								
				query = "SELECT DISTINCT Person.FirstName, Person.LastName, Person.Email, Person.Street, Person.City, Person.State, Person.ZipCode, Person.Telephone, Person.SSN FROM Person INNER JOIN Profile ON Profile.OwnerSSN=Person.SSN";
				/*
				SELECT DISTINCT Person.FirstName, Person.LastName, Person.Street, Person.City, Person.State, Person.ZipCode, Person.Email, Person.Telephone, Person.SSN
				FROM Person
				INNER JOIN Profile
				ON Profile.OwnerSSN=Person.SSN;
				*/
				rs = DBConnection.ExecQuery(query);
				while(rs.next()){
%>
                                  <tr>
                                     <td> <% out.print(rs.getString(1)) ;%> <% out.print(rs.getString(2));%> </td>
                                     <td> <% out.print(rs.getString(3)); %> </td>
                                     <td> <% out.print(rs.getString(4)); %> <% out.print(rs.getString(5)); %>, <% out.print(rs.getString(6)); %> <% out.print(rs.getString(7)); %> </td>
                                     <td> <% out.print(rs.getString(8)); %> </td>
									 <td> <% out.print(rs.getString(9)); %> </td>
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
	
	<!-- Other -->

</body>

</html>
