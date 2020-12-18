<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Регистрация</title>
<style>
   body {
    background: #c0c0c0; 
    color: #fc0; 
    margin-top: 10%;
   }
  </style>
</head>

<body>
	<div>
  </style>
		<form:form method="POST" modelAttribute="userForm">
			<h1 align="center">Registration
				<div>
					<form:input type="text" path="username" placeholder="Username"
						autofocus="true"></form:input>
					<form:errors path="username"></form:errors>
					${usernameError}
				</div>
				<div>
					<form:input type="password" path="password" placeholder="Password"></form:input>
				</div>
				<div>
					<form:input type="email" path="email" placeholder="Enter e-mail"></form:input>
					<form:errors path="email"></form:errors>
					${emailError}
				</div>
			</h1>
			<h2 align="center">
				<button type="submit">Register</button>
		</form:form>
		<a href="/">Start page</a>
		</h2>
	</div>
</body>
</html>