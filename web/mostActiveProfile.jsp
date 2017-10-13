
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <title>Dating++</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/modern-business.css" rel="stylesheet">

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
                        <li>
                            <a href="help.html">Any help?</a>
                        </li>
                        <li> <a href="index.html">Log Out</a> </li>    
                    </ul>
                </div>
                <!-- /.navbar-collapse --> 
            </div>
            <!-- /.container --> 
        </nav>

        <div class="col-md-9">
            <%
                String login = ((String) session.getAttribute("login"));
                String password = ((String) session.getAttribute("password"));
                
                String url = "jdbc:mysql://db4free.net:3306/";
                String dbName = "datingplusplus";
                String driver = "com.mysql.jdbc.Driver";
                String dbUserName = "sizplay";
                String dbPassword = "milk8012";
                List<String> results = new ArrayList<String>();
                // profile's information to be displayed
                int age = 0, datingAgeRangeStart = 0, datingAgeRangeEnd = 0, datingGeoRange = 0;
                String hobbies = "", gender = "", height = "", weight = "", haircolor = "", lastmoddate = "";
                String firstName = "", lastName = "", telephone = "";
                String street = "", city = "", state = "", zip = "", SSN = ""; // Store person's information to be displayed

                String queryPersonTable = "SELECT P.SSN,P.FirstName,P.LastName,P.Street,P.City,P.State,P.Zipcode,P.Telephone FROM Person P WHERE P.Email = '"
                        + login + "'";

                java.sql.ResultSet rs1 = DBConnection.ExecQuery(queryPersonTable);

                if (rs1 != null && rs1.next()) {
                    SSN = rs1.getString("SSN");
                    firstName = rs1.getString("firstName");
                    lastName = rs1.getString("lastName");
                    street = rs1.getString("Street");
                    city = rs1.getString("City");
                    state = rs1.getString("State");
                    zip = rs1.getString("Zipcode");
                    telephone = rs1.getString("Telephone");

                    String queryProfileTableUsingSSN = "SELECT P.Age,P.DatingAgeRangeStart,P.DatingAgeRangeEnd,P.DatinGeoRange,P.M_F,P.Hobbies,P.Height,P.Weight,P.HairColor,P.LastModDate FROM Profile P WHERE P.OwnerSSN = '"
                            + SSN + "";
                    java.sql.ResultSet rs2 = DBConnection.ExecQuery(queryProfileTableUsingSSN);
                    if (rs2 != null && rs2.next()) {
                        age = rs2.getInt("Age");
                        datingAgeRangeStart = rs2.getInt("DatingAgeRangeStart");
                        datingAgeRangeEnd = rs2.getInt("DatingAgeRangeEnd");
                        datingGeoRange = rs2.getInt("DatinGeoRange");
                        //gender = rs2.getString("M_F");
                        //hobbies = rs2.getString("Hobbies");
                        //height = rs2.getString("Height");
                        //weight = rs2.getString("Weight");
                        //haircolor = rs2.getString("HairColor");
                        //lastmoddate = rs2.getString("LastModDate");
                        
                    }

                    /*  SELECT Profile, (NumDates + Likes + ActiveValue) as ActiveValue
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
                     SELECT ProfileID, 50/(DATE(NOW()) - DATE(P.LastModDate)) as ActiveValue
                     FROM Profile P
                     GROUP BY ProfileID) as Table5 ON Table4.Profile = Table5.ProfileID
                     GROUP BY Profile
                     ORDER BY ActiveValue DESC;                     */
                    String queryMostActiveProfile = "";
                    java.sql.ResultSet rs3 = DBConnection.ExecQuery(queryMostActiveProfile);
                    if (rs3 != null && rs3.next()) {
                        
                    }

                    /* SELECT P.ProfileID, P.Age, U.Rating
                     FROM User U INNER JOIN Profile P ON SSN = OwnerSSN
                     ORDER BY U.Rating DESC;    */
                    
                    String result = "";
                    String queryMostHighlyRatedProfile = "SELECT P.ProfileID, P.Age, U.Rating "
                            + "FROM User U INNER JOIN Profile P ON SSN = ? "
                            + "ORDER BY U.Rating DESC";
                    
                    Connection conn = null;
                    Class.forName(driver).newInstance();
                    conn = DriverManager.getConnection(url + dbName, dbUserName,   
                                            dbPassword);
                    String profileID = "", rating = "";
                    PreparedStatement stm = conn.prepareStatement(queryMostHighlyRatedProfile);
                    stm.setString(1, SSN);
                    ResultSet rs = stm.executeQuery();
                    while(rs.next()) {
                        profileID = rs.getString("ProfileID");
                        age = Integer.parseInt(rs.getString("Age"));
                        rating = rs.getString("Rating");
                        result = profileID + ", who is of age " + age + " has a rating of " + rating;
                        results.add(result);
                    }
                    
                    //if (rs4 != null && rs4.next()) {
                        
                    //}
                }
                session.setAttribute("login", login);
                session.setAttribute("password", password);
            %>
        </div>

        <!-- Page Content -->
        <div class="container"> 

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Hello <%=firstName%>!</h1>
                </div>
            </div>
            <!-- /.row --> 

            <!-- Content Row -->
            <div class="row"> 
                <!-- Sidebar Column -->
                <div class="col-md-3">
                    <br>
                    <div  align="center"> <img alt="User Pic" src="http://cfile1.uf.tistory.com/image/157F513A4F18C3C70B199D" width="250" height="300" class="img-related"> </div>	

                    <br>
                    <div class="list-group"> <a href="profile.jsp" style="text-align:center" class="list-group-item">MyProfile</a> <a href="account.jsp" style="text-align:center" class="list-group-item">Account</a>
                        <a href="likes.jsp" style="text-align:center" class="list-group-item">View Likes</a> </div>
                </div>
                <!-- Content Column --> 
                <!-- PROFILE -->

                <div class="container">
                    <div class="row">

                        <div class=" toppad">
                            <div class="panel panel-info">

                                <div class="panel-body">
                                    <div class="row">

                                        <div class=" col-md-9 col-lg-9 ">
                                            <table class="table table-user-information">
                                                <tbody>
                                                    <tr class="category">
                                                        <td colspan="3"><strong>List of Most Active Profile</strong></td>
                                                    </tr>                                                 
                                                     <%
                                                        Iterator iterator = results.iterator();
                                                        String s = "";

                                                        while (iterator.hasNext()) {
                                                            s = ((String) iterator.next());
                                                            out.println("<tr>");
                                                            out.println("<td>" + "</td>");
                                                            out.println("<td>" + s + "</td>");
                                                            out.println("</tr>");
                                                        }

                                                    %>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PROFILE --> 

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container --> 

        <!-- jQuery --> 
        <script src="js/jquery.js"></script> 

        <!-- Bootstrap Core JavaScript --> 
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
