
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                String ID = request.getParameter("ID");

                String SSN = "", profileID = ""; // Store person's information to be displayed

                /*
                 SELECT *
                 FROM
                 Person
                 RIGHT JOIN Profile
                 ON Profile.OwnerSSN=Person.SSN
                 WHERE Profile.ProfileID='Brenna_Berlin';
                 */
                String queryProfileTable = "SELECT * FROM Person RIGHT JOIN Profile ON Profile.OwnerSSN=Person.SSN WHERE Profile.ProfileID = '" + ID + "'";
                java.sql.ResultSet rs1 = DBConnection.ExecQuery(queryProfileTable);
                if (rs1 != null && rs1.next()) {
                    String queryPersonTable = "SELECT P.SSN FROM Person P WHERE P.Email = '"
                            + login + "'";

                    java.sql.ResultSet rs0 = DBConnection.ExecQuery(queryPersonTable);
                    if (rs0 != null && rs0.next()) {
                        SSN = rs0.getString("SSN");
                        String queryProfileTableUsingSSN = "SELECT P.ProfileID FROM Profile P WHERE P.OwnerSSN = '"
                                + SSN + "'";
                        java.sql.ResultSet rs2 = DBConnection.ExecQuery(queryProfileTableUsingSSN);

                        if (rs2 != null && rs2.next()) {
                            profileID = rs2.getString("ProfileID");

                        }
                    }
                }

                String pic = "";
                if (ID.equals("Brenna_Berlin")) {
                    pic = "http://www.downloadjpeg.com/wp-content/uploads/2014/08/facegen_women_celebrity_faces.jpg";
                } else if (ID.equals("DesiraeBerg")) {
                    pic = "http://i2.cdn.turner.com/cnn/dam/assets/120509075523-chanel-brad-pitt-vertical-large-gallery.jpg";
                } else if (ID.equals("Fletcher2013")) {
                    pic = "http://guardianlv.com/wp-content/uploads/2013/10/131.jpg";
                } else if (ID.equals("Fletcher_Trujillo")) {
                    pic = "http://guardianlv.com/wp-content/uploads/2013/10/131.jpg";
                } else if (ID.equals("Isabelle2013")) {
                    pic = "http://cfile1.uf.tistory.com/image/157F513A4F18C3C70B199D";
                } else if (ID.equals("Isabelle2014")) {
                    pic = "http://cfile1.uf.tistory.com/image/157F513A4F18C3C70B199D";
                } else if (ID.equals("VazquezFromAlajuela")) {
                    pic = "http://1.bp.blogspot.com/-f8NyG6eXER8/TtWX66khlTI/AAAAAAAAADc/B9dZobfpO0c/s1600/Will-Smith-pictures-desktop-Wallpapers-HD-photo-images-3.jpg";
                } else {
                    pic = "http://placehold.it/250x300";
                }

                String url = "jdbc:mysql://db4free.net:3306/";
                String dbName = "datingplusplus";
                String driver = "com.mysql.jdbc.Driver";
                String dbUserName = "sizplay";
                String dbPassword = "milk8012";
                
                Connection conn = null;
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url + dbName, dbUserName,
                        dbPassword);

                List<String> results = new ArrayList<String>();

                String queryProfileTableUsingSSN = "SELECT * FROM Profile P WHERE OwnerSSN <> ?";
                PreparedStatement stm = conn.prepareStatement(queryProfileTableUsingSSN);
                stm.setString(1, SSN);
                ResultSet rs2 = stm.executeQuery();
                while (rs2.next()) {
                    results.add(rs2.getString("ProfileID"));
                }

                //if(rs1 != null){
                //age = rs1.getInt("Age");}
                session.setAttribute("profileID", profileID);
                session.setAttribute("ID", ID);

            %>
        </div>

        <!-- Page Content -->
        <div class="container"> 

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><%=ID%> <button name="likes" type="submit" style="position:absolute;right:20px;top:50px;" class="btn btn-primary" data-toggle="modal" data-target="#likeModal" >Like this Profile</button></h1>                       
                </div>
            </div>
            <!-- /.row --> 
            <form action="likeButton.jsp" method="post">
                <!-- LikeModal -->
                <div class="modal fade" id="likeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">Like this Profile</h4>
                            </div>
                            <div class="modal-body"> Would you like this profile?</div>
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
                    <div  align="center"> <img alt="User Pic" src=<%=pic%> width="250" height="300" class="img-related"> </div>	

                    <br>
                    <div class="list-group"> <a href="profile.jsp" style="text-align:center" class="list-group-item">MyProfile</a> 
                        <button type="button" class="list-group-item" style="height:40px; width:262px" data-toggle="modal" data-target="#dateModal">Make a Date</button> 
                        <button type="button" class="list-group-item" style="height:40px; width:262px" data-toggle="modal" data-target="#GeoModal">Make a Geo Date</button> 
                        <button type="button" class="list-group-item" style="height:40px; width:262px" data-toggle="modal" data-target="#ReferModal">Refer a Profile</button> 
                    </div>
                </div>

                <!-- Content Column --> 
                <!-- DateModal -->
                <form action="makeADate.jsp" method="post">
                    <div class="modal fade" id="dateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Make a date</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="col-lg-3">
                                        <select class="required form-control" id="yearModal" name="yearModal">
                                            <option selected="selected" value="-1">Year</option>                                      
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                        </select>

                                        <select class="required form-control" id="monthModal" name="monthModal">
                                            <option selected="selected" value="-1">Month</option>
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="03">3</option>
                                            <option value="04">4</option>
                                            <option value="05">5</option>
                                            <option value="06">6</option>
                                            <option value="07">7</option>
                                            <option value="08">8</option>
                                            <option value="09">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>

                                        <select class="required form-control" id="dayModal" name="dayModal">
                                            <option selected="selected" value="-1">Day</option>
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="03">3</option>
                                            <option value="04">4</option>
                                            <option value="05">5</option>
                                            <option value="06">6</option>
                                            <option value="07">7</option>
                                            <option value="08">8</option>
                                            <option value="09">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                            <option value="13">13</option>
                                            <option value="14">14</option>
                                            <option value="15">15</option>
                                            <option value="16">16</option>
                                            <option value="17">17</option>
                                            <option value="18">18</option>
                                            <option value="19">19</option>
                                            <option value="20">20</option>
                                            <option value="21">21</option>
                                            <option value="22">22</option>
                                            <option value="23">23</option>
                                            <option value="24">24</option>
                                            <option value="25">25</option>
                                            <option value="26">26</option>
                                            <option value="27">27</option>
                                            <option value="28">28</option>
                                            <option value="29">29</option>
                                            <option value="30">30</option>
                                            <option value="31">31</option>
                                        </select>       
                                        <select class="required form-control" id="custRepModal" name="custRepModal">
                                            <option selected="selected" value="-1">Choose a customer representative</option>                    
                                            <option value="222-22-2222">Bo Osborne</option>
                                            <option value="333-33-3333">Hashim Ross</option>
                                            <option value="444-44-4444">Shaine Terrell</option>
                                        </select>
                                        <input name="dateLocation" id="dateLocation" type="text" class="form-control" placeholder="ex) The mall">

                                    </div>

                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                                
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- GeoDateModal -->
                <div class="modal fade" id="GeoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">Make a Geo date</h4>
                            </div>
                            <div class="modal-body">
                                <select class="required form-control" id="GeoModal" name="MakeaGeoDate">
                                    <option selected="selected" value="-1"></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>                        
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">Submit</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                         
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ReferModal -->
                <form action="userReferAProfile.jsp" method="post">
                    <div class="modal fade" id="ReferModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Refer a Profile</h4>
                                </div>
                                <div class="modal-body">
                                    <select class="required form-control" id="userIDs" name="userIDs">
                                        <option name="userIDs" selected="selected" value="1"></option>
                                        <%
                                            Iterator i = results.iterator();
                                            while (i.hasNext()) {%>
                                        <option><%out.print(i.next());%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                         
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

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
                                                        <td><%out.print(rs1.getInt("Age"));%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Height</td>
                                                        <td><%out.print(rs1.getInt("Height"));%> inches</td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Weight</td>
                                                        <td><%out.print(rs1.getInt("Weight"));%> pounds</td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Hair Color</td>
                                                        <td><%out.print(rs1.getString("HairColor"));%></td>
                                                    </tr>
                                                    <tr class="category">
                                                        <td colspan="3"><strong>LifeStyle</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Hobbies</td>
                                                        <td><%out.print(rs1.getString("Hobbies"));%></td>
                                                    </tr>  
                                                    <tr class="category">
                                                        <td colspan="3"><strong>General Information</strong></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Gender</td>
                                                        <td><%out.print(rs1.getString("M_F"));%></td>
                                                    </tr>
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Dating Age Range</td>
                                                            <td><%out.print(rs1
                                                                        .getInt("datingAgeRangeStart"));%> to <%out.print(rs1.getInt("datingAgeRangeEnd"));%></td>
                                                    </tr>            
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Dating Geo Range</td>
                                                        <td><%out.print(rs1.getInt("datinGeoRange"));%> miles</td>
                                                    </tr>   
                                                    <tr>                      
                                                        <td class="trait" rowspan="1">Last Activity</td>
                                                        <td><%out.print(rs1.getString("LastModDate"));%></td>
                                                    </tr>
                                                    <tr class="category">
                                                        <td colspan="3"><strong>Comment on a date</strong>
                                                            <input type="text" name="comment" class="form-control" id="Comment" value="">
                                                            <button name="commentButton" type="submit" class="btn btn-primary" style="position:absolute;right:20px;top:510px;">Submit</button></td>
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
