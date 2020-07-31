<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String username =(String)session.getAttribute("username");
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
<!DOCTYPE html>
<html>
<head>
<h2>BILL SEARCH</h2>
<style>
* {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 30%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 10px 10px 10px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 2px;
    background-color: #f2f2f2;
    padding: 10px;
}

.col-25 {
    float: left;
    width: 10%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 50%;
        margin-top: 0;
    }
}
</style>
</head>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from info where username='"+username+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body background="ok.jpg">
     <form action="view.jsp">
<div class="container">
 <div class="row">
      <div class="col-25">
        <label for="customerno">User ID</label>
      </div>
      <div class="col-75">
        <input type="text" id="customerno" name="customerno" value="<%=resultSet.getString("customerno")%>">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="month">Month</label>
      </div>
      <div class="col-75">
        <select id="month" name="month">
        <option value="January">January</option>
        <option value="February">February</option>
        <option value="March">March</option>
        <option value="April">April</option>
        <option value="May">May</option>
        <option value="June">June</option>
        <option value="July">July</option>
        <option value="August">August</option>
        <option value="September">September</option>
        <option value="October">October</option>
        <option value="November">November</option>
        <option value="December">December</option>
        </select>
      </div>
    </div>
      
    <div class="row">
        <center> <input type="submit" value="Submit"></center>
    </div>
  </form>
</div>
</body>
</html>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

