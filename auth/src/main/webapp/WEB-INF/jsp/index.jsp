<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Start Page</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
 <style>
   body {
    background: #c0c0c0; 
    margin-top: 20%;
   }
  </style>
</head>
<body>
<div align="center">
  <h3>${pageContext.request.userPrincipal.name}</h3>
  <sec:authorize access="!isAuthenticated()">
    <h4><a href="/login">Sign In</a></h4>
    <h4><a href="/registration">Registration</a></h4>
  </sec:authorize>
  <sec:authorize access="isAuthenticated()">
    <h4><a href="/logout">Logout</a></h4>
  </sec:authorize>
  <h4><a href="/admin">UserList (authorized only)</a></h4>
</div>
</body>
</html>