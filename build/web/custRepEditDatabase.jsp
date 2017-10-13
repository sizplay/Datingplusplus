<%@page import="DBWorks.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
            
            String login = ((String) session.getAttribute("login"));
            String password = ((String) session.getAttribute("password"));
    
            // customer info
            String customerProfile = ((String)session.getAttribute("customerProfile"));
            String customerSSN = ((String)session.getAttribute("customerSSN"));
            
            //String SSN = request.getParameter("SSN");
            String address = request.getParameter("Address");
            String city = request.getParameter("City");
            String state = request.getParameter("State");
            String zip = request.getParameter("Zip_Code");
            
            String telephone = request.getParameter("Telephone");            
            String newPassword = request.getParameter("PassWord");
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
                    + "', P.password = '" + telephone
                    + "' WHERE P.SSN = '"
                    + customerSSN + "'";
            int rs1 = DBConnection.ExecUpdateQuery(updatePersonUsingSSN);
            
            String updateProfileUsingSSN = "UPDATE Profile P SET P.DatingAgeRangeStart = '" + datingAgeRangeStart
                    +  "', P.DatingAgeRangeEnd = '" + datingAgeRangeEnd
                    + "', P.DatinGeoRange = '" + datingGeoRange
                    + "', P.HairColor ='" + hairColor
                    + "', P.Hobbies = '" + hobbies
                    + "' WHERE P.OwnerSSN = '"
                    + customerSSN + "'";
            int rs2 = DBConnection.ExecUpdateQuery(updateProfileUsingSSN);
            if(rs1 > 0 || rs2 > 0) {
                session.setAttribute("login", login);
                session.setAttribute("password", password);
                
                RequestDispatcher rd = request.getRequestDispatcher("/custRepEditCustSuccess.jsp");
                        rd.forward(request, response);
            }
    %>