<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%
	String dbUrl = "jdbc:mysql://localhost:3306/dbShoppingCart";
	String dbUsername = "root";
	String dbPassword = "password";
	String dbDriver = "com.mysql.cj.jdbc.Driver";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='css/checkout.css'>
<title>Altona Music Store</title>
</head>
<body>
	<div class='header'>
		<h1 class='title'>Checkout</h1>
		<span class='current_user'>User:  <%=request.getSession().getAttribute("current_user")%></span>
		<a href='view_cart.jsp' class='view_cart'>View Cart</a>
		<a href='home.jsp' class='contine_shopping'>Continue Shopping</a>
		<span class='items_in_cart'>Items In Cart:  <%=request.getSession().getAttribute("items_in_cart")%></span>
	</div>
	
	<form name='checkout' method='post' action='checkout'>
		<div class='payment_info'>
			<span class='enter_text'>Enter Payment Information</span>
			<input name='fullName' placeholder='Name on Card' type='text' required>
			<input name='card' placeholder='Card Number' type='text' required>
		</div>
		
		<div class='shipping_info'>
			<span class='enter_text'>Enter Shipping Information</span>
			<input name='address' placeholder='Address' type='text' required>
			<input name='city' placeholder='City' type='text' required>
			<input name='state' placeholder='State' type='text' required>
			<input name='zip_code' placeholder='Zip Code' type='text' required>
		</div>
		<input class='submit' name='submit' type='submit' value='CHECKOUT'>
	</form>

</body>
</html>