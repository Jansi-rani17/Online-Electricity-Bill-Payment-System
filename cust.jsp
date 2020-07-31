<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head><style>
a:link, a:visited {
    background-color: green;
    color: white;
    padding: 3px 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}


a:hover, a:active {
    background-color:gray;
    
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
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "onlinebill";
String userid = "root";
String password = "";
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
<body background="web-designer-wallpapers-7.jpg" onload="myFunction()">
    <center>
<h1>customer details</h1> 
<table border="1">
<tr>
<td>CUSTOMER NO</td>
<td>NAME</td>
<td>CONTACT NO</td>
<td>EMAIL ID</td>
<td>ADDRESS</td>
<td>STATUS</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select customerno,name,contactno,email,address,status from info";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("customerno") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("contactno") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("address") %></td>
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
    </body>
</html>
  