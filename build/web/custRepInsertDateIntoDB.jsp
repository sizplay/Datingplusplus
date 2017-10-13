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
    int fee = Integer.parseInt(request.getParameter("fee"));
    /* profile's information to be displayed
    int age = 0, datingAgeRangeStart = 0, datingAgeRangeEnd = 0, datingGeoRange = 0;
    String hobbies = "", gender = "", height = "", weight = "", haircolor = "", lastmoddate = "";
    String firstName = "", lastName = "", telephone = "";
    String street = "", city = "", state = "", zip = "", SSN = ""; // Store person's information to be displayed*/

    Connection conn = null;
    Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(url + dbName, dbUserName,
            dbPassword);
    String[] profiles = profileID.split(" ");
    
    String queryForSSN = "SELECT * FROM Person WHERE Email = ? AND Password = ?";
    
    /*
    UPDATE Date 
    SET BookingFee = '0',CustRep = '111-11-1111' 
    WHERE Profile1 = 'Isabelle2013' AND Profile2 = 'Fletcher2013';
    */
    String updateDate = "UPDATE Date SET BookingFee = ?, CustRep = ? WHERE Profile1 = ? AND Profile2 = ?";
    
    PreparedStatement stm = conn.prepareStatement(queryForSSN);
    stm.setString(1, login);
    stm.setString(2, password);
    ResultSet rs1 = stm.executeQuery();
    
    if (rs1.next()) {
        String SSN = rs1.getString("SSN");
        stm = conn.prepareStatement(updateDate);
        stm.setInt(1, fee);
        stm.setString(2, SSN);
        stm.setString(3, profiles[0]);
        stm.setString(4, profiles[2]);
        stm.executeUpdate();

        session.setAttribute("login", login);
        session.setAttribute("password", password);
        
        response.sendRedirect("custRepUpdateCustSuccess.jsp");
        //RequestDispatcher rd = request.getRequestDispatcher("/custRepUpdateCustSuccess.jsp");
        //rd.forward(request, response);
    }

%>