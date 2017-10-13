<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="DBWorks.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

        String deletePerson = "DELETE FROM Profile WHERE OwnerSSN= ?";
        stm = conn.prepareStatement(deletePerson);
        stm.setString(1, SSN);
        stm.executeUpdate();

        session.setAttribute("login", login);
        session.setAttribute("password", password);

        RequestDispatcher rd = request.getRequestDispatcher("/custRepDeleteCustSuccess.jsp");
        rd.forward(request, response);

        /*String deleteProfile = "DELETE * FROM Profile WHERE OwnerSSN= ?";
         stm = conn.prepareStatement(deleteProfile);
         stm.setString(1, SSN);
         rs1 = stm.executeQuery();
                    
         String deleteUser = "DELETE * FROM USER WHERE OwnerSSN= ?";
         stm = conn.prepareStatement(deleteUser);
         stm.setString(1, SSN);
         rs1 = stm.executeQuery();*/
    }

%>