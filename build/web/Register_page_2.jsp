
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<!DOCTYPE html>
<%
    String firstName = request.getParameter("First_name");
    String lastName = request.getParameter("Last_Name");
    String address = request.getParameter("Address");
    String city = request.getParameter("City");
    String state = request.getParameter("State");
    String zipcode = request.getParameter("Zip_Code");
    String SSN = request.getParameter("SSN");
    String telephone = request.getParameter("Telephone");
    String email = request.getParameter("Email");

    session.setAttribute("fName", firstName);
    session.setAttribute("lName", lastName);
    session.setAttribute("addr", address);
    session.setAttribute("city", city);
    session.setAttribute("state", state);
    session.setAttribute("zipcode", zipcode);
    session.setAttribute("SSN", SSN);
    session.setAttribute("telephone", telephone);
    session.setAttribute("email", email);

%>
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
     <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" >Dating++</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
              <!--log in-->
            <form class="navbar-form navbar-left" role="search" action="login.jsp" method="post">
        <div class="form-group">
          <input name="username" id="username" type="text" class="form-control" placeholder="Username">
        </div>
           <div class="form-group">
          <input name="userpasswd" id="userpasswd" type="text" class="form-control" placeholder="Password">
        </div>
        <button type="submit" class="btn btn-default">Log In</button>
      </form>
            
            
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="Registration_part2.html">Register</a>
                    </li>
                    <li>
                        <a href="#">Need Help?<b class="caret"></b></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

        <form onSubmit="checkButton()" action="http://localhost:8080/DatingPlusPlus.05/checkRegistration" method="post">
            <div class="container-fluid">
                <section class="container">
                    <div class="container-page">				
                        <div class="col-md-6">
                            <h3 class="black">Registration</h3>

                            <div class="form-group col-lg-12">
                                <label>Username</label>
                                <input type="text" name="Username" class="form-control" placeholder="Username" id="Username" value="">
                            </div>

                            <div class="form-group col-lg-6">
                                <label>Password</label>
                                <input type="text" name="PassWord" class="form-control" placeholder="PassWord" id="PassWord" value="">
                            </div>

                            <div class="form-group col-lg-6">
                                <label>Repeat Password</label>
                                <input type="text" name="PassWord" class="form-control" placeholder="PassWord" id="PassWord" value="">
                            </div>

                            <div class="form-group col-lg-6">
                                <label>Email Address</label>
                                <input type="text" name="Email_Address" class="form-control" placeholder="Email Address" id="Email_Address" value="">
                            </div>

                            <div class="form-group col-lg-6">
                                <label>Repeat Email Address</label>
                                <input type="text" name="Email_Address" class="form-control" placeholder="Email Address" id="Email_Address" value="">
                            </div>			



                        </div>

                        <div class="col-md-6">
                            <h3 class="black">Personal Information</h3>

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
                        </div>
                        <div class="col-md-6">
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

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>
    
  <!--
    <script type="text/javascript">
            var clicked = "none";
            function checkButton() {
                if (!clicked.equals('none')) {
                    if (clicked.equals("Register")) {
                        return true;
                    } else {
            <%            String query = "DELETE FROM Person WHERE SSN=" + "'" + SSN + "'";
                int rs = DBConnection.ExecUpdateQuery(query);
                if (rs > 0) {
                    response.sendRedirect("index.html");
                }
            %>
                        return false;
                    }
                }
            }
        </script>
  -->

</html>
