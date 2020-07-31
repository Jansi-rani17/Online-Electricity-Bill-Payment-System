<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "onlinebill";
String userid = "root";
String password = "";
String customerno=request.getParameter("customerno");
session.setAttribute("customerno", customerno);//session attribute
String month=request.getParameter("month");

try {
Class.forName(driver);
}
catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
    <head>
        <style>
               
        a:link, a:visited {
    background-color: green;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
        }
    table {
    border-collapse: collapse;
    width: 80%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}

        </style>
    </head>
<body background="ok.jpg">
    <center>
<h1>customer details</h1> 
<table border="1">
<tr>
<td>CUSTOMER NO</td>
<td>SERVICE NO</td>
<td>MONTH</td>
<td>DUE DATE</td>
<td>AMOUNT</td>
<td>STATUS</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select customerno,billno,month,duedate,amount,status from info where customerno='"+customerno+"' and month='"+month+"'"; 
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("customerno") %></td>
<td><%=resultSet.getString("billno") %></td>
<td><%=resultSet.getString("month") %></td>
<td><%=resultSet.getString("duedate") %></td>
<td><%=resultSet.getString("amount") %></td>
<td><%=resultSet.getString("status") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>
<br>
<a href="selectcard.jsp" target="frame2">MAKE PAYMENT</a>
</body>
</html>