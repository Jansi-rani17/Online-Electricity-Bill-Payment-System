<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String customerno=request.getParameter("customerno");
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
    <title>BILL CALCULATION</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
    <style>
       .button {
    background-color: green; /* Green */
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px 2px;
    cursor: pointer;
}
        
        a:link, a:visited {
    background-color: green;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}
        .button4 {padding: 10px 24px;}/*for submit button*/
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from info where customerno='"+customerno+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body background="web-designer-wallpapers-7.jpg">
  <center> <h2> ELECTRICITY BILL CALCULATION</h2></center>
<div class="container">
  <form action="update.jsp">
    <div class="row">
      <div class="col-25">
        <label for="customerno">Customer no</label>
      </div>
      <div class="col-75">
        <input type="text" id="customerno" name="customerno" value="<%=resultSet.getString("customerno")%>">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="billno">Bill No</label>
      </div>
      <div class="col-75">
        <input type="text" id="billno" name="billno" placeholder="Your billno">
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
      <div class="col-25">
        <label for="duedate">Due Date</label>
      </div>
      <div class="col-75">
        <input type="date" id="duedate" name="duedate" placeholder="Enter duedate">
      </div>
     </div>
      <input class="w2-input" type="hidden" name="status" value="NotPaid">
      <div class="row">
      <div class="col-25">
        <label for="cost">Cost Per Unit</label>
      </div>
      <div class="col-75">
        <input type="text" name="cost" id="a" value="9">
      </div>
     </div>
       <div class="row">
      <div class="col-25">
        <label for="unit">Unit Consumed</label>
      </div>
      <div class="col-75">
        <input type="text" id="b" name="consumed" placeholder="Enter unit consumed"> <h5>1 kilowatt-hour(kWh) cost 9 rupees</h5>
      </div>
     </div>
        <div class="row">
      <div class="col-25">
        <label for="amount">Bill Amount</label>
      </div>
      <div class="col-75">
        <input type="text" id="c" name="amount"> <button class="button button4" type="button" onclick= "add_number()">calculate</button>
      </div>
     </div>
       <button class="button button4" onclick="showAlert()">Submit</button>
     </form>
    </center>
    <script>
   function add_number(){
      var in1=document.getElementById('a').value;
      var in2=document.getElementById('b').value;
      var in3=in1*in2;
      document.getElementById('c').value=in3;  
  }
   </script>
   </body>
</html>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>