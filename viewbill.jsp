<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<style>
.button {
    background-color: green; /* Green */
    border: none;
    color: whitesmoke;
    padding: 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    .button4 {padding: 10px 24px;/*for submit button*/
}
table {
    border-collapse: collapse;
    width: 50%;
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
<body background="ok.jpg">
<center>
<h1>customer details</h1> 
<form action="paymentupdate.jsp">
    
 <table>      
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from info where customerno="+customerno;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<center>
     
   <tr><p>
    <td><label>CUSTOMER NO</label></td>
  <td><input class="w2-input" type="text" name="customerno" value="<%=resultSet.getString("customerno")%>"></td></p></tr>
 <tr> <p>
 <tr><p>
  <td><label>NAME</label></td>
  <td><input class="w2-input" type="text" name="name" value="<%=resultSet.getString("name")%>"></td></p></tr>
  <tr><p>
  <td><label>CONTACT NO</label></td>
  <td><input class="w2-input" type="text" name="contactno" value="<%=resultSet.getString("contactno")%>"></td></p></tr>
  <tr><p>
  <td><label>BILL NO</label></td>
  <td><input class="w2-input" type="text" name="billno" value="<%=resultSet.getString("billno")%>"></td></p></tr>
  <tr><p>
  <td><label>AMOUNT</label></td>
  <td><input class="w2-input" type="text" name="amount" value="<%=resultSet.getString("amount")%>"></td></p></tr>


<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
 </table>
 <button class="button button4">SUBMIT</button> 

    </form>
</body>
 
</html>