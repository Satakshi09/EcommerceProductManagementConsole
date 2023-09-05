<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@page import="com.nagarro.controller.Factory"%>
<%@page import="com.nagarro.UserDao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.nagarro.entities.Products"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/admin.css">
    </head>

    <body>
        <div class="admin-page-wrapper">
            <div class="admin-header">
                <div class="hdr-title">
                    <h2>Project Management Tool</h2>
                    <nav class="right-hdr-item">      
                    <h4>Hi <%=session.getAttribute("current-user")%></h4>
                                       
                    </nav>
                </div>
            </div>
            <div class="admin-form">
                <h4>Please enter your details here</h4>
                <form action="AdminServlet" method="post">
                <input type="hidden" name="operation" value="addproduct"/>
                    <table class="form-table" border="0" cellpadding="10px" cellspacing="5px">
                        <tr>
                            <td>Title </td>
                            <td><input type="text"  name="Title"></td>
                        </tr>
                        <tr>
                            <td>Quantity </td>
                            <td><input type="number" name="Quantity"></td>
                        </tr>
                        <tr>
                            <td>Size </td>
                            <td><input type="text" name="Size" ></td>
                        </tr>
                        <tr>
                            <td>Image </td>
                            <td><input type="url" name="Image" ></td>
                            <td><input type="submit" name="submit"></td>
                        </tr>
                     </table>
                </form>
            </div>
            </div>
            <br>
           <%
ProductDao pdao=new ProductDao(Factory.getFactory());
List<Products>list=pdao.getProducts();

%>
          <div class="show-content">
                <table class="content-table" border="1" cellpadding="10px" cellspacing="5px">
                    <tr>
                        <th>S.No</th>
                        <th>Title</th>
                        <th>Quantity</th>
                        <th>Size</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                    <% for(Products prod:list){%>
                    <tr>
                    
                        <td><%=prod.getprodID() %></td>
                        <td><%=prod.getTitle() %></td>
                        <td><%= prod.getQuantity() %></td>
                        <td><%=prod.getSize() %></td>
                        <td>
                                <image class="brand-img"
                                src="<%= prod.getImage()%>" />
                        </td>
                        <td> 
                        <button type="button" class="btn" data-toggle="modal" data-target="#myModal">
                            <i class="fa" style="font-size:20px; color:blue;">&#xf044;	</i>
                        </button>
                       <br>
                        <form action="DeleteServlet" method="post">
                          <input type="hidden" name="id" value ="<%=prod.getprodID()%>">
                         <button type="submit">
                         <i style="font-size:37px" class="fa">&#xf00d; </i>
                         </button>  
                        </form>                      
                        </td>
                     </tr>
                    <% }%>
                   <tr>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td>Total number of products </td>
                   <td><%=list.size() %></td>
                   </tr>
                </table>
            </div>
             <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Edit your data</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <form action="UpdateServlet" method="post">
        <div class="modal-body">
             <div class="form-group">
              <label for="id">Product id:</label>
              <input type="number" class="form-control" id="id" placeholder="Enter product id" name="id">
             </div>
             <div class="form-group">
              <label for="email">Product title:</label>
              <input type="text" class="form-control" id="title" placeholder="Enter product title" name="title">
             </div>
             <div class="form-group">
              <label for="size">Product size:</label>
              <input type="text" class="form-control" id="size" placeholder="Enter product size" name="size">
             </div>
             <div class="form-group">
              <label for="quantity">Product quantity:</label>
              <input type="number" class="form-control" placeholder="Enter product quantity" name="quantity">
             </div>
             <div class="form-group">
              <label for="email">Product image url:</label>
              <input type="url" class="form-control" placeholder="Enter product image url" name="image">
             </div>
             
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary" >Submit</button>
        </div>
        </form>
      </div>
    </div>
  </div>
    </body>

    </html>
