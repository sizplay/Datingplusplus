<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.joda.time.DateTimeZone"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%
    String profileID = request.getParameter("Username");
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
    String gender = request.getParameter("sex");
    
    String url = "jdbc:mysql://db4free.net:3306/";
    String dbName = "datingplusplus";
    String driver = "com.mysql.jdbc.Driver";
    String dbUserName = "sizplay";
    String dbPassword = "milk8012";
    
    
    String insertProfile = "", insertPerson = "";
    if ((firstName != null) && (lastName != null)) {
        if (firstName.trim().equals("") || lastName.trim().equals("")) {
            response.sendRedirect("Registration_part2.html");
        } else {
            insertPerson = "INSERT INTO Person value('" + SSN + "','" + password + "','" + firstName + "','"
                    + lastName + "','" + address + "','" + city + "','" + state + "','" + zipcode
                    + "','" + email + "','" + phone + "')";
            int rs1 = DBConnection.ExecUpdateQuery(insertPerson);
            
            Connection conn = null;
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, dbUserName,   
                                            dbPassword);
            
            java.util.Date today = new java.util.Date();
            java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
            
            String insertUser = "INSERT INTO User"
                    + " (SSN, PPP, Rating, DateOfLastAct)"
                    + " VALUES(?,?,?,?)";
            PreparedStatement stm = conn.prepareStatement(insertUser);
            stm.setString(1, SSN);
            stm.setString(2, "User-User");
            stm.setString(3, "0");
            stm.setTimestamp(4, timestamp);
            stm.executeUpdate();
            
            insertProfile = "INSERT INTO Profile"
                    + " (ProfileID, OwnerSSN, Age, DatingAgeRangeStart, DatingAgeRangeEnd, DatinGeoRange, M_F, Hobbies, Height, Weight, HairColor, CreationDate, LastModDate)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            stm = conn.prepareStatement(insertProfile);
            stm.setString(1, profileID);
            stm.setString(2, SSN);
            stm.setString(3, age);
            stm.setString(4, datingAgeRangeStart);
            stm.setString(5, datingAgeRangeEnd);
            stm.setString(6, datingGeoRange);
            stm.setString(7, gender);
            stm.setString(8, hobbies);
            stm.setString(9, height);
            stm.setString(10, weight);
            stm.setString(11, hairColor);
            stm.setTimestamp(12, timestamp);
            stm.setTimestamp(13, timestamp);
            int rs2 = stm.executeUpdate();
            
            if (rs1 > 0 && rs2 > 0) {
                session.setAttribute("login", email);
                session.setAttribute("password", password);
                response.sendRedirect("profile.jsp");

            }
        }
    }
%>

