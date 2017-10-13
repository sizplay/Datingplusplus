
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%
	if ((request.getParameter("action") != null) && (request.getParameter("action").trim().equals("logout"))) {
		//session.putValue("login", "");
                session.setAttribute("login", "");
		response.sendRedirect("/");
		return;
	}

	String username = request.getParameter("username");
	String userpasswd = request.getParameter("userpasswd");
        String query=null;
	session.setAttribute("login", "");
	if ((username != null) && (userpasswd != null))
        {
            if (username.trim().equals("") || userpasswd.trim().equals("")) {
		response.sendRedirect("index.html");
            } 
            else {
                
                query = "SELECT * FROM Person WHERE Email = '" +
                            username + "' AND Password = '" + userpasswd  + "'";
               	java.sql.ResultSet rs = DBConnection.ExecQuery(query);
				
				/*
				SELECT Table2.SSN, Table2.FirstName, Table2.LastName, Table2.Role, Table2.Email, Table2.Password
				FROM(
				SELECT *
				FROM
				(
				SELECT DISTINCT Person.SSN as PersonSSN, Person.FirstName, Person.LastName, Person.Email, Person.Password
				FROM Person
				INNER JOIN Employee
				ON Employee.SSN=Person.SSN) as Table1
				RIGHT JOIN Employee
				ON Employee.SSN=Table1.PersonSSN) as Table2
				WHERE Table2.Email = '1' AND Table2.Password = '1' AND Table2.Role = 'Manager';
				*/
				query = "SELECT Table2.SSN, Table2.FirstName, Table2.LastName, Table2.Role, Table2.Email, Table2.Password FROM( SELECT * FROM ( SELECT DISTINCT Person.SSN as PersonSSN, Person.FirstName, Person.LastName, Person.Email, Person.Password FROM Person INNER JOIN Employee ON Employee.SSN=Person.SSN) as Table1 RIGHT JOIN Employee ON Employee.SSN=Table1.PersonSSN) as Table2 WHERE Table2.Email = '"+ username +"' AND Table2.Password = '"+ userpasswd +"' AND Table2.Role = 'Manager'";
				
                java.sql.ResultSet rs2 = DBConnection.ExecQuery(query);     
				
				query = "SELECT Table2.SSN, Table2.FirstName, Table2.LastName, Table2.Role, Table2.Email, Table2.Password FROM( SELECT * FROM ( SELECT DISTINCT Person.SSN as PersonSSN, Person.FirstName, Person.LastName, Person.Email, Person.Password FROM Person INNER JOIN Employee ON Employee.SSN=Person.SSN) as Table1 RIGHT JOIN Employee ON Employee.SSN=Table1.PersonSSN) as Table2 WHERE Table2.Email = '"+ username +"' AND Table2.Password = '"+ userpasswd +"' AND Table2.Role = 'CustRep'";
				
				java.sql.ResultSet rs3 = DBConnection.ExecQuery(query);
				
                if (rs.next()) {
                    // login success
                    session.setAttribute("login", username);
                    session.setAttribute("password", userpasswd);
					if(rs2.next()){
						 session.setAttribute("firstName", rs2.getString("firstName"));
						 session.setAttribute("lastName", rs2.getString("lastName"));
						 response.sendRedirect("adminPanel.jsp");
					}
					else if(rs3.next()){	 
						 session.setAttribute("firstName", rs3.getString("firstName"));
						 session.setAttribute("lastName", rs3.getString("lastName"));
						 response.sendRedirect("custRep.jsp");
					}
					else{
						response.sendRedirect("profile.jsp");
					}
		}
                
                else{
                        response.sendRedirect("index.html");
                    }
			
            }
	}
    
%>