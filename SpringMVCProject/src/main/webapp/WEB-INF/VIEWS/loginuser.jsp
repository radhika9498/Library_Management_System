<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<h2>Library Management System</h2>
	
	<form action="/SpringMVCProject/submitLogin" method="post">
		Enter User Name: <input type="text" name="uname"/> <br/>
		Enter Password : <input type="password" name="pwrd"><br/>
		Member Type: 
		<select name="user">
			<option value="librarian">Librarian</option>
			<option value="student">Student</option>
			<option value="staff">Staff</option>
		</select><br/> 
		<input type="submit" value="Login"/>
	</form>
</body>
</html>
