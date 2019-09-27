<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 24.09.2019
  Time: 10:43
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

    <header>Rejestracja</header>
    <br>

    <form:form modelAttribute="userDto" method="post">
        <div class="form-group row">
            <label for="idUsername" class="col-form-label col-md-2">Username:</label>
            <div class="col-md-6">
                <form:input path="username" id="idUsername" class="form-control"/>
            </div>
        </div>
        <form:errors path="username" element="div" cssClass="alert alert-danger"/>
        <div class="form-group row">
            <label for="idEmail" class="col-form-label col-md-2">Email:</label>
            <div class="col-md-6">
                <form:input path="email" id="idEmail" class="form-control"/>
            </div>
        </div>
        <form:errors path="email" element="div" cssClass="alert alert-danger"/>
        <div class="form-group row">
            <label for="idPassword" class="col-form-label col-md-2">Hasło:</label>
            <div class="col-md-6">
                <form:password path="password" id="idPassword" class="form-control"/>
            </div>
        </div>
        <form:errors path="password" element="div" cssClass="alert alert-danger"/>
        <div class="form-group row">
            <label for="idConfirmPassword" class="col-form-label col-md-2">Powtórz hasło:</label>
            <div class="col-md-6">

                <form:password path="confirmPassword" id="idConfirmPassword" class="form-control"/>
            </div>
        </div>
        <form:errors path="confirmPassword" element="div" cssClass="alert alert-danger"/>
        <button type="submit" class="btn btn-primary">Zapisz</button>
    </form:form>

</div>
</body>
</html>
