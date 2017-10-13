package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.swing.JOptionPane;
import DBWorks.DBConnection;
import java.sql.*;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public final class viewDateSuggestions_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <meta name=\"description\" content=\"\">\r\n");
      out.write("        <meta name=\"author\" content=\"\">\r\n");
      out.write("\r\n");
      out.write("        <title>Dating++</title>\r\n");
      out.write("\r\n");
      out.write("        <!-- Bootstrap Core CSS -->\r\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Custom CSS -->\r\n");
      out.write("        <link href=\"css/modern-business.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/animate.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Custom Fonts -->\r\n");
      out.write("        <link href=\"font-awesome-4.1.0/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\r\n");
      out.write("        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\r\n");
      out.write("        <!--[if lt IE 9]>\r\n");
      out.write("            <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\r\n");
      out.write("            <script src=\"https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js\"></script>\r\n");
      out.write("        <![endif]-->\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body background=\"./images/background.jpg\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Navigation -->\r\n");
      out.write("        <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\r\n");
      out.write("            <div class=\"container\"> \r\n");
      out.write("                <!-- Brand and toggle get grouped for better mobile display -->\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\"> <span class=\"sr-only\">Toggle navigation</span> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> </button>\r\n");
      out.write("                    <a class=\"navbar-brand\" href=\"profile.jsp\">Dating++</a> </div>\r\n");
      out.write("\r\n");
      out.write("                <!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("                        <li> <a href=\"browse.jsp\">Search</a> </li>\r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Dates<b class=\"caret\"></b></a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"dates.jsp\">Past Dates</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"dates.jsp\">Pending Dates</a>\r\n");
      out.write("                                </li>  \r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"dates.jsp\">Personalized date suggestion list</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Profiles<b class=\"caret\"></b></a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"mostActiveProfile.jsp\">Most active profiles</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"mostActiveProfile.jsp\">Most highly rated profiles</a>\r\n");
      out.write("                                </li>                            \r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>                       \r\n");
      out.write("                        <li> <a href=\"edit_account.jsp\">Setting Account</a> </li>    \r\n");
      out.write("                        <li> <a href=\"index.html\">Log Out</a> </li>    \r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- /.navbar-collapse --> \r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- /.container --> \r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <!-- Page Content -->\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("            <!-- Page Heading/Breadcrumbs -->   \r\n");
      out.write("            <form action=\"filtering search.jsp\" method=\"post\">     \r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-lg-12\">\r\n");
      out.write("                        <h1 class=\"page-header\">Browse\r\n");
      out.write("                            <small>Subheading</small>\r\n");
      out.write("                        </h1>\r\n");
      out.write("                        <ol class=\"breadcrumb\">\r\n");
      out.write("                            <li><a href=\"profile.jsp\">Home Profile</a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"active\">Browse</li>\r\n");
      out.write("                        </ol>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col-md-4 col-lg-12\">          \r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                ");

				Connection conn = null;
				String url = "jdbc:mysql://db4free.net:3306/";
				String dbName = "datingplusplus";
				String driver = "com.mysql.jdbc.Driver";
				String dbUserName = "sizplay";
				String dbPassword = "milk8012";
				ResultSet rs = null;
				
				try{
					Class.forName(driver).newInstance();
					conn = DriverManager.getConnection(url + dbName, dbUserName, dbPassword);
					
                    String login = ((String) session.getAttribute("login"));
                    String password = ((String) session.getAttribute("password"));
					String profileID = "";
					int age = 0;
					String SSN = "";
					
					String queryPersonTable = "SELECT P.SSN,P.FirstName FROM Person P WHERE P.Email = '"
                        + login + "'";
					java.sql.ResultSet rs1 = DBConnection.ExecQuery(queryPersonTable);

					if (rs1 != null && rs1.next()) {
						SSN = rs1.getString("SSN");
					}
                    String queryProfileTableUsingSSN = "SELECT * FROM Profile P WHERE P.OwnerSSN = '"
                            + SSN + "'";
                    java.sql.ResultSet rs2 = DBConnection.ExecQuery(queryProfileTableUsingSSN);
                    if (rs2 != null && rs2.next()) {
						profileID = rs2.getString("ProfileID");
						age = rs2.getInt("Age");
					}
			
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
					 /*
					 SELECT DISTINCT ProfileID, DatingAgeRangeStart, DatingAgeRangeEnd
						FROM Profile P
						WHERE ProfileID NOT IN(
							SELECT DISTINCT Profile.ProfileID
							FROM Date, Profile 
							WHERE (Profile1 = ? AND Profile2 = Profile.ProfileID) OR 
									(Profile2 = ? AND Profile1 = Profile.ProfileID)) AND DatingAgeRangeStart < ? AND DatingAgeRangeEnd > ?
					*/				
					
					String strQuery = "SELECT DISTINCT ProfileID, DatingAgeRangeStart, DatingAgeRangeEnd FROM Profile P WHERE ProfileID NOT IN( SELECT DISTINCT Profile.ProfileID FROM Date, Profile  WHERE (Profile1 = ? AND Profile2 = Profile.ProfileID) OR (Profile2 = ? AND Profile1 = Profile.ProfileID)) AND DatingAgeRangeStart < ? AND DatingAgeRangeEnd > ?";
					
					PreparedStatement stm = conn.prepareStatement(strQuery);
					stm.setString(1, profileID);
					stm.setString(2, profileID);
					stm.setInt(3, age);
					stm.setInt(4, age);
					rs = stm.executeQuery();
					}catch(Exception e){
						e.printStackTrace();
					}
                    double wow = .1;
                    while (rs.next()) {
                
      out.write("\r\n");
      out.write("                <div id=\"ProfileBox\" class=\"col-md-3 text-center wow fadeInUpBig\" data-wow-delay=\"");
      out.print(wow);
wow = wow + .1;
      out.write("s\">\r\n");
      out.write("                    <div class=\"thumbnail\">\r\n");
      out.write("                        <a href=\"viewProfile.jsp?ID=");
      out.print(rs.getString(1));
      out.write("\"><img id=\"pimage\" class=\"img-responsive\" src=\"http://placehold.it/250x300\" alt=\"\"></a>\r\n");
      out.write("                        <div class=\"caption\">\r\n");
      out.write("                            <h4> ");
 out.print(rs.getString(1));
      out.write("<br>\r\n");
      out.write("                            </h4>\r\n");
      out.write("                            <a href=\"viewProfile.jsp?ID=");
      out.print(rs.getString(1));
      out.write("\"><p>");
 out.print(rs.getString(2));
      out.write(' ');
 out.print(rs.getString(3)); 
      out.write("</p></a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

                    }

                
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <hr>\r\n");
      out.write("\r\n");
      out.write("            <!-- Footer -->\r\n");
      out.write("            <footer>\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-lg-12\">\r\n");
      out.write("                        <p>Copyright &copy; Your Website 2014</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </footer>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- /.container -->\r\n");
      out.write("\r\n");
      out.write("        <!-- jQuery -->\r\n");
      out.write("        <script src=\"js/jquery.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!-- Bootstrap Core JavaScript -->\r\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"assets/js/wow.min.js\"></script>\r\n");
      out.write("        <script src=\"js/wow.min.js\"></script>\r\n");
      out.write("        <script>\r\n");
      out.write("            new WOW().init();\r\n");
      out.write("        </script>\r\n");
      out.write("        <script src=\"js/ch_animate.js\"></script>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
