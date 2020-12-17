<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Log in with your account</title>

</head>

<body>
	<sec:authorize access="isAuthenticated()">
		<%
			response.sendRedirect("/");
		%>
	</sec:authorize>
	<div>
		<form method="POST" action="/login">
			<h2>Login</h2>
			<div class="form-label-group">
				<input name="username" type="text" class="form-control"
					placeholder="Username" autofocus="true" />
			</div>
			<div class="form-label-group">
				<input name="password" type="password" class="form-control"
					placeholder="Password" />
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Log
				In</button>
			<h4>
				<a href="/registration">Registration</a>
			</h4>
	</div>
	</form>
	</div>

</body>
</html>