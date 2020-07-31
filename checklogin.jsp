<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String username=request.getParameter("username"); 
session.setAttribute("username", username);//session attribute
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebill","root","");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from info where username='"+username+"' and password='"+password+"'"); 
try{
while(rs.next())
{
if(rs.getString("password").equals(password)&&rs.getString("username").equals(username)) 
{ 
response.sendRedirect("userframe.jsp");
} 
else
{
out.println("Invalid password or username.");
response.sendRedirect("others.jsp");
}
}
}
catch (Exception e) {
e.printStackTrace();
}
%>