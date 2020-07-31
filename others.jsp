
<!DOCTYPE html>
<html>
<title>CUSTOMER LOGIN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Style all input fields */
input {
    width: 20%;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
}

/* Style the submit button */
input[type=submit] {
    width: 10%;
    background-color: #4CAF50;
    color: white;
}

/* Style the container for inputs */
.container {
    background-color: #f1f1f1;
    padding: 10px;
}
</style>
</head>
<body background="ok.jpg">
   
<div class="container">
     <h1>User Login</h1>
     <center>
  <form action="checklogin.jsp">
    <label for="usrname">Username</label>
    <input type="text" id="userrname" name="username" required><br>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
    </center>
    <br>
    <center><input type="submit" value="Submit"></center>
  
</div>
</form>
</body>
</html>
 
