
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

                String cardNumber = "", acctNum = "", acctCreation = "";
                String firstName = "", lastName = "", telephone = "", email = "";
                String street = "", city = "", state = "", zip = "", SSN = ""; // Store person's information to be displayed

                String queryPersonTable = "SELECT P.SSN,P.FirstName,P.LastName,P.Street,P.City,P.State,P.Zipcode,P.Telephone,P.Email FROM Person P WHERE P.Email = '"
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
                    email = rs1.getString("Email");

                    String queryAccountTableUsingSSN = "SELECT A.CardNumber,A.AcctNum,A.AcctCreation FROM Account A WHERE A.OwnerSSN = '"
                            + SSN + "'";
                    java.sql.ResultSet rs2 = DBConnection.ExecQuery(queryAccountTableUsingSSN);
                    if (rs2 != null && rs2.next()) {
                        cardNumber = rs2.getString("CardNumber");
                        acctNum = rs2.getString("AcctNum");
                        acctCreation = rs2.getString("AcctCreation");
                    }
                }

                session.setAttribute("register", "");
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
                                                        <td colspan="3"><strong>User Information</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Name</td>
                                                        <td><%=firstName%> <%=lastName%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Street</td>
                                                        <td><%=street%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">City</td>
                                                        <td><%=city%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">State</td>
                                                        <td><%=state%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Zip Code</td>
                                                        <td><%=zip%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Email</td>
                                                        <td><%=email%></td>
                                                    </tr>  
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">TelePhone</td>
                                                        <td><%=telephone%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">SSN</td>
                                                        <td><%=SSN%></td>
                                                    </tr>
                                                    <tr class="category">
                                                        <td colspan="3"><strong>Account Information</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Card Number</td>
                                                        <td><%=cardNumber%></td>
                                                    </tr>            
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Account Number</td>
                                                        <td><%=acctNum%></td>
                                                    </tr>   
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Account Creation Date</td>
                                                        <td><%=acctCreation%></td>
                                                    </tr>
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
