
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

        <!-- Page Content -->

        <div class="container">

            <!-- Page Heading/Breadcrumbs -->   
            <form action="filtering search.jsp" method="post">     
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Browse
                            <small>Subheading</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="profile.jsp">Home Profile</a>
                            </li>
                            <li class="active">Browse</li>
                        </ol>

                        <div class="col-md-4 col-lg-12">          
                            <%
/*  <%
                                String login = ((String) session.getAttribute("login"));
                                int datingAgeRangeStart = 0, datingAgeRangeEnd = 0;
                                int heightStart = 0, heightEnd = 0, weightStart = 0, weightEnd = 0, height = 0, weight = 0;
                                String hairColor = "";
                                String SSN = "", profileID = ""; // Store person's information to be displayed
                                String weightS = "", heightS = "", weightS1 = "", weightS2 = "", heightS1 = "", heightS2 = "";
                                String rs3HairColor = "";
                                String queryPersonTable = "SELECT P.SSN,P.FirstName FROM Person P WHERE P.Email = '"
                                        + login + "'";
                                java.sql.ResultSet rs1 = DBConnection.ExecQuery(queryPersonTable);

                                if (rs1 != null && rs1.next()) {
                                    SSN = rs1.getString("SSN");

                                    String queryProfileTableUsingSSN = "SELECT * FROM Profile P WHERE P.OwnerSSN = '"
                                            + SSN + "'";
                                    java.sql.ResultSet rs2 = DBConnection.ExecQuery(queryProfileTableUsingSSN);
                                    if (rs2 != null && rs2.next()) {
                                        profileID = rs2.getString("ProfileID");
                                        datingAgeRangeStart = rs2.getInt("DatingAgeRangeStart");
                                        datingAgeRangeEnd = rs2.getInt("DatingAgeRangeEnd");
                                        weight = rs2.getInt("Weight");
                                        height = rs2.getInt("Height");
                                        weightS = String.valueOf(weight);
                                        weightS1 = weightS.substring(0, 2);
                                        weightS2 = weightS.substring(2, 4);
                                        heightS1 = heightS.substring(0);
                                        heightS2 = heightS.substring(1);
                                        weightStart = Integer.parseInt(weightS1);
                                        weightEnd = Integer.parseInt(weightS2);
                                        heightStart = Integer.parseInt(heightS1);
                                        heightEnd = Integer.parseInt(heightS2);
                                        hairColor = rs2.getString("HairColor");

                                        /* SELECT P.HairColor,P.Weight, P.Height, P.DatingAgeRangeStart, P.DatingAgeRangeEnd 
                                         FROM Profile P
                                         WHERE P.HairColor = 'Blonde' AND (P.DatingAgeRangeStart >= '18' AND P.DatingAgeRangeEnd <= '25') 
                                         AND (P.Weight >= '30' AND P.Weight <= '200') AND (P.Height >= '3.0' AND P.Height <= '7.0') AND P.ProfileID <> 'Isabelle2013;'
                                        String querySearch = "SELECT P.HairColor,P.Weight, P.Height, P.DatingAgeRangeStart, P.DatingAgeRangeEnd "
                                                + "FROM Profile P WHERE P.HairColor = '" + hairColor + "' AND (P.DatingAgeRangeStart >= '" + datingAgeRangeStart + "'"
                                                + "AND P.DatingAgeRangeEnd <= '" + datingAgeRangeEnd + "') AND (P.Weight >= '" + weightStart + "' AND P.Weight <= '" + weightEnd + "') AND "
                                                + "(P.Height >= '" + heightStart + "' AND P.Height <= '" + heightEnd + "') AND P.ProfileID <> '" + profileID + "'";

                                        java.sql.ResultSet rs3 = DBConnection.ExecQuery(querySearch);
                                        if (rs3 != null && rs3.next()) {
                                            
                                        }
                                    }
                           //% >
                            <ol class="breadcrumb">    
                                <li>
                                    <label>Hair Color</label>
                                    <select class="required form-control" id="HairColor" name="HairColor">
                                        <option selected="selected" value="-1">Blonde</option>
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
                                </li>
                                <li>
                                    <label>Weight</label>
                                    <select class="required form-control" id="Weight" name="Weight">
                                        <option selected="selected" value="-1">ex) 110 ~ 130</option>
                                        <option value="07090">70 ~ 90</option>
                                        <option value="090110">90 ~ 110</option>
                                        <option value="110130">110 ~ 130</option>
                                        <option value="130150">130 ~ 150</option>
                                        <option value="150170">150 ~ 170</option>
                                        <option value="170190">170 ~ 190</option>
                                        <option value="190210">190 ~ 210</option>
                                    </select>
                                </li>
                                <li>
                                    <label>Height</label>
                                    <select class="required form-control" id="Height" name="Height">
                                        <option selected="selected" value="-1">ex)4 ~ 5</option>
                                        <option value="34">3 ~ 4</option>
                                        <option value="45">4 ~ 5</option>
                                        <option value="56">5 ~ 6</option>
                                        <option value="67">6 ~ 7</option>
                                        <option value="78">7 ~ 8</option>
                                    </select>
                                </li>*/ %>
                            <ol class="breadcrumb">    
                                <li>
                                    <label>Hair Color</label>
                                    <select class="required form-control" id="HairColor" name="HairColor">
                                        <option selected="selected" value="-1">Blonde</option>
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
                                </li>
                                <li>
                                    <label>Weight</label>
                                    <select class="required form-control" id="Weight" name="Weight">
                                        <option selected="selected" value="-1">ex) 110</option>
                                        <option value="07090">70 ~ 90</option>
                                        <option value="090110">90 ~ 110</option>
                                        <option value="110130">110 ~ 130</option>
                                        <option value="130150">130 ~ 150</option>
                                        <option value="150170">150 ~ 170</option>
                                        <option value="170190">170 ~ 190</option>
                                        <option value="190210">190 ~ 210</option>
                                    </select>
                                </li>
                                <li>
                                    <label>Height</label>
                                    <select class="required form-control" id="Height" name="Height">
                                        <option selected="selected" value="-1">ex) 5.7</option>
                                        <option value="3.03.5">3.0 ~ 3.5</option>
                                        <option value="3.14.0">3.5 ~ 4.0</option>
                                        <option value="4.04.5">4.0 ~ 4.5</option>
                                        <option value="4.55.0">4.5 ~ 5.0</option>
                                        <option value="5.05.5">5.0 ~ 5.5</option>
                                        <option value="5.56.0">5.5 ~ 6.0</option>
                                        <option value="6.06.5">6.0 ~ 6.5</option>
                                        <option value="6.57.0">6.5 ~ 7.0</option>
                                    </select>
                                </li>
                                <li>
                                    <label>Dating Age Range Start</label>
                                    <select class="required form-control" id="DatingAgeRangeStart" name="DatingAgeRangeStart">
                                        <option selected="selected" value="-1">ex) 20</option>
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
                                </li>
                                <li>
                                    <label>Dating Age Range End</label>
                                    <select class="required form-control" id="DatingAgeRangeEnd" name="DatingAgeRangeEnd">
                                        <option selected="selected" value="-1">ex) 25</option>
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
                                </li>
                                <li>
                                    <button name="search" type="submit" class="btn btn-primary" >Search</button>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row">
                <%
                    String login = ((String) session.getAttribute("login"));
                    String password = ((String) session.getAttribute("password"));

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
                    String queryPersonTable = "SELECT Table2.SSN, Table2.FirstName, Table2.LastName, Table2.City, Table2.State, Table2.ProfileID FROM( SELECT * FROM (SELECT DISTINCT Person.SSN, Person.FirstName, Person.LastName, Person.City, Person.State FROM Person INNER JOIN Profile ON Profile.OwnerSSN=Person.SSN) as Table1 RIGHT JOIN Profile ON Profile.OwnerSSN=Table1.SSN) as Table2";

                    java.sql.ResultSet rs = DBConnection.ExecQuery(queryPersonTable);
                    double wow = .1;
                    while (rs.next()) {
                %>
                <div id="ProfileBox" class="col-md-3 text-center wow fadeInUpBig" data-wow-delay="<%=wow%><%wow = wow + .1;%>s">
                    <div class="thumbnail">
                        <a href="viewProfile.jsp?ID=<%=rs.getString(6)%>"><img id="pimage" class="img-responsive" src="http://placehold.it/250x300" alt=""></a>
                        <div class="caption">
                            <h4> <% out.print(rs.getString(6));%><br>
                            </h4>
                            <a href="viewProfile.jsp?ID=<%=rs.getString(6)%>"><p><% out.print(rs.getString(2));%> <% out.print(rs.getString(3)); %></p></a>
                            <p><% out.print(rs.getString(4)); %>, <% out.print(rs.getString(5)); %></p>
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
