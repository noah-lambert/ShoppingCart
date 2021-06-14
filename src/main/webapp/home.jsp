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
	String current_user = (String) request.getSession().getAttribute("current_user");
	int items_in_cart = (Integer) request.getSession().getAttribute("items_in_cart");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Altona Music Store</title>
<link rel='stylesheet' href='css/home.css'>
</head>
<body>
	<div class='header'>
		<h1 class='title'>Altona Music Store</h1>
		
		<a class='view_cart' href='view_cart.jsp'>View Cart</a>
		<span class='current_user'>User:  <%=current_user%></span>
		<span class='items_in_cart'>Items In Cart:  <%=items_in_cart%></span>
	</div>
	
	<div class='category' id='vinyl'>
		<h3 >Vinyl Records</h3>
		
		<div class='item' id='001'>
			<span class='item-name'>Hotel California by The Eagles</span>
			<img class='item-image' src="img/vinyl/hotel_california.jpeg">
			<div class='item-details'>
				<span class='item-price'>$19.99</span>
				<form method='post' action='Servlet001'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='002'>
			<span class='item-name'>Bad Company by Bad Company</span>
			<img class='item-image' src='img/vinyl/bad_company.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$19.99</span>
				<form method='post' action='Servlet002'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>			
			</div>
		</div>
		
		<div class='item' id='003'>
			<span class='item-name'>Reckless by Bryan Adams</span>
			<img class='item-image' src='img/vinyl/reckless.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$19.99</span>
				<form method='post' action='Servlet003'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='004'>
			<span class='item-name'>The Wall by Pink Floyd</span>
			<img class='item-image' src='img/vinyl/the_wall.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$19.99</span>
				<form method='post' action='Servlet004'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
	</div>
	
	<div class='category' id='electric_guitars'>
		<h3>Electric Guitars</h3>
		
		<div class='item' id='005'>
			<span class='item-name'>Fender Stratocaster</span>
			<img class='item-image' src='img/electric_guitars/fender_strat.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$749.99</span>
				<form method='post' action='Servlet005'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='006'>
			<span class='item-name'>Gibson Cherry Red</span>
			<img class='item-image' src='img/electric_guitars/gibson.png'>
			<div class='item-details'>
				<span class='item-price'>$2,999.99</span>
				<form method='post' action='Servlet006'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='007'>
			<span class='item-name'>Epiphone Les Paul</span>
			<img class='item-image' src='img/electric_guitars/les_paul.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$599.99</span>
				<form method='post' action='Servlet007'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='008'>
			<span class='item-name'>Squier Jaguar</span>
			<img class='item-image' src='img/electric_guitars/squier.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$499.99</span>
				<form method='post' action='Servlet008'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
	</div>
	 
	<div class='category' id='acoustic_guitars'>
		<h3>Acoustic Guitars</h3>
		
		<div class='item' id='009'>
			<span class='item-name'>Fender Acoustic</span>
			<img class='item-image' src='img/acoustic_guitars/fender.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$299.99</span>
				<form method='post' action='Servlet009'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='010'>
			<span class='item-name'>Taylor Acoustic</span>
			<img class='item-image' src='img/acoustic_guitars/taylor.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$249.99</span>
				<form method='post' action='Servlet010'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='011'>
			<span class='item-name'>Fender Acoustic-Electric</span>
			<img class='item-image' src='img/acoustic_guitars/acoustic_electric.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$349.99</span>
				<form method='post' action='Servlet011'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='012'>
			<span class='item-name'>Fender 12-String Acoustic-Electric</span>
			<img class='item-image' src='img/acoustic_guitars/12_string.jpeg'>
			<div class='item-details'>
				<span class='item-price'>$499.99</span>
				<form method='post' action='Servlet012'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
	</div>
	
	<div class='category' id='keyboards'>
		<h3>Pianos and Keyboards</h3>
		
		<div class='item' id='013'>
			<span class='item-name'>Williams Rhapsody 2 Digital Piano</span>
			<img class='item-image' src='img/keyboards/piano2.png'>
			<div class='item-details'>
				<span class='item-price'>$499.99</span>
				<form method='post' action='Servlet013'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='014'>
			<span class='item-name'>Suzuki MDG-300 Grand Piano</span>
			<img class='item-image' src='img/keyboards/piano1.png'>
			<div class='item-details'>
				<span class='item-price'>$2,199.99</span>
				<form method='post' action='Servlet014'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='015'>
			<span class='item-name'>Yamaha Digital Piano</span>
			<img class='item-image' src='img/keyboards/keyboard1.png'>
			<div class='item-details'>
				<span class='item-price'>$649.99</span>
				<form method='post' action='Servlet015'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='016'>
			<span class='item-name'>Korg Synthesizer/Vocoder</span>
			<img class='item-image' src='img/keyboards/keyboard2.png'>
			<div class='item-details'>
				<span class='item-price'>$429.99</span>
				<form method='post' action='Servlet016'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
	</div>
	
	<div class='category' id='drums'>
		<h3>Drums</h3>
	
		<div class='item' id='017'>
			<span class='item-name'>5-Piece Drum Kit</span>
			<img class='item-image' src='img/drums/drums1.png'>
			<div class='item-details'>
				<span class='item-price'>$699.99</span>
				<form method='post' action='Servlet017'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='018'>
			<span class='item-name'>10-Piece Digital Drum Kit</span>
			<img class='item-image' src='img/drums/electric_drum.png'>
			<div class='item-details'>
				<span class='item-price'>$429.99</span>
				<form method='post' action='Servlet018'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='019'>
			<span class='item-name'>Gretsch Snare Drum</span>
			<img class='item-image' src='img/drums/snare.png'>
			<div class='item-details'>
				<span class='item-price'>$69.99</span>
				<form method='post' action='Servlet019'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
		
		<div class='item' id='020'>
			<span class='item-name'>LP City Bongos</span>
			<img class='item-image' src='img/drums/bongo.png'>
			<div class='item-details'>
				<span class='item-price'>$99.99</span>
				<form method='post' action='Servlet020'> <input class='add_to_cart' name='add_to_cart' value='ADD TO CART' type='submit'> </form>
			</div>
		</div>
	</div> 
		
	
</body>
</html>