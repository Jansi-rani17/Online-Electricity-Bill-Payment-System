<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String customerno =(String)session.getAttribute("customerno");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "onlinebill";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from info where customerno="+customerno;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<head>
<h2>ACCOUNT DETAILS</h2>
<style>
* {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 50%;
    padding: 12px;
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
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}

.col-25 {
    float: left;
    width: 25%;
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
        width: 100%;
        margin-top: 0;
    }
}
</style>
</head>
<body background="ok.jpg">
<div class="container">
  <form action="viewbill.jsp">
    <div class="row">
      <div class="col-25">
        <label for="cardno">Card NO</label>
      </div>
      <div class="col-75">
        <input type="text" id="cardno" name="cardno" placeholder="Your card no">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="cvvno">CVV No</label>
      </div>
      <div class="col-75">
        <input type="text" id="cvvno" name="cvvno" placeholder="Your CVV no">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="Bank">Bank</label>
      </div>
      <div class="col-75">
        <select id="bank" name="bank">
          <option value="Indian Overseas Bank">Indian Overseas Bank</option>
          <option value="City Union Bank">City Union Bank</option>
          <option value="Indian Bank">Indian Bank</option>
           <option value="State Bank Of India">State Bank Of India</option>
        </select>
      </div>
    </div>
      <div class="row">
      <div class="col-25">
        <label for="expiry">Expiry Date</label>
      </div>
      <div class="col-75">
        <input type="date" id="expiry" name="expiry" placeholder="Enter Expiry date">
      </div>
     </div>
      
       <div class="row">
      <div class="col-25">
        <label for="Amount">Amount</label>
      </div>
      <div class="col-75">
        <input type="text" id="Amount" name="amount" value="<%=resultSet.getString("amount") %>">
      </div>
     </div>
    <div class="row">
      <input type="submit" value="Submit">
    </div>
  </form>
</div>
      <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>

