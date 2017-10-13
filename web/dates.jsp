<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                List<String> rs3Results = new ArrayList<String>();
                List<String> rs4Results = new ArrayList<String>();
                List<String> rs5Results = new ArrayList<String>();

                // profile's information to be displayed
                int datingAgeRangeStart = 0, datingAgeRangeEnd = 0;
                String hobbies = "", firstName = "";
                String SSN = "", profileID = ""; // Store person's information to be displayed
                String rs3Profile1 = "", rs3Profile2 = "", rs3DateTime = "", rs3Location = "", rs4Profile1 = "", rs4Profile2 = "", rs4DateTime = "", rs4Location = "";
                String rs5ProfileID = "", rs5Hobbies = "";
                String rs3Result = "", rs4Result = "", rs5Result;

                String queryPersonTable = "SELECT P.SSN,P.FirstName FROM Person P WHERE P.Email = '"
                        + login + "'";
                java.sql.ResultSet rs1 = DBConnection.ExecQuery(queryPersonTable);

                if (rs1 != null && rs1.next()) {
                    firstName = rs1.getString("FirstName");
                    SSN = rs1.getString("SSN");

                    String queryProfileTableUsingSSN = "SELECT * FROM Profile P WHERE P.OwnerSSN = '"
                            + SSN + "'";
                    java.sql.ResultSet rs2 = DBConnection.ExecQuery(queryProfileTableUsingSSN);
                    if (rs2 != null && rs2.next()) {
                        profileID = rs2.getString("ProfileID");
                        hobbies = rs2.getString("Hobbies");
                        datingAgeRangeStart = rs2.getInt("DatingAgeRangeStart");
                        datingAgeRangeEnd = rs2.getInt("DatingAgeRangeEnd");

                        /*  SELECT D.Profile1, D.Profile2, D.Location, Date_Time
                         FROM Date D
                         WHERE D.Date_Time < NOW() AND (D.Profile1 = 'Isabelle2014' 
                         OR D.Profile2 = 'Isabelle2014');*/
                        String queryPastDate = "SELECT D.Profile1, D.Profile2, D.Location, Date_Time FROM Date D WHERE D.Date_Time < NOW()"
                                + " AND (D.Profile1 =  '" + profileID + " ' OR D.Profile2 = '" + profileID + "')";
                        java.sql.ResultSet rs3 = DBConnection.ExecQuery(queryPastDate);
                        while (rs3.next()) {
                            rs3Profile1 = rs3.getString("Profile1");
                            rs3Profile2 = rs3.getString("Profile2");
                            rs3DateTime = rs3.getString("Date_Time");
                            rs3Location = rs3.getString("Location");
                            rs3Result = rs3Profile1 + " met with " + rs3Profile2 + " on " + rs3DateTime + " at " + rs3Location + "\n";
                            rs3Results.add(rs3Result);
                        }

                        /* SELECT D.Profile1, D.Profile2, D.Location, Date_Time
                         FROM Date D
                         WHERE D.Date_Time > NOW() AND (D.Profile1 = 'Isabelle2014' 
                         OR D.Profile2 = 'Isabelle2014'); */
                        String queryPendingDate = "SELECT D.Profile1, D.Profile2, D.Location, Date_Time FROM Date D WHERE (D.Date_Time > NOW() AND D.BookingFee = 0) "
                                + "AND (D.Profile1 = '" + profileID + "' OR D.Profile2 = '" + profileID + "')";
                        java.sql.ResultSet rs4 = DBConnection.ExecQuery(queryPendingDate);
                        while (rs4.next()) {
                            rs4Profile1 = rs4.getString("Profile1");
                            rs4Profile2 = rs4.getString("Profile2");
                            rs4DateTime = rs4.getString("Date_Time");
                            rs4Location = rs4.getString("Location");
                            rs4Result = rs4Profile2 + " will meet with " + rs4Profile1 + " on " + rs4DateTime + " at " + rs4Location + "\n";
                            rs4Results.add(rs4Result);
                        }

                        /*SELECT P.ProfileID, P.Hobbies
                         FROM Profile P
                         WHERE P.Hobbies LIKE '%football%' AND P.Age >= '20' AND P.Age <= '25' AND P.ProfileID <> 'Isabelle2014'; */
                        String queryPersonalizedDateSuggestionList = "SELECT P.ProfileID, P.Hobbies FROM Profile P WHERE P.Hobbies LIKE '%football%' "
                                + "AND P.Age >= '" + datingAgeRangeStart + "' AND P.Age <= '" + datingAgeRangeEnd + "' AND P.ProfileID <> '" + profileID + "'";
                        java.sql.ResultSet rs5 = DBConnection.ExecQuery(queryPersonalizedDateSuggestionList);
                        if (rs5 != null && rs5.next()) {
                            rs5ProfileID = rs5.getString("ProfileID");
                            rs5Hobbies = rs5.getString("Hobbies");
                            rs5Result = rs5ProfileID + ":   " + rs5Hobbies + "\n";
                            rs5Results.add(rs5Result);
                        }
                    }
                }
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
                                                        <td colspan="3"><strong>Pending Dates</strong> 
                                                            <button type="button" class="btn btn-primary" style="position:absolute;right:10px;top:2px;" data-toggle="modal" data-target="#dateModal">Cancel the pending date</button> </td>
                                                    </tr>
                                                    <!-- DateModal -->
                                                <div class="modal fade" id="dateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                                <h4 class="modal-title" id="myModalLabel">Cancel a date</h4>
                                                            </div>
                                                            <div class="modal-body">Would you like to cancel a pending date?</div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%
                                                    Iterator iterator1 = rs4Results.iterator();
                                                    String s1 = "";

                                                    while (iterator1.hasNext()) {
                                                        s1 = ((String) iterator1.next());
                                                        out.println("<tr>");
                                                        out.println("<td>" + "</td>");
                                                        out.println("<td>" + s1 + "</td>");
                                                        out.println("</tr>");
                                                    }
                                                %>
                                                <tr class="category">
                                                    <td colspan="3"><strong>Past Dates</strong></td>
                                                </tr>

                                                <%
                                                    Iterator iterator2 = rs3Results.iterator();
                                                    String s2 = "";

                                                    while (iterator2.hasNext()) {
                                                        s2 = ((String) iterator2.next());
                                                        out.println("<tr>");
                                                        out.println("<td>" + "</td>");
                                                        out.println("<td>" + s2 + "</td>");
                                                        out.println("</tr>");
                                                    }
                                                %>

                                                <tr class="category">
                                                    <td colspan="3"><strong>Personalized date suggestion list</strong></td>
                                                </tr>
                                                <%
                                                    Iterator iterator3 = rs5Results.iterator();
                                                    String s3 = "";

                                                    while (iterator3.hasNext()) {
                                                        s3 = ((String) iterator3.next());
                                                        out.println("<tr>");
                                                        out.println("<td>" + "</td>");
                                                        out.println("<td>" + s3 + "</td>");
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
