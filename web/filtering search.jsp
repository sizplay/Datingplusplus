
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
        String haircolor = request.getParameter("HairColor");
        String weight = request.getParameter("Weight");
        String height = request.getParameter("Height");
        String datingAgeRangeStart = request.getParameter("DatingAgeRangeStart");
        String datingAgeRangeEnd = request.getParameter("DatingAgeRangeEnd");
        
        String query=null;
//	session.setAttribute("login", "");
//	if ((username != null) && (userpasswd != null))
//        {
//            if (username.trim().equals("") || userpasswd.trim().equals("")) {
//		response.sendRedirect("index.html");
//            } 
          
                    {
                        query = 
                
                query = "SELECT * FROM Person WHERE Email = '" +
                            username + "' AND Password = '" + userpasswd  + "'";
               	java.sql.ResultSet rs = DBConnection.ExecQuery(query);
		
                if (rs.next()) {
                    // login success
                    session.setAttribute("login", username);
                    session.setAttribute("password", userpasswd);
                    response.sendRedirect("profile.jsp");
		}
                
                else{
                        response.sendRedirect("index.html");
                    }
			
            }
	}
    
%>