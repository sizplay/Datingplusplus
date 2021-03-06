
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

                // profile's information to be displayed
                int age = 0, datingAgeRangeStart = 0, datingAgeRangeEnd = 0, datingGeoRange = 0;
                String hobbies = "", gender = "", height = "", weight = "", haircolor = "", lastmoddate = "";
                String firstName = "", lastName = "", telephone = "", profileID = "";
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
                }
                session.setAttribute("first", firstName);

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

                <div class="container">
                    <div class="row">

                        <div class=" toppad">
                            <div class="panel panel-info">

                                <div class="panel-body">
                                    <div class="row">

                                        <div class=" col-md-9 col-lg-9 ">
                                            <form action="addCustomerRep.jsp" method="post">
                                                <div class="container-fluid">
                                                    <section class="container" >
                                                        <div class="container-page">				
                                                            <div class="col-md-6">
                                                                <h3 class="black">Personal Information</h3>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Username</label>
                                                                    <input type="text" name="Username" class="form-control" placeholder="Username" id="Username" value="">
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Password</label>
                                                                    <input type="text" name="PassWord" class="form-control" placeholder="PassWord" id="PassWord" value="">
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>First Name</label>
                                                                    <input type="text" name="First_name" class="form-control" placeholder="First Name" id="First_Name" value="">
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Last Name</label>
                                                                    <input type="text" name="Last_Name" class="form-control" placeholder="Last Name" id="Last_Name" value="">
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>Address</label>
                                                                    <input type="text" name="Address" class="form-control" placeholder="Address" id="Address" value="">
                                                                </div>
                                                                <div class="form-group col-lg-6">
                                                                    <label>City</label>
                                                                    <input type="text" name="City" class="form-control" placeholder="City" id="City" value="">
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="row">
                                                                        <div class="col-xs-4" style="margin-bottom:10px;">
                                                                            <label>States</label>
                                                                            <select class="required form-control" id="State" name="State">
                                                                                <option value="" selected="selected">Select a State</option>
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
                                                                        </div>
                                                                        <div class="form-group col-lg-3">
                                                                            <label>Zip Code</label>
                                                                            <input type="text" name="Zip_Code" class="form-control" placeholder="Zip Code" id="Zip_Code" value="">
                                                                        </div>
                                                                        <div class="form-group col-lg-5">
                                                                            <label>SSN</label>
                                                                            <input type="text" name="SSN" class="form-control" placeholder="No dashes and spaces" id="SSN" value="">
                                                                        </div>
                                                                        <div class="form-group col-lg-4">
                                                                            <label>Telephone</label>
                                                                            <input type="text" name="Telephone" class="form-control" placeholder="ex) 16313214321" id="Telephone" value="">
                                                                        </div>
                                                                        <div class="form-group col-lg-8">
                                                                            <label>Email Address</label>
                                                                            <input type="text" name="Email" class="form-control" placeholder="Email" id="Email" value="">
                                                                        </div>                                 
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-3" style="margin-bottom:10px;">
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
                                                                </div>
                                                                <div class="col-xs-3" style="margin-bottom:10px;">
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
                                                                </div>
                                                                <div class="col-xs-3" style="margin-bottom:10px;">
                                                                    <label>Datin Geo Range</label>
                                                                    <select class="required form-control" id="DatinGeoRange" name="DatinGeoRange">
                                                                        <option selected="selected" value="-1">ex) 5miles</option>
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
                                                                </div>

                                                                <div class="col-xs-3" style="margin-bottom:10px;">
                                                                    <br>
                                                                    <label>Age</label>
                                                                    <select class="required form-control" id="age" name="age">
                                                                        <option selected="selected" value="-1">Age</option>
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
                                                                </div>
                                                             
                                                                    <div class="col-xs-3" style="margin-bottom:10px;">

                                                                        <label>Height</label>
                                                                        <select class="required form-control" id="Height" name="Height">
                                                                            <option selected="selected" value="-1">ex) 5.7</option>
                                                                            <option value="3.0">3.0</option>
                                                                            <option value="3.1">3.1</option>
                                                                            <option value="3.2">3.2</option>
                                                                            <option value="3.3">3.3</option>
                                                                            <option value="3.4">3.4</option>
                                                                            <option value="3.5">3.5</option>
                                                                            <option value="3.6">3.6</option>
                                                                            <option value="3.7">3.7</option>
                                                                            <option value="3.8">3.8</option>
                                                                            <option value="3.9">3.9</option>
                                                                            <option value="4.0">4.0</option>
                                                                            <option value="4.1">4.1</option>
                                                                            <option value="4.2">4.2</option>
                                                                            <option value="4.3">4.3</option>
                                                                            <option value="4.4">4.4</option>
                                                                            <option value="4.5">4.5</option>
                                                                            <option value="4.6">4.6</option>
                                                                            <option value="4.7">4.7</option>
                                                                            <option value="4.8">4.8</option>
                                                                            <option value="4.9">4.9</option>
                                                                            <option value="5.0">5.0</option>
                                                                            <option value="5.1">5.1</option>
                                                                            <option value="5.2">5.2</option>
                                                                            <option value="5.3">5.3</option>
                                                                            <option value="5.4">5.4</option>
                                                                            <option value="5.5">5.5</option>
                                                                            <option value="5.6">5.6</option>
                                                                            <option value="5.7">5.7</option>
                                                                            <option value="5.8">5.8</option>
                                                                            <option value="5.9">5.9</option>
                                                                            <option value="6.0">6.0</option>
                                                                            <option value="6.1">6.1</option>
                                                                            <option value="6.2">6.2</option>
                                                                            <option value="6.3">6.3</option>
                                                                            <option value="6.4">6.4</option>
                                                                            <option value="6.5">6.5</option>
                                                                            <option value="6.6">6.6</option>
                                                                            <option value="6.7">6.7</option>
                                                                            <option value="6.8">6.8</option>
                                                                            <option value="6.9">6.9</option>
                                                                            <option value="7.0">7.0</option>
                                                                        </select>
                                                                    </div> 

                                                                    <div class="col-xs-3" style="margin-bottom:10px;">
                                                                        <label>Weight</label>
                                                                        <select class="required form-control" id="Weight" name="Weight">
                                                                            <option selected="selected" value="-1">ex) 110</option>
                                                                            <option value="70">70</option>
                                                                            <option value="80">80</option>
                                                                            <option value="90">90</option>
                                                                            <option value="100">100</option>
                                                                            <option value="110">110</option>
                                                                            <option value="120">120</option>
                                                                            <option value="130">130</option>
                                                                            <option value="140">140</option>
                                                                            <option value="150">150</option>
                                                                            <option value="160">160</option>
                                                                            <option value="170">170</option>
                                                                            <option value="180">180</option>
                                                                            <option value="190">190</option>
                                                                            <option value="200">200</option>                        
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-xs-3" style="margin-bottom:10px;">
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
                                                                    </div>
                                                                    <div class="col-xs-3" style="margin-bottom:10px;">
                                                                        <label>Sex</label>
                                                                        <select class="required form-control" id="sex" name="sex">
                                                                            <option selected="selected" value="-1">Sex</option>
                                                                            <option value="woman">Woman</option>
                                                                            <option value="man">Man</option>                         
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group col-lg-12">
                                                                        <label>Hobbies</label>
                                                                        <input type="text" name="Hobbies" class="form-control" placeholder="ex) shopping,reading books" id="Hobbies" value="">
                                                                    </div>	
                                                                    <div class="col-md-6">
                                                                        <button name="register" type="submit" class="btn btn-primary" >Register</button>
                                                                        <button name="cancel" type="submit" class="btn btn-primary" >Cancel</button>
                                                                    </div>

                                                              
                                                            </div>
                                                    </section>
                                                </div>
                                            </form>
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
