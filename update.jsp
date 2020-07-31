<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/onlinebill";%>
<%!String user = "root";%>
<%!String psw = "";%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body background="web-designer-wallpapers-7.jpg">
   
        <form>

<%
String customerno = request.getParameter("customerno");
String billno=request.getParameter("billno");
String month=request.getParameter("month");
String duedate=request.getParameter("duedate");
String amount=request.getParameter("amount");
String status=request.getParameter("status");
if(customerno != null)
{
Connection con = null;
PreparedStatement ps = null;
int custno = Integer.parseInt(customerno);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update info set customerno=?,billno=?,month=?,duedate=?,amount=?,status=? where customerno="+customerno;
ps = con.prepareStatement(sql);
ps.setString(1,customerno);
ps.setString(2, billno);
ps.setString(3, month);
ps.setString(4, duedate);
ps.setString(5, amount);
ps.setString(6, status);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("<h1><center>CUSTOMER BILL GENERATED</center><h1>");
}
else
{
out.print("<h1><center>There is a problem in updating Record.</center><h1>");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
        </form>
</body>
</html>