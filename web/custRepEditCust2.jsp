
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
                String url = "jdbc:mysql://db4free.net:3306/";
                String dbName = "datingplusplus";
                String driver = "com.mysql.jdbc.Driver";
                String dbUserName = "sizplay";
                String dbPassword = "milk8012";
                
                // customer rep info
                String login = ((String) session.getAttribute("login"));
                String password = ((String) session.getAttribute("password"));
                
                String profileID = request.getParameter("profileID");
                // profile's information to be displayed
                int age = 0, datingAgeRangeStart = 0, datingAgeRangeEnd = 0, datingGeoRange = 0;
                String hobbies = "", gender = "", height = "", weight = "", haircolor = "", lastmoddate = "";
                String firstName = "", lastName = "", telephone = "";
                String street = "", city = "", state = "", zip = "", SSN = ""; // Store person's information to be displayed
                        
                         Connection conn = null;
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url + dbName, dbUserName,
                        dbPassword);

                String queryProfileTableWithProfileID = "SELECT * FROM Profile WHERE ProfileID = ?";
                PreparedStatement stm = conn.prepareStatement(queryProfileTableWithProfileID);
                stm.setString(1, profileID);
                ResultSet rs1 = stm.executeQuery();

                if (rs1.next()) {
                    SSN = rs1.getString("OwnerSSN");
                        age = rs1.getInt("Age");
                        datingAgeRangeStart = rs1.getInt("DatingAgeRangeStart");
                        datingAgeRangeEnd = rs1.getInt("DatingAgeRangeEnd");
                        datingGeoRange = rs1.getInt("DatinGeoRange");
                        gender = rs1.getString("M_F");
                        hobbies = rs1.getString("Hobbies");
                        height = rs1.getString("Height");
                        weight = rs1.getString("Weight");
                        haircolor = rs1.getString("HairColor");
                        lastmoddate = rs1.getString("LastModDate");
                        
                    String queryPersonTableWithProfileID = "SELECT * FROM Person WHERE SSN = ?";
                    stm = conn.prepareStatement(queryPersonTableWithProfileID);
                    stm.setString(1, SSN);
                    ResultSet rs2 = stm.executeQuery();
                    
                    if (rs2 != null && rs2.next()) {
                    SSN = rs2.getString("SSN");
                    firstName = rs2.getString("firstName");
                    lastName = rs2.getString("lastName");
                    street = rs2.getString("Street");
                    city = rs2.getString("City");
                    state = rs2.getString("State");
                    zip = rs2.getString("Zipcode");
                    telephone = rs2.getString("Telephone");
                    }
                }
                
                // customer representative info
                session.setAttribute("custReplogin", login);
                session.setAttribute("custRepPassword", password);
                // profile info
                session.setAttribute("customerProfile", profileID);
                session.setAttribute("customerSSN", SSN);
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
                <form action="custRepEditDatabase.jsp" method="post">
                    <div class="container">
                        <div class="row">

                            <div class=" toppad">
                                <div class="panel panel-info">

                                    <div class="panel-body">
                                        <div class="row">

                                            <div class="col-md-4 col-lg-4">
                                                <table class="table table-user-information">
                                                    <tbody>
                                                        <tr>
                                                            <td><strong>User Name </strong> <%=firstName%> <%=lastName%></td>
                                                        </tr>
                                                        <tr>
                                                            <td name="profileID"><strong>Profile ID </strong> <%=profileID%></td>
                                                        </tr>
                                                        <tr>
                                                            <td><strong>Password</strong> <input type="text" name="PassWord" class="form-control" id="PassWord" value="<%=password%>">
                                                                <strong><br>Address</strong> <input type="text" name="Address" class="form-control" id="Address" value="<%=street%>">
                                                                <strong><br>City</strong> <input type="text" name="City" class="form-control" id="City" value="<%=city%>"> 
                                                                <strong><br>State</strong> <select class="required form-control" id="State" name="State">
                                                                    <option value="" selected="selected"><%=state%></option>
                                                                    <option value="AL">Alabama</option>
                                                                    <option value="AK">Alaska</option>
                                                                    <option value="AZ">Arizona</option>
                                                                    <option value="AR">Arkansas</option>
                                                                    <option value="CA">California</option>
                                                                    <option value="CO">Colorado</option>
                                                                    <option value="CT">Connecticut</option>
                                                                    <option value="DE">Delaware</option>
                                                                    <option value="DC">District Of Columbia</option>
                                                                    <option value="FL">Florida</option>
                                                                    <option value="GA">Georgia</option>
                                                                    <option value="HI">Hawaii</option>
                                                                    <option value="ID">Idaho</option>
                                                                    <option value="IL">Illinois</option>
                                                                    <option value="IN">Indiana</option>
                                                                    <option value="IA">Iowa</option>
                                                                    <option value="KS">Kansas</option>
                                                                    <option value="KY">Kentucky</option>
                                                                    <option value="LA">Louisiana</option>
                                                                    <option value="ME">Maine</option>
                                                                    <option value="MD">Maryland</option>
                                                                    <option value="MA">Massachusetts</option>
                                                                    <option value="MI">Michigan</option>
                                                                    <option value="MN">Minnesota</option>
                                                                    <option value="MS">Mississippi</option>
                                                                    <option value="MO">Missouri</option>
                                                                    <option value="MT">Montana</option>
                                                                    <option value="NE">Nebraska</option>
                                                                    <option value="NV">Nevada</option>
                                                                    <option value="NH">New Hampshire</option>
                                                                    <option value="NJ">New Jersey</option>
                                                                    <option value="NM">New Mexico</option>
                                                                    <option value="NY">New York</option>
                                                                    <option value="NC">North Carolina</option>
                                                                    <option value="ND">North Dakota</option>
                                                                    <option value="OH">Ohio</option>
                                                                    <option value="OK">Oklahoma</option>
                                                                    <option value="OR">Oregon</option>
                                                                    <option value="PA">Pennsylvania</option>
                                                                    <option value="RI">Rhode Island</option>
                                                                    <option value="SC">South Carolina</option>
                                                                    <option value="SD">South Dakota</option>
                                                                    <option value="TN">Tennessee</option>
                                                                    <option value="TX">Texas</option>
                                                                    <option value="UT">Utah</option>
                                                                    <option value="VT">Vermont</option>
                                                                    <option value="VA">Virginia</option>
                                                                    <option value="WA">Washington</option>
                                                                    <option value="WV">West Virginia</option>
                                                                    <option value="WI">Wisconsin</option>
                                                                    <option value="WY">Wyoming</option>
                                                                </select>
                                                                <strong><br>Zip Code</strong> <input type="text" name="Zip_Code" class="form-control" id="Zip_Code" value="<%=zip%>"> 
                                                                <strong><br>TelePhone</strong> <input type="text" name="Telephone" class="form-control" id="Telephone" value="<%=telephone%>">
                                                            </td>
                                                        </tr>                            
                                                    </tbody>                     
                                                </table>
                                            </div>
                                            <div class="col-md-4 col-lg-4">
                                                <table class="table table-user-information">
                                                    <tbody>
                                                        <tr><td><strong>Age </strong> <%=age%></td></tr>
                                                        <tr><td name="SSN"><strong>SSN </strong> <%=SSN%> </td></tr>
                                                        <tr>
                                                            <td>
                                                                <strong>DatingAgeRangeStart</strong>  <select class="required form-control" id="DatingAgeRangeStart" name="DatingAgeRangeStart">
                                                                    <option selected="selected" value="-1"><%=datingAgeRangeStart%></option>
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
                                                                    <option value="32">32</option>
                                                                    <option value="33">33</option>
                                                                    <option value="34">34</option>
                                                                    <option value="35">35</option>
                                                                    <option value="36">36</option>
                                                                    <option value="37">37</option>
                                                                    <option value="38">38</option>
                                                                    <option value="39">39</option>
                                                                    <option value="40">40</option>
                                                                    <option value="41">41</option>
                                                                    <option value="42">42</option>
                                                                    <option value="43">43</option>
                                                                    <option value="44">44</option>
                                                                    <option value="45">45</option>
                                                                    <option value="46">46</option>
                                                                    <option value="47">47</option>
                                                                    <option value="48">48</option>
                                                                    <option value="49">49</option>
                                                                    <option value="50">50</option>
                                                                    <option value="51">51</option>
                                                                    <option value="52">52</option>
                                                                    <option value="53">53</option>
                                                                    <option value="54">54</option>
                                                                    <option value="55">55</option>
                                                                    <option value="56">56</option>
                                                                    <option value="57">57</option>
                                                                    <option value="58">58</option>
                                                                    <option value="59">59</option>
                                                                    <option value="60">60</option>
                                                                    <option value="61">61</option>
                                                                    <option value="62">62</option>
                                                                    <option value="63">63</option>
                                                                    <option value="64">64</option>
                                                                    <option value="65">65</option>
                                                                    <option value="66">66</option>
                                                                    <option value="67">67</option>
                                                                    <option value="68">68</option>
                                                                    <option value="69">69</option>
                                                                    <option value="70">70</option>
                                                                    <option value="71">71</option>
                                                                    <option value="72">72</option>
                                                                    <option value="73">73</option>
                                                                    <option value="74">74</option>
                                                                    <option value="75">75</option>
                                                                    <option value="76">76</option>
                                                                    <option value="77">77</option>
                                                                    <option value="78">78</option>
                                                                    <option value="79">79</option>
                                                                    <option value="80">80</option>
                                                                    <option value="81">81</option>
                                                                    <option value="82">82</option>
                                                                    <option value="83">83</option>
                                                                    <option value="84">84</option>
                                                                    <option value="85">85</option>
                                                                    <option value="86">86</option>
                                                                    <option value="87">87</option>
                                                                    <option value="88">88</option>
                                                                    <option value="89">89</option>
                                                                    <option value="90">90</option>
                                                                    <option value="91">91</option>
                                                                    <option value="92">92</option>
                                                                    <option value="93">93</option>
                                                                    <option value="94">94</option>
                                                                    <option value="95">95</option>
                                                                    <option value="96">96</option>
                                                                    <option value="97">97</option>
                                                                    <option value="98">98</option>
                                                                    <option value="99">99</option>                        
                                                                </select>
                                                                <strong><br>DatingAgeRangeEnd</strong> <select class="required form-control" id="DatingAgeRangeEnd" name="DatingAgeRangeEnd">
                                                                    <option selected="selected" value="-1"><%=datingAgeRangeEnd%></option>
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
                                                                    <option value="32">32</option>
                                                                    <option value="33">33</option>
                                                                    <option value="34">34</option>
                                                                    <option value="35">35</option>
                                                                    <option value="36">36</option>
                                                                    <option value="37">37</option>
                                                                    <option value="38">38</option>
                                                                    <option value="39">39</option>
                                                                    <option value="40">40</option>
                                                                    <option value="41">41</option>
                                                                    <option value="42">42</option>
                                                                    <option value="43">43</option>
                                                                    <option value="44">44</option>
                                                                    <option value="45">45</option>
                                                                    <option value="46">46</option>
                                                                    <option value="47">47</option>
                                                                    <option value="48">48</option>
                                                                    <option value="49">49</option>
                                                                    <option value="50">50</option>
                                                                    <option value="51">51</option>
                                                                    <option value="52">52</option>
                                                                    <option value="53">53</option>
                                                                    <option value="54">54</option>
                                                                    <option value="55">55</option>
                                                                    <option value="56">56</option>
                                                                    <option value="57">57</option>
                                                                    <option value="58">58</option>
                                                                    <option value="59">59</option>
                                                                    <option value="60">60</option>
                                                                    <option value="61">61</option>
                                                                    <option value="62">62</option>
                                                                    <option value="63">63</option>
                                                                    <option value="64">64</option>
                                                                    <option value="65">65</option>
                                                                    <option value="66">66</option>
                                                                    <option value="67">67</option>
                                                                    <option value="68">68</option>
                                                                    <option value="69">69</option>
                                                                    <option value="70">70</option>
                                                                    <option value="71">71</option>
                                                                    <option value="72">72</option>
                                                                    <option value="73">73</option>
                                                                    <option value="74">74</option>
                                                                    <option value="75">75</option>
                                                                    <option value="76">76</option>
                                                                    <option value="77">77</option>
                                                                    <option value="78">78</option>
                                                                    <option value="79">79</option>
                                                                    <option value="80">80</option>
                                                                    <option value="81">81</option>
                                                                    <option value="82">82</option>
                                                                    <option value="83">83</option>
                                                                    <option value="84">84</option>
                                                                    <option value="85">85</option>
                                                                    <option value="86">86</option>
                                                                    <option value="87">87</option>
                                                                    <option value="88">88</option>
                                                                    <option value="89">89</option>
                                                                    <option value="90">90</option>
                                                                    <option value="91">91</option>
                                                                    <option value="92">92</option>
                                                                    <option value="93">93</option>
                                                                    <option value="94">94</option>
                                                                    <option value="95">95</option>
                                                                    <option value="96">96</option>
                                                                    <option value="97">97</option>
                                                                    <option value="98">98</option>
                                                                    <option value="99">99</option>                        
                                                                </select>
                                                                <strong><br>DatingGeoRange</strong>  <select class="required form-control" id="DatinGeoRange" name="DatinGeoRange">
                                                                    <option selected="selected" value="-1"><%=datingGeoRange%></option>
                                                                    <option value="10">10</option>
                                                                    <option value="20">20</option>
                                                                    <option value="30">30</option>
                                                                    <option value="40">40</option>
                                                                    <option value="50">50</option>
                                                                    <option value="60">60</option>
                                                                    <option value="70">70</option>
                                                                    <option value="80">80</option>
                                                                    <option value="90">90</option>
                                                                    <option value="100">100</option>                        
                                                                </select>

                                                                <strong><br>Hair Color</strong> <select class="required form-control" id="HairColor" name="HairColor">
                                                                    <option selected="selected" value="-1"><%=haircolor%></option>
                                                                    <option>Brown</option>
                                                                    <option>Black</option>
                                                                    <option>White</option>
                                                                    <option>Sandy</option>
                                                                    <option>Gray or Partially Gray</option>
                                                                    <option>Red/Auburn</option>
                                                                    <option>Blond/Strawberry</option>
                                                                    <option>Blue</option>
                                                                    <option>Green</option>
                                                                    <option>Orange</option>
                                                                    <option>Pink</option>
                                                                    <option>Purple</option>
                                                                    <option>Partly or Completely Bald</option>
                                                                    <option>Other</option>
                                                                </select>          
                                                                <strong><br>Hobbies</strong> <input type="text" name="Hobbies" class="form-control" id="Hobbies" value="<%=hobbies%>">
                                                                <br>
                                                                <form action="demo_form.asp">
                                                                    <input type="file" name="pic" accept="image/*">
                                                                    <input type="submit">
                                                                </form>
                                                                <br>
                                                                <button name="register" type="submit" class="btn btn-primary" >Submit</button>
                                                            </td>
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
