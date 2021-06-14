<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Altona Music Store</title>
<link rel='stylesheet' type='text/css' href='css/entry_page.css'>
</head>
<body>
		<h1>Welcome To Altona Music Store</h1>
	
		<div class='container'>
			<h2>Please Log In to Continue</h2>
			<form name='login_form' method='post' action='login'>
				<input name='username' placeholder='Username' type='text' required>
				<input name='password' placeholder='Password' type='password' required>
				<input class='login' name='login' value='Log In' type='submit'>
			</form>
			<a href='register.jsp'>Sign Up</a>
			<a href='forgot_password.jsp'>Forgot My Password</a>
		</div>
</body>
</html>
