
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>


<%
	String firstName = (String)request.getParameter("firstName");
	String lastName = (String)request.getParameter("lastName");
	String email = (String)request.getParameter("email");
	String password = (String)request.getParameter("password");
	String street = (String)request.getParameter("street");
	String city = (String)request.getParameter("city");
	String state = (String)request.getParameter("state");
	String zipCode = (String)request.getParameter("zipCode");
	String telephone = (String)request.getParameter("telephone");
	String role = (String)request.getParameter("role");
	int hourlyRate = Integer.parseInt(request.getParameter("hourlyRate"));
	String SSN = (String)request.getParameter("SSN");
	String startDate = (String)request.getParameter("startDate");
	java.sql.Date convertedDate = java.sql.Date.valueOf(startDate);
	String redirected = (String)request.getParameter("redirected");
        
        Connection conn = null;
        String url = "jdbc:mysql://db4free.net:3306/";
        String dbName = "datingplusplus";
        String driver = "com.mysql.jdbc.Driver";
        String dbUserName = "sizplay";
        String dbPassword = "milk8012";
	try{
		Class.forName(driver).newInstance();
		conn = DriverManager.getConnection(url + dbName, dbUserName, dbPassword);
		
		String strQuery = "INSERT INTO Person(SSN, Password, FirstName, LastName, Street, City, State, ZipCode, Email, Telephone)" 
						+ "VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        				  
		PreparedStatement stm = conn.prepareStatement(strQuery);
		stm.setString(1, SSN);
		stm.setString(2, password);
		stm.setString(3, firstName);
		stm.setString(4, lastName);
		stm.setString(5, street);
		stm.setString(6, city);
		stm.setString(7, state);
		stm.setString(8, zipCode);
		stm.setString(9, email);
		stm.setString(10, telephone);
		stm.executeUpdate();
                
		String strQuery2 = "INSERT INTO Employee(SSN, Role, StartDate, HourlyRate)" 
						 + "VALUES( ?, ?, ?, ?)";
                
        stm = conn.prepareStatement(strQuery2);
        
		stm.setString(1, SSN);        
		stm.setString(2, role);
		stm.setDate(3, convertedDate);
		stm.setInt(4, hourlyRate);
		stm.executeUpdate();
		
        session.setAttribute("success", "success");
		RequestDispatcher rd = request.getRequestDispatcher("employees.jsp");
		rd.forward(request, response);
		
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>
