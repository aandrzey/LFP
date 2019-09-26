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
    <title>Title</title>
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="fragments/header.jspf" %>

<div class="container">

    <form:form modelAttribute="userDto" method="post">
        <div>
            <label for="idUsername">Username:</label>
            <form:input path="username" id="idUsername"/>
        </div>
        <form:errors path="username" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idEmail">Email:</label>
            <form:input path="email" id="idEmail"/>
        </div>
        <form:errors path="email" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idPassword">Hasło:</label>
            <form:password path="password" id="idPassword"/>
        </div>
        <form:errors path="password" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idConfirmPassword">Powtórz hasło:</label>
            <form:password path="confirmPassword" id="idConfirmPassword"/>
        </div>
        <form:errors path="confirmPassword" element="div" cssClass="alert alert-danger"/>
        <input type="submit" value="Zapisz"/>
    </form:form>

</div>
</body>
</html>
