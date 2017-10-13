
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
	String street = (String)request.getParameter("street");
	String city = (String)request.getParameter("city");
	String state = (String)request.getParameter("state");
	String zipCode = (String)request.getParameter("zipCode");
	String telephone = (String)request.getParameter("telephone");
	String role = (String)request.getParameter("role");
	int hourlyRate = Integer.parseInt(request.getParameter("hourlyRate"));
	String SSN = (String)request.getParameter("SSN");
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
		
		String strQuery = "UPDATE Person SET FirstName = ?, LastName = ?, Street = ?, City = ?, State = ?, Zipcode = ?, Telephone = ?"
                                + " WHERE SSN = ?";
        				  
		PreparedStatement stm = conn.prepareStatement(strQuery);
		stm.setString(1, firstName);
		stm.setString(2, lastName);
		stm.setString(3, street);
		stm.setString(4, city);
		stm.setString(5, state);
		stm.setString(6, zipCode);
		stm.setString(7, telephone);
		stm.setString(8, SSN);
		stm.executeUpdate();
                
		String strQuery2 = "UPDATE Employee SET Role = ?, HourlyRate = ?"
				 + " WHERE SSN = ?";
                
                stm = conn.prepareStatement(strQuery2);
                
		stm.setString(1, role);
		stm.setInt(2, hourlyRate);
		stm.setString(3, SSN);
		stm.executeUpdate();
                session.setAttribute("SSN",SSN);
                session.setAttribute("success", "success");
		if (redirected.equals("viewEmployee")){
                    RequestDispatcher rd = request.getRequestDispatcher("viewEmployee.jsp");
                     rd.forward(request, response);
                    //response.sendRedirect("viewEmployee.jsp");
		}
		else{
                    RequestDispatcher rd = request.getRequestDispatcher("adminPanel.jsp");
                     rd.forward(request, response);
		}
	} catch(Exception e){
		e.printStackTrace();
	}
%>
