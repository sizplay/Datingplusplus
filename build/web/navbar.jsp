<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<%
		String login = ((String) session.getAttribute("login"));
        String password = ((String) session.getAttribute("password"));
		String firstName = ((String)session.getAttribute("firstName"));
		String lastName = ((String)session.getAttribute("lastName"));
	%>
</head>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="adminPanel.jsp">Dating++</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=firstName%> <%=lastName%><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="index.html"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li id="dashboard" class="">
                        <a href="adminPanel.jsp"><i class="fa fa-fw fa-home"></i> Overview</a>
                    </li>
                    <li id="employees" class="" >
                        <a href="employees.jsp"><i class="fa fa-fw fa-male"></i> Employees</a>
                    </li>
                    <li id="customers" class="" >
                        <a href="customers.jsp"><i class="fa fa-fw fa-users"></i> Customers</a>
                    </li>
                    <li id="sales" class="" >
                        <a href="sales.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Revenue</a>
                    </li>
                    <li id="dates" class="">
                        <a href="viewDates.jsp"><i class="fa fa-fw fa-calendar-o"></i> Dates</a>
                    </li>
                    <li id="help" class="">
                        <a href="managerHelp.jsp"><i class="fa fa-fw fa-question"></i> Help</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
		
	<!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
   
	
    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
</html>	
	