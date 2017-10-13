<%-- 
    Document   : userReferAProfile
    Created on : Dec 4, 2014, 1:39:07 PM
    Author     : nikhilnair
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String login = ((String) session.getAttribute("login"));
    String ID = ((String)session.getAttribute("ID"));   // PROFILE_B
    String profileID = ((String) session.getAttribute("profileID"));    // PROFILE_A
    String selectedProfileID = request.getParameter("userIDs"); // PROFILE_C
    
    String url = "jdbc:mysql://db4free.net:3306/";
    String dbName = "datingplusplus";
    String driver = "com.mysql.jdbc.Driver";
    String dbUserName = "sizplay";
    String dbPassword = "milk8012";

    Connection conn = null;
    Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url + dbName, dbUserName,
            dbPassword);
    
    String insertReferral = "INSERT INTO Referral"
                    + " (ProfileA, ProfileB, ProfileC, Date_Time)"
                    + " VALUES(?,?,?,?)";
    
    java.util.Date today = new java.util.Date();
    java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
            
    PreparedStatement stm = conn.prepareStatement(insertReferral);
    stm.setString(1, profileID);    
    stm.setString(2, ID);
    stm.setString(3, selectedProfileID);
    stm.setTimestamp(4, timestamp);
    stm.executeUpdate() ;
    
    session.setAttribute("profileID", profileID);
    session.setAttribute("ID", ID);
    session.setAttribute("login", login);
    
    response.sendRedirect("profile.jsp");

%>
