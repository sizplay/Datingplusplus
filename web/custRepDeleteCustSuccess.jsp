
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
                                    <a href="dates.jsp">Personalized date suggestion list</a>
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

        <div class="col-md-9">
            <%
                //String login = ((String) session.getAttribute("login"));
                //String password = ((String) session.getAttribute("password"));
                
                String custLogin = ((String) session.getAttribute("login"));
                String custPassword = ((String) session.getAttribute("password"));
                
                session.setAttribute("login", custLogin);
                session.setAttribute("password", custPassword);
            %>
        </div>

        <!-- Page Content -->
        <div class="container"> 

            <!-- Content Row -->
            <div class="row"> 
                <!-- Sidebar Column -->
                <div class="col-md-3">
                    <br>
                    <div class="list-group"> 
                        <a href="custRepAddCust.jsp" style="text-align:center" class="list-group-item">Add information for a customer</a> 
                        <a href="custRepEditCust1.jsp" style="text-align:center" class="list-group-item">Edit information for a customer</a>
                        <a href="custRepDeleteCust.jsp" style="text-align:center" class="list-group-item">Delete customer information</a> 
                        <a href="custRepMailList.jsp" style="text-align:center" class="list-group-item">Produce customer mailing lists</a>
                        <a href="custRepListProfile.jsp" style="text-align:center" class="list-group-item">Produce a list of profiles as date suggestions</a>
                        <a href="custRepRecoedDate.jsp" style="text-align:center" class="list-group-item">Record a date</a>
                    </div>
                </div>
               <!-- Content Column --> 
                <!-- PROFILE -->
                <form action="custRepEditCust2.jsp" method="post">
                <div class="container">
                    <div class="row">

                        <div class=" toppad">
                            <div class="panel panel-info">

                                <div class="panel-body">
                                    <div class="row">

                                        <div class="col-md-4 col-lg-4">
                                           
                                            <div>The account was successfully deleted!</div>
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              </form>
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
