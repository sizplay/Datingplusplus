
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
		
		String strQuery = "DELETE FROM Person " 
						+ "WHERE SSN = ? ";
        				  
		PreparedStatement stm = conn.prepareStatement(strQuery);
		stm.setString(1, SSN);
		stm.executeUpdate();
                
		String strQuery2 = "DELETE FROM User " 
						 + "WHERE SSN = ? ";
                
        stm = conn.prepareStatement(strQuery2);
        
		stm.setString(1, SSN);
		stm.executeUpdate();		
				
		String strQuery3 = "DELETE FROM Profile " 
						 + "WHERE OwnerSSN = ? ";
                
        stm = conn.prepareStatement(strQuery3);
        
		stm.setString(1, SSN);
		stm.executeUpdate();
		
		String strQuery4 = "DELETE FROM Account " 
						 + "WHERE OwnerSSN = ? ";
                
        stm = conn.prepareStatement(strQuery4);
        
		stm.setString(1, SSN);
		stm.executeUpdate();
		
        session.setAttribute("success", "successDelete");
		RequestDispatcher rd = request.getRequestDispatcher("customers.jsp");
		rd.forward(request, response);
		
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>
