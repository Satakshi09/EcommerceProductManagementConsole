<%@page import="com.nagarro.controller.Factory"%>
<%@page import="com.nagarro.UserDao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.nagarro.entities.Products"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
ProductDao pdao=new ProductDao(Factory.getFactory());
List<Products>list=pdao.getProducts();

%>
 <div class="show-content">
                <table class="content-table" border="1" cellpadding="10px" cellspacing="5px">
                    <tr>
                        <th>s .No</th>
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
                                src="<%= prod.getImage() %>" />
                        </td>
                        <td>1</td>
                    </tr>
                    <% }%>
                </table>
            </div>
</body>
</html>
