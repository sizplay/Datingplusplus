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
				<p>This report includes revenue from dates and yearly membership fees.</p>
				<div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr class="info">
                                        <th> Date </th>
                                        <th> Revenue </th>
                                        <th> Total Revenue </th> 
                                    </tr>
                                </thead>
								<tbody>
<%								
				String month = (String)request.getParameter("month");
				String year = (String)request.getParameter("year");
				int month_num = Integer.parseInt(request.getParameter("month"));
				int year_num = Integer.parseInt(request.getParameter("year"));
				int isLeapYear = (year_num % 4 == 0) ? 0 : 1 ;
				int day = 31 - ((month_num == 2) ? (3 - isLeapYear) : ((month_num - 1) % 7 % 2));
				String start = "";
				String end = "";
				start = year + "-" + month + "-01 00:00:00";
				end = year + "-" + month + "-" + day + " 23:59:59";
				
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
					
					/*
					SELECT '' as Date_Time, '' as BookingFee, SUM(TotalRevenue) + SUM(BookingFee) as TotalRevenue
						FROM(
							SELECT NOW() as Date_Time, 0 as BookingFee, SUM(Revenue) as TotalRevenue
							FROM 
							(SELECT U.PPP, U.DateOfLastAct, CASE WHEN U.PPP = 'Super-User' THEN 100
								ELSE 50 END AS Revenue
							FROM User U
							WHERE U.DateOfLastAct > '2014-10-03 23:59:59' AND U.DateOfLastAct < '2014-10-08 08:00:00' AND U.PPP <> 'User-User') as TB2
							UNION 
							Select D.Date_Time, D.BookingFee as BookingFee, 0 As revenue
							From Date D
							WHERE D.Date_Time > '2014-10-03 23:59:59' AND D.Date_Time < '2014-10-07 00:00:00'
							) as TB1
					UNION
						SELECT D.Date_Time, D.BookingFee as BookingFee, '' AS TotalRevenue
						FROM Date D
						WHERE D.Date_Time > '2014-10-03 23:59:59' AND D.Date_Time < '2014-10-07 00:00:00'
					UNION 
						SELECT U.DateOfLastAct, CASE WHEN U.PPP = 'Super-User' THEN 100
													ELSE 50 END AS Revenue, '' as TotalRevenue
						FROM User U
						WHERE U.DateOfLastAct > '2014-10-03 23:59:59' AND U.DateOfLastAct < '2014-10-08 08:00:00' AND U.PPP <> 'User-User'
					ORDER BY Date_Time DESC;
					*/
					
					String strQuery = "SELECT '' as Date_Time, '' as BookingFee, SUM(TotalRevenue) + SUM(BookingFee) as TotalRevenue FROM( SELECT NOW() as Date_Time, 0 as BookingFee, SUM(Revenue) as TotalRevenue FROM (SELECT U.PPP, U.DateOfLastAct, CASE WHEN U.PPP = 'Super-User' THEN 100 ELSE 50 END AS Revenue FROM User U WHERE U.DateOfLastAct > ? AND U.DateOfLastAct < ? AND U.PPP <> 'User-User') as TB2 UNION Select D.Date_Time, D.BookingFee as BookingFee, 0 As revenue From Date D WHERE D.Date_Time > ? AND D.Date_Time < ? ) as TB1 UNION SELECT D.Date_Time, D.BookingFee as BookingFee, '' AS TotalRevenue FROM Date D WHERE D.Date_Time > ? AND D.Date_Time < ? UNION SELECT U.DateOfLastAct, CASE WHEN U.PPP = 'Super-User' THEN 100 ELSE 50 END AS Revenue, '' as TotalRevenue FROM User U WHERE U.DateOfLastAct > ? AND U.DateOfLastAct < ? AND U.PPP <> 'User-User' ORDER BY Date_Time DESC";
					  
					PreparedStatement stm = conn.prepareStatement(strQuery);
					stm.setString(1, start);
					stm.setString(2, end);
					stm.setString(3, start);
					stm.setString(4, end);
					stm.setString(5, start);
					stm.setString(6, end);
					stm.setString(7, start);
					stm.setString(8, end);
					rs = stm.executeQuery();
					} catch(Exception e){
						e.printStackTrace();
					}
					while(rs.next()){
%>
                                  <tr>
                                     <td> <% out.print(rs.getString(1));%> </td>
                                     <td> <% out.print(rs.getString(2)); %> </td>
                                     <td> <% out.print(rs.getString(3)); %> </td>
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
