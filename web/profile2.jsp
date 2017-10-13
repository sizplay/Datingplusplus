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
                List<String> results = new ArrayList<String>();

                // profile's information to be displayed
                int age = 0, datingAgeRangeStart = 0, datingAgeRangeEnd = 0, datingGeoRange = 0;
                String hobbies = "", gender = "", height = "", weight = "", haircolor = "", lastmoddate = "";
                String firstName = "", lastName = "", telephone = "", profileID = "";
                String street = "", city = "", state = "", zip = "", SSN = ""; // Store person's information to be displayed
                String profileID1 = "", result = "";

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

                    String queryProfileTableUsingSSN = "SELECT P.ProfileID,P.Age,P.DatingAgeRangeStart,P.DatingAgeRangeEnd,P.DatinGeoRange,P.M_F,P.Hobbies,P.Height,P.Weight,P.HairColor,P.LastModDate FROM Profile P WHERE P.OwnerSSN = '"
                            + SSN + "'";

                    java.sql.ResultSet rs2 = DBConnection.ExecQuery(queryProfileTableUsingSSN);

                    if (rs2 != null && rs2.next()) {
                        profileID = rs2.getString("ProfileID");
                        age = rs2.getInt("Age");
                        datingAgeRangeStart = rs2.getInt("DatingAgeRangeStart");
                        datingAgeRangeEnd = rs2.getInt("DatingAgeRangeEnd");
                        datingGeoRange = rs2.getInt("DatinGeoRange");
                        gender = rs2.getString("M_F");
                        hobbies = rs2.getString("Hobbies");
                        height = rs2.getString("Height");
                        weight = rs2.getString("Weight");
                        haircolor = rs2.getString("HairColor");
                        lastmoddate = rs2.getString("LastModDate");
                    }
                    
                    if(!(((String) session.getAttribute("loadProfile")).equals(null))){
						loadProfile = (String) session.getAttribute("loadProfile");
					
					queryProfileTableUsingSSN = "SELECT P.Age,P.DatingAgeRangeStart,P.DatingAgeRangeEnd,P.DatinGeoRange,P.M_F,P.Hobbies,P.Height,P.Weight,P.HairColor,P.LastModDate FROM Profile P WHERE P.OwnerSSN = '"
                            + SSN + "'" + "AND P.ProfileID = '"+loadProfile+"'";
					}
                    
                    String queryProfile = "SELECT P.ProfileID FROM Profile P WHERE P.OwnerSSN = '" + SSN + "'";
                    java.sql.ResultSet rs3 = DBConnection.ExecQuery(queryProfile);
                    while (rs3.next()) {
                        profileID1 = rs3.getString("ProfileID");
                        result = profileID1;
                        results.add(result);
                    }
                }
                
                
                session.setAttribute("first", firstName);
                String pic = "";
                if (profileID.equals("Brenna_Berlin")) {
                    pic = "http://www.downloadjpeg.com/wp-content/uploads/2014/08/facegen_women_celebrity_faces.jpg";
                } else if (profileID.equals("DesiraeBerg")) {
                    pic = "http://i2.cdn.turner.com/cnn/dam/assets/120509075523-chanel-brad-pitt-vertical-large-gallery.jpg";
                } else if (profileID.equals("Fletcher2013")) {
                    pic = "http://guardianlv.com/wp-content/uploads/2013/10/131.jpg";
                } else if (profileID.equals("Fletcher_Trujillo")) {
                    pic = "http://guardianlv.com/wp-content/uploads/2013/10/131.jpg";
                } else if (profileID.equals("Isabelle2013")) {
                    pic = "http://cfile1.uf.tistory.com/image/157F513A4F18C3C70B199D";
                } else if (profileID.equals("Isabelle2014")) {
                    pic = "http://cfile1.uf.tistory.com/image/157F513A4F18C3C70B199D";
                } else if (profileID.equals("VazquezFromAlajuela")) {
                    pic = "http://1.bp.blogspot.com/-f8NyG6eXER8/TtWX66khlTI/AAAAAAAAADc/B9dZobfpO0c/s1600/Will-Smith-pictures-desktop-Wallpapers-HD-photo-images-3.jpg";
                } else {
                    pic = "http://placehold.it/250x300";
                }
            %>
        </div>

        <!-- Page Content -->
        <div class="container"> 

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Hello <%=firstName%>!<button name="ChoiceProfileID" type="submit" style="position:absolute;right:20px;top:50px;" class="btn btn-primary" data-toggle="modal" data-target="#ChoiceProfileID" >Choose Profile ID</button></h1>   
                </div>
            </div>
            <!-- /.row --> 
            <form action="profile.jsp" method="post">
                <!-- LikeModal -->
                <div class="modal fade" id="loadProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">Like this Profile</h4>
                            </div>
                            <div class="modal-body">
                                <select class="required form-control" id="loadProfile" name="ChoiceProfileID1">
                                    <option selected="selected" value="-1"></option>

                                    <%
                                        Iterator i = results.iterator();
                                        while (i.hasNext()) {%>
                                    <option><%out.print(i.next());%></option>
                                    <%}%>

                                </select></div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Content Row -->
            <div class="row"> 
                <!-- Sidebar Column -->
                <div class="col-md-3">
                    <br>
                    <div  align="center"> <img alt="User Pic" src="<%=pic%>" width="250" height="300" class="img-related"> </div>	

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
                                                        <td colspan="3"><strong>Appearance</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Age</td>
                                                        <td><%=age%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Height</td>
                                                        <td><%=height%> inches</td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Weight</td>
                                                        <td><%=weight%> pounds</td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Hair Color</td>
                                                        <td><%=haircolor%></td>
                                                    </tr>
                                                    <tr class="category">
                                                        <td colspan="3"><strong>LifeStyle</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Hobbies</td>
                                                        <td><%=hobbies%></td>
                                                    </tr>  
                                                    <tr class="category">
                                                        <td colspan="3"><strong>General Information</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Gender</td>
                                                        <td><%=gender%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Dating Age Range</td>
                                                        <td><%=datingAgeRangeStart%> to <%=datingAgeRangeEnd%></td>
                                                    </tr>            
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Dating Geo Range</td>
                                                        <td><%=datingGeoRange%> miles</td>
                                                    </tr>   
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Last Activity</td>
                                                        <td><%=lastmoddate%></td>
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
