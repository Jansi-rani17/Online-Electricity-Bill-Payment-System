<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
String username=request.getParameter("username");
String password=request.getParameter("password"); 
if(username.equals("admin") && password.equals("admin"))
{
response.sendRedirect("adminframe.jsp");
}
else {
response.sendRedirect("admin.jsp");
}
%>
</body>
</html>