<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Altona Music Store</title>
<link rel='stylesheet' href='css/forgot_password.css'>
</head>
<body>

	<h1>Forgot My Password</h1>
	<h2>Enter Account Information and Change Password</h2>
	<form action="forgot_password" method="post">
		<input type="text" name="username" placeholder="Username" required>
		<input type="text" name="email" placeholder="Email" required>
		<input type="password" name="password" placeholder="Enter New Password" required>
		<input type="password" name="confirmPassword" placeholder="Confirm New Password" required>
		<input class='submit' type="submit" value="Change Password">
	</form>

</body>
</html>