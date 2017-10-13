
<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBWorks.DBConnection"%>
<%
    
    String firstName = request.getParameter("First_name");
    String lastName = request.getParameter("Last_Name");
    String address = request.getParameter("Address");
    String city = request.getParameter("City");
    String state = request.getParameter("State");
    String zipcode = request.getParameter("Zip_Code");
    String SSN = request.getParameter("SSN");
    String telephone = request.getParameter("Telephone");
    String email = request.getParameter("Email");
    
    out.print(firstName);
    out.print(lastName);
%>