<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>

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
	String fullName = (String)request.getParameter("fullName");
%>	
	
	
</head>

<body>

    <div id="wrapper">
	    <%@ include file="navbar.jsp" %>
		<script>
		$("#dates").addClass("active");
		</script>
		
        <div id="page-wrapper">
			
            <div class="container-fluid">
				
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dates<small></small>
                        </h1>
                    </div>
                </div>
				<p>This table shows all dates by customer <%=fullName%>.</p>
				<div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr class="info">
                                        <th> UserID </th>
                                        <th> Profile 1 </th>
                                        <th> Profile 2 </th>
										<th> Customer Representative </th>
										<th> Location </th>
										<th> Booking Fee </th>
										<th> Date/Time </th>
                                    </tr>
                                </thead>
								<tbody>
<%								
				String[] names = fullName.split(" ");

				Connection conn = null;
				String url = "jdbc:mysql://db4free.net:3306/";
				String dbName = "datingplusplus";
				String driver = "com.mysql.jdbc.Driver";
				String dbUserName = "sizplay";
				String dbPassword = "milk8012";
				ResultSet rs = null;
				try{
					Class.forName(driver).newInstance();
					conn = DriverManager.getConnection(url + dbName, dbUserName, dbPassword);
					
					
					String strQuery = "SELECT ProfileID, Profile1, Profile2, CustRep, Location, BookingFee, Date_Time FROM( SELECT SSN, ProfileID, FirstName, LastName FROM Person JOIN Profile ON Person.SSN = Profile.OwnerSSN WHERE FirstName = ? AND LastName = ?) as TB1 JOIN Date ON TB1.ProfileID = Date.Profile1 OR TB1.ProfileID = Date.Profile2";
					  
					PreparedStatement stm = conn.prepareStatement(strQuery);
					stm.setString(1, names[0]);
					stm.setString(2, names[1]);
					
					rs = stm.executeQuery();
					} catch(Exception e){
						e.printStackTrace();
					}
					while(rs.next()){
%>
                                  <tr>
                                     <td> <% out.print(rs.getString(1));%></td>
                                     <td> <% out.print(rs.getString(2)); %> </td>
                                     <td> <% out.print(rs.getString(3)); %> </td>
                                     <td> <% out.print(rs.getString(4)); %> </td>
                                     <td> <% out.print(rs.getString(5)); %> </td>
									 <td> <% out.print(rs.getString(6)); %> </td>
									 <td> <% out.print(rs.getString(7)); %> </td>
                                  </tr>
<%
				}
%>				
                                </tbody>
                            </table>
                        </div>
				<form action="javascript: history.go(-1)" method="post">
				<button id="backButton" name="likes" type="submit" style="" class="btn btn-primary">Back</button>
			</form>		
						
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
