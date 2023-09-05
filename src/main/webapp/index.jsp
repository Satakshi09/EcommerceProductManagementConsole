  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Document</title>
    <link rel="stylesheet"  href ="css/style.css">
    
</head>
<body>
<div class="site-wrapper">
      <div class="form-wrapper">    
       <div class="form-heading"> <h2>login</h2></div>
       <form action = "LoginServlet" method = "POST">
       <br>
       <br>
       <%@include file="components/message.jsp" %>
       <table border="1" cellpadding="10px" cellspacing="5px">    
         <tr>    
           <td> Username * </td>    
           <td><input type = "text" name = "userEmail" placeholder="Enter your username"> </td>    
         </tr>   
          <tr>    
           <td> Password * </td>    
           <td><input type = "password" name = "userPassword" placeholder="Enter your password"> </td>    
         </tr> 
          
         </table>  
       
         <input type = "submit" value = "Submit" />
         <br>
         <br>
      </form>
      </div>
     </div>
</body>
</html>