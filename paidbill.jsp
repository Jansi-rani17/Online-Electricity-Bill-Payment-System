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
String customerno =(String)session.getAttribute("customerno");
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
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
    </style>
</head>
<body background="ok.jpg">
    <center>
<h1>customer details</h1> 
<table id="customers">    
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
String sql ="select customerno,billno,month,duedate,amount,status from info where customerno="+customerno;
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
    </center>
</body>
</html>