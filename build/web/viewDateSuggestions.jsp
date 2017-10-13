
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.*"%>
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

        <title>Dating++</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/modern-business.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body background="./images/background.jpg">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container"> 
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand" href="profile.jsp">Dating++</a> </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="browse.jsp">Search</a> </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dates<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="dates.jsp">Past Dates</a>
                                </li>
                                <li>
                                    <a href="dates.jsp">Pending Dates</a>
                                </li>  
                                <li>
                                    <a href="viewDateSuggestions.jsp">Personalized date suggestion list</a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Profiles<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="mostActiveProfile.jsp">Most active profiles</a>
                                </li>
                                <li>
                                    <a href="mostActiveProfile.jsp">Most highly rated profiles</a>
                                </li>                            
                            </ul>
                        </li>                       
                        <li> <a href="edit_account.jsp">Setting Account</a> </li>    
                        <li> <a href="index.html">Log Out</a> </li>    
                    </ul>
                </div>
                <!-- /.navbar-collapse --> 
            </div>
            <!-- /.container --> 
        </nav>

        <!-- Page Content -->

        <div class="container">

            <!-- Page Heading/Breadcrumbs -->   
            <form action="filtering search.jsp" method="post">     
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Date Suggestions
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="profile.jsp">Home Profile</a>
                            </li>
                            <li class="active">Browse</li>
                        </ol>

                        <div class="col-md-4 col-lg-12">          
            <div class="row">
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
					
                    String login = ((String) session.getAttribute("login"));
                    String password = ((String) session.getAttribute("password"));
					String profileID = "";
					int age = 0;
					String SSN = "";
					
					String queryPersonTable = "SELECT P.SSN,P.FirstName FROM Person P WHERE P.Email = '"
                        + login + "'";
					java.sql.ResultSet rs1 = DBConnection.ExecQuery(queryPersonTable);

					if (rs1 != null && rs1.next()) {
						SSN = rs1.getString("SSN");
					}
                    String queryProfileTableUsingSSN = "SELECT * FROM Profile P WHERE P.OwnerSSN = '"
                            + SSN + "'";
                    java.sql.ResultSet rs2 = DBConnection.ExecQuery(queryProfileTableUsingSSN);
                    if (rs2 != null && rs2.next()) {
						profileID = rs2.getString("ProfileID");
						age = rs2.getInt("Age");
					}
			
                    String firstName, lastName;
                    String city, State;

                    //String queryPersonTable = "SELECT P.FirstName,P.LastName,P.City,P.State,P.SSN FROM Person P";
                    /* 
                     SELECT Table2.SSN, Table2.FirstName, Table2.LastName, Table2.City, Table2.State, Table2.ProfileID
                     FROM(
                     SELECT *
                     FROM
                     (
                     SELECT DISTINCT Person.SSN, Person.FirstName, Person.LastName, Person.City, Person.State
                     FROM Person
                     INNER JOIN Profile
                     ON Profile.OwnerSSN=Person.SSN) as Table1
                     RIGHT JOIN Profile
                     ON Profile.OwnerSSN=Table1.SSN) as Table2
                     */
					 /*
					 SELECT DISTINCT ProfileID, DatingAgeRangeStart, DatingAgeRangeEnd
						FROM Profile P
						WHERE ProfileID NOT IN(
							SELECT DISTINCT Profile.ProfileID
							FROM Date, Profile 
							WHERE (Profile1 = ? AND Profile2 = Profile.ProfileID) OR 
									(Profile2 = ? AND Profile1 = Profile.ProfileID)) AND DatingAgeRangeStart < ? AND DatingAgeRangeEnd > ?
					*/				
					
					String strQuery = "SELECT DISTINCT ProfileID, DatingAgeRangeStart, DatingAgeRangeEnd FROM Profile P WHERE ProfileID NOT IN( SELECT DISTINCT Profile.ProfileID FROM Date, Profile  WHERE (Profile1 = ? AND Profile2 = Profile.ProfileID) OR (Profile2 = ? AND Profile1 = Profile.ProfileID)) AND DatingAgeRangeStart < ? AND DatingAgeRangeEnd > ?";
					
					PreparedStatement stm = conn.prepareStatement(strQuery);
					stm.setString(1, profileID);
					stm.setString(2, profileID);
					stm.setInt(3, age);
					stm.setInt(4, age);
					rs = stm.executeQuery();
					}catch(Exception e){
						e.printStackTrace();
					}
                    double wow = .1;
                    while (rs.next()) {
                %>
                <div id="ProfileBox" class="col-md-3 text-center wow fadeInUpBig" data-wow-delay="<%=wow%><%wow = wow + .1;%>s">
                    <div class="thumbnail">
                        <a href="viewProfile.jsp?ID=<%=rs.getString(1)%>"><img id="pimage" class="img-responsive" src="http://placehold.it/250x300" alt=""></a>
                        <div class="caption">
                            <a href="viewProfile.jsp?ID=<%=rs.getString(1)%>"><h4> <% out.print(rs.getString(1));%></a><br>
                            </h4>
                            <p>Dating Range: <% out.print(rs.getString(2));%> - <% out.print(rs.getString(3)); %></p>
                        </div>
                    </div>
                </div>
                <%
                    }

                %>

            </div>

            <hr>

            <!-- Footer -->
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p>Copyright &copy; Your Website 2014</p>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
        <script src="js/ch_animate.js"></script>

    </body>

</html>
