<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/onlinebill";%>
<%!String user = "root";%>
<%!String psw = "";%>
<html>
    <head>
<style>
a:link, a:visited {
    background-color: whitesmoke;
    color: black;
    border: 2px solid green;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}

a:hover, a:active {
    background-color: green;
    color: white;
}
</style>
</head>
   <body background="ok.jpg">
        <form>
        <table>
            <center>
            <tr><td><input type="hidden" name="status" value="paid"></td></tr>
<%
String customerno =(String)session.getAttribute("customerno");
String status="paid";
if(customerno != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(customerno);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update info set customerno=?,status=? where customerno="+customerno;
ps = con.prepareStatement(sql);
ps.setString(1,customerno);
ps.setString(2, status);
int i = ps.executeUpdate();
 if(i>0)
{
    response.sendRedirect("paymentsuccess.jsp");
}
else
{
    out.println("something wrong..check your details");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<tr>
</center>
    </table>
        </form>
    </body>
</html>
