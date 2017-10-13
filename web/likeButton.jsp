<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%
    /*String profileID = request.getParameter("Username");
     String password = request.getParameter("PassWord");
     String SSN = request.getParameter("SSN");
     String firstName = request.getParameter("First_name");
     String lastName = request.getParameter("Last_Name");
     String address = request.getParameter("Address");
     String city = request.getParameter("City");
     String state = request.getParameter("State");
     String zipcode = request.getParameter("Zip_Code");
     String phone = request.getParameter("Telephone");
     String email = request.getParameter("Email");
     // profile informaiton
     String datingAgeRangeStart = request.getParameter("DatingAgeRangeStart");
     String datingAgeRangeEnd = request.getParameter("DatingAgeRangeEnd");
     String datingGeoRange = request.getParameter("DatinGeoRange");
     String age = request.getParameter("age");
     String height = request.getParameter("Height");
     String weight = request.getParameter("Weight");
     String hairColor = request.getParameter("HairColor");
     String hobbies = request.getParameter("Hobbies");
     String gender = request.getParameter("sex");*/

    String profileID = ((String) session.getAttribute("profileID"));
    String ID = ((String) session.getAttribute("ID"));

    String url = "jdbc:mysql://db4free.net:3306/";
    String dbName = "datingplusplus";
    String driver = "com.mysql.jdbc.Driver";
    String dbUserName = "sizplay";
    String dbPassword = "milk8012";

    Connection conn = null;
    Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url + dbName, dbUserName,
            dbPassword);

    java.util.Date today = new java.util.Date();
    java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

    String insertLIkes = "INSERT INTO Likes"
            + " (Liker, Likee, Date_Time)"
            + " VALUES(?,?,?)";
    PreparedStatement stm = conn.prepareStatement(insertLIkes);
    stm.setString(1, profileID);
    stm.setString(2, ID);
    stm.setTimestamp(3, timestamp);
    stm.executeUpdate();
    
    //session.setAttribute("login", value);
    response.sendRedirect("profile.jsp");
%>

