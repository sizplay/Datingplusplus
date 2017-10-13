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
		$("#customers").addClass("active");
		</script>
		
        <div id="page-wrapper">
			
            <div class="container-fluid">
				
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Customers<small></small>
                        </h1>
                    </div>
                </div>
				<p>This is a list of active customers based on a weighted scale.</p>
				<div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr class="info">
                                        <th> Name </th>
                                        <th> SSN </th>
                                        <th> Active Value </th>
                                    </tr>
                                </thead>
								<tbody>
<%
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
					SELECT ActiveValue + ActiveValue2 as ActiveValue, SSN, FirstName, LastName
						FROM (
							SELECT Profile, SUM(NumDates + Likes) as ActiveValue, OwnerSSN
								FROM(
									SELECT Profile, NumDates, IFNULL(Likes,0) as Likes
									FROM((
											SELECT Profile1 as Profile, SUM(count) as NumDates
											FROM(
											SELECT D.Profile1, COUNT(*) AS count
											FROM Date D
											GROUP BY D.Profile1
											UNION
											SELECT D.Profile2, COUNT(*) AS count
											FROM Date D
											GROUP BY D.Profile2) as Table1
										GROUP BY Profile1) as Table3
									LEFT JOIN (
										SELECT L.Likee, COUNT(*) AS Likes
										FROM Likes L
										GROUP BY Likee) as Table2 ON Table3.Profile = Table2.Likee)
									GROUP BY Profile) as Table4
									LEFT JOIN (
									SELECT ProfileID, OwnerSSN
									FROM Profile P
									GROUP BY ProfileID) as Table5 ON Table4.Profile = Table5.ProfileID
							GROUP BY OwnerSSN) as Table6
							LEFT JOIN(
							SELECT U.SSN, 50/(DATE(NOW()) - DATE(U.DateOfLastAct)) as ActiveValue2, FirstName, LastName
							FROM User U
							INNER JOIN Person P on U.SSN = P.SSN) as Table7 ON Table6.OwnerSSN = Table7.SSN
						ORDER BY ActiveValue DESC;	
					*/
					
					
					String strQuery = "SELECT ActiveValue + ActiveValue2 as ActiveValue, SSN, FirstName, LastName FROM ( SELECT Profile, SUM(NumDates + Likes) as ActiveValue, OwnerSSN FROM( SELECT Profile, NumDates, IFNULL(Likes,0) as Likes FROM(( SELECT Profile1 as Profile, SUM(count) as NumDates FROM( SELECT D.Profile1, COUNT(*) AS count FROM Date D GROUP BY D.Profile1 UNION SELECT D.Profile2, COUNT(*) AS count FROM Date D GROUP BY D.Profile2) as Table1 GROUP BY Profile1) as Table3 LEFT JOIN ( SELECT L.Likee, COUNT(*) AS Likes FROM Likes L GROUP BY Likee) as Table2 ON Table3.Profile = Table2.Likee) GROUP BY Profile) as Table4 LEFT JOIN ( SELECT ProfileID, OwnerSSN FROM Profile P GROUP BY ProfileID) as Table5 ON Table4.Profile = Table5.ProfileID GROUP BY OwnerSSN) as Table6 LEFT JOIN( SELECT U.SSN, 50/(DATE(NOW()) - DATE(U.DateOfLastAct)) as ActiveValue2, FirstName, LastName FROM User U INNER JOIN Person P on U.SSN = P.SSN) as Table7 ON Table6.OwnerSSN = Table7.SSN ORDER BY ActiveValue DESC";
					  
					PreparedStatement stm = conn.prepareStatement(strQuery);
					rs = stm.executeQuery();
					} catch(Exception e){
						e.printStackTrace();
					}
					while(rs.next()){
%>
                                  <tr>
                                     <td> <% out.print(rs.getString(3));%> <% out.print(rs.getString(4));%></td>
                                     <td> <% out.print(rs.getString(2)); %> </td>
                                     <td> <% out.print(rs.getString(1)); %> </td>
                                  </tr>
<%
				}
%>				
                                </tbody>
                            </table>
                        </div>
						<p>This is a list of active profiles based on a weighted scale.</p>
				<div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr class="info">
                                        <th> Profile </th>
                                        <th> Active Value </th>
                                    </tr>
                                </thead>
								<tbody>
<%
				try{
					Class.forName(driver).newInstance();
					conn = DriverManager.getConnection(url + dbName, dbUserName, dbPassword);
					/*
					SELECT ActiveValue + ActiveValue2 as ActiveValue, SSN, FirstName, LastName
						FROM (
							SELECT Profile, SUM(NumDates + Likes) as ActiveValue, OwnerSSN
								FROM(
									SELECT Profile, NumDates, IFNULL(Likes,0) as Likes
									FROM((
											SELECT Profile1 as Profile, SUM(count) as NumDates
											FROM(
											SELECT D.Profile1, COUNT(*) AS count
											FROM Date D
											GROUP BY D.Profile1
											UNION
											SELECT D.Profile2, COUNT(*) AS count
											FROM Date D
											GROUP BY D.Profile2) as Table1
										GROUP BY Profile1) as Table3
									LEFT JOIN (
										SELECT L.Likee, COUNT(*) AS Likes
										FROM Likes L
										GROUP BY Likee) as Table2 ON Table3.Profile = Table2.Likee)
									GROUP BY Profile) as Table4
									LEFT JOIN (
									SELECT ProfileID, OwnerSSN
									FROM Profile P
									GROUP BY ProfileID) as Table5 ON Table4.Profile = Table5.ProfileID
							GROUP BY OwnerSSN) as Table6
							LEFT JOIN(
							SELECT U.SSN, 50/(DATE(NOW()) - DATE(U.DateOfLastAct)) as ActiveValue2, FirstName, LastName
							FROM User U
							INNER JOIN Person P on U.SSN = P.SSN) as Table7 ON Table6.OwnerSSN = Table7.SSN
						ORDER BY ActiveValue DESC;	
					*/
					
					
					String strQuery = "SELECT Profile, (NumDates + Likes + ActiveValue) as ActiveValue FROM( SELECT Profile, NumDates, IFNULL(Likes,0) as Likes FROM(( SELECT Profile1 as Profile, SUM(count) as NumDates FROM( SELECT D.Profile1, COUNT(*) AS count FROM Date D GROUP BY D.Profile1 UNION SELECT D.Profile2, COUNT(*) AS count FROM Date D GROUP BY D.Profile2) as Table1 GROUP BY Profile1) as Table3 LEFT JOIN ( SELECT L.Likee, COUNT(*) AS Likes FROM Likes L GROUP BY Likee) as Table2 ON Table3.Profile = Table2.Likee) GROUP BY Profile) as Table4 LEFT JOIN ( SELECT ProfileID, 50/(DATE(NOW()) - DATE(P.LastModDate)) as ActiveValue FROM Profile P GROUP BY ProfileID) as Table5 ON Table4.Profile = Table5.ProfileID GROUP BY Profile ORDER BY ActiveValue DESC";
					  
					PreparedStatement stm = conn.prepareStatement(strQuery);
					rs = stm.executeQuery();
					} catch(Exception e){
						e.printStackTrace();
					}
					while(rs.next()){
%>
                                  <tr>
                                     <td> <% out.print(rs.getString(1));%></td>
                                     <td> <% out.print(rs.getString(2)); %> </td>
                                  </tr>
<%
				}
%>				
                                </tbody>
                            </table>
                        </div>
				<form action="customers.jsp" method="post">
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
