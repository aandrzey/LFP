<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 24.09.2019
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LFP - Looking for player</title>
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/stylesheet.css" rel="stylesheet">
</head>
<body>
<%@include file="fragments/header.jspf" %>
<div class="container">
    <header>Logowanie</header>
    <form method="post">
        <div class="form-group">
            <div><label> User Name : <input type="text" class="form-control" name="username"/> </label></div>
            <div><label> Password: <input type="password" class="form-control" name="password"/> </label></div>
            <div>
                <button class="btn btn-primary" type="submit">Zaloguj</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
    </form>
</div>
</body>
</html>
