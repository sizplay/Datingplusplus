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
    String profileID = ((String) session.getAttribute("profileID"));
    String ID = ((String) session.getAttribute("ID"));

    String year = request.getParameter("yearModal");
    String month = request.getParameter("monthModal");
    String day = request.getParameter("dayModal");
    String location = request.getParameter("dateLocation");
    String custRep = request.getParameter("custRepModal");

    //2014-10-06 12:21:06
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
    int dayInt = Integer.parseInt(day);
    int monthInt = Integer.parseInt(month);
    int yearInt = Integer.parseInt(year);
    
    Timestamp timestamp = Timestamp.valueOf(yearInt + "-" + monthInt + "-" + dayInt + " 0:0:0.0");
    java.sql.Timestamp timestamp1 = new java.sql.Timestamp(timestamp.getTime());

//INSERT INTO `Date` value('Isabelle2014','Brenna_Berlin','222-22-2222',NOW(),'The Mall','0','Comment',NULL,NULL);
    String insertLIkes = "INSERT INTO Date"
            + " (Profile1, Profile2, CustRep, Date_Time, Location, BookingFee, Comments, User1Rating, User2Rating)"
            + " VALUES(?,?,?,?,?,?,?,?,?)";
    PreparedStatement stm = conn.prepareStatement(insertLIkes);
    stm.setString(1, profileID);
    stm.setString(2, ID);
    stm.setString(3, custRep);
    stm.setTimestamp(4, timestamp1);
    stm.setString(5, location);
    stm.setInt(6, 0);
    stm.setString(7, "Comments");
    stm.setInt(8, 0);
    stm.setInt(9, 0);

    stm.executeUpdate();

    //session.setAttribute("login", value);
    response.sendRedirect("profile.jsp");
%>

