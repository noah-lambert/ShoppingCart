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
	int items_in_cart = (Integer) request.getSession().getAttribute("items_in_cart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Altona Music Store</title>
<link rel='stylesheet' href='css/view_cart.css'>
</head>
<body>

	<div class='header'>
		<h1 class='title'>My Cart</h1>
		<span class='current_user'>User:  <%=request.getSession().getAttribute("current_user")%></span>
		<a href='home.jsp' class='contine_shopping'>Continue Shopping</a>
		<span class='items_in_cart'>Items In Cart:  <%=items_in_cart%></span>
	</div>
	
	
	
	<table class='cart'>
		<tr>
			<th>Item</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th></th>
		</tr>
<%
	Connection con = null;
	float total_price = 0;

	try {
		con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
		Statement statement = con.createStatement();
		String username = (String) request.getSession().getAttribute("current_user");
		if(username == null) {
			response.sendRedirect("login.jsp");
		}
		String sql1 = "select item_id, item_name, item_price, count(item_id) as 'quantity' from cart group by item_id, username having count(item_id) > 0 and username='" + username +"'";
		
		//String sql2 = "update member set address=null, city=null, state=null, zip_code=null where username='" + username +"'";
		
		ResultSet rs1 = statement.executeQuery(sql1);
		
		
		String item_id = "failed";
		String item_name = "nope";
		float item_price = 0;
		int quantity = 0;
						
		while(rs1.next()) {
			item_id = rs1.getString(1);
			item_name = rs1.getString(2);
			item_price = rs1.getFloat(3);
			total_price += item_price;
			quantity = rs1.getInt(4);		
		
%>
		<tr>
			<td><%=item_id%></td>
			<td><%=item_name%></td>
			<td>$<%=item_price%></td> 
			<td><%=quantity%></td> 
			<td><form method='get' action='Servlet<%=item_id%>'><input class='remove' value='REMOVE' type='submit'></form></td>
		</tr>
<%
		}
		
		//statement.executeQuery(sql2);
		rs1.close();
	}catch (SQLException e) {
			e.printStackTrace();
	}	
	
%>
	</table>
	<span class='total_price'>Total Price:  $<%=total_price%></span>
	<a class='checkout' href='checkout.jsp'>CHECKOUT</a>

</body>
</html>