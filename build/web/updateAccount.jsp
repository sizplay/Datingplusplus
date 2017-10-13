
<%@page import="DBWorks.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            String login = ((String)session.getAttribute("login"));
  
            String profileSSN = ((String)session.getAttribute("SSN"));
            
            String password = ((String)session.getAttribute("Password"));
            
            String address = request.getParameter("Address");
            String city = request.getParameter("City");
            String state = request.getParameter("State");
            String zip = request.getParameter("Zipcode");
            
            String telephone = request.getParameter("Telephone");            
            
            String datingAgeRangeStart = request.getParameter("DatingAgeRangeStart");
            String datingAgeRangeEnd = request.getParameter("DatingAgeRangeEnd");
            String datingGeoRange = request.getParameter("DatinGeoRange");
            String hairColor = request.getParameter("HairColor");
            String hobbies = request.getParameter("Hobbies");
            
            String updatePersonUsingSSN = "UPDATE Person P SET P.Street = '" + address
                    +  "', P.City = '" + city
                    + "', P.State = '" + state
                    + "', P.Zipcode ='" + zip
                    + "', P.telephone = '" + telephone
                    + "' WHERE P.SSN = '"
                    + profileSSN + "'";
            int rs1 = DBConnection.ExecUpdateQuery(updatePersonUsingSSN);
            
            String updateProfileUsingSSN = "UPDATE Profile P SET P.DatingAgeRangeStart = '" + datingAgeRangeStart
                    +  "', P.DatingAgeRangeEnd = '" + datingAgeRangeEnd
                    + "', P.DatinGeoRange = '" + datingGeoRange
                    + "', P.HairColor ='" + hairColor
                    + "', P.Hobbies = '" + hobbies
                    + "' WHERE P.OwnerSSN = '"
                    + profileSSN + "'";
            int rs2 = DBConnection.ExecUpdateQuery(updateProfileUsingSSN);
            if(rs1 > 0 || rs2 > 0) {
                session.setAttribute("login", login);
                session.setAttribute("password", password);
                
            response.sendRedirect("profile.jsp");
                //RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
                        //rd.forward(request, response);
            }
%>
