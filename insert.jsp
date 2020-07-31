<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <head>
    <style>
a:link, a:visited {
    background-color:green;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}


a:hover, a:active {
    background-color:rosybrown;
}
</style>
    </head>
    <body background="web-designer-wallpapers-7.jpg">
    <center>
        <form>
        <%
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String name=request.getParameter("name");
            String contactno=request.getParameter("contactno");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String status=request.getParameter("status");
            
            
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebill","root","");
                Statement st=con.createStatement();
                st.executeUpdate("insert into info(username,password,name,contactno,email,address,status)values('"+username+"','"+password+"','"+name+"','"+contactno+"','"+email+"','"+address+"','"+status+"')");
            }
           
            catch(Exception e)
            {
                out.println(e);
            }
            %>        
            <form>
           
          <h2>REGISTER SUCCESSFULLY</h2>
           </center>
          </body>
</html>

