<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Log in with your account</title>
<style>
body {
	background: #c0c0c0;
	color: #fc0;
	margin-top: 15%;
}
</style>
</head>

<body>
	<sec:authorize access="isAuthenticated()">
		<%
			response.sendRedirect("/");
		%>
	</sec:authorize>
	<div align="center">
		<form method="POST" action="/login">
			<h1>Login</h1>
			<div class="form-label-group">
				<input name="username" type="text" class="form-control"
					placeholder="Username" autofocus="true" />
			</div>
			<div class="form-label-group">
				<input name="password" type="password" class="form-control"
					placeholder="Password" />
			</div>
			<div>
				<h2>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Log
						In</button>
					<a href="/registration">Registration</a>
				</h2>
			</div>
		</form>
	</div>
</body>
</html>