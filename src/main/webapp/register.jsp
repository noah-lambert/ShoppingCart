<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Altona Music Store</title>
<link rel='stylesheet' href='css/register.css'></head>
<body>
	<h1>Welcome To Altona Music Store</h1>
	<h2>Please Sign Up to Continue</h2>
	<form name='registration_form' method='post' action='register'>
		<input name='username' placeholder='Username' type='text' required>
		<input name='email' placeholder='Email' type='text' required>
		<input name='password' placeholder='Password' type='password' required>
		<input class='submit' name='register' value='Register' type='submit'>
	</form>
	<a class='a' href='login.jsp'>Sign In</a>
	
</body>
</html>