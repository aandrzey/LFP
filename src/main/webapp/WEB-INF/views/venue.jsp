<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 24.09.2019
  Time: 20:21
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
    <header>Zaproponuj nowe miejsce</header>
    <form:form modelAttribute="venueDto" method="post">
        <div class="form-group row">
            <label for="IdName" class="col-form-label col-md-1">Nazwa:</label>
            <div class="col-md-6">
                <form:input path="name" id="IdName" class="form-control"/>
            </div>
        </div>
        <form:errors path="name" element="div" cssClass="alert alert-danger"/>
        <div class="form-group row">
            <label for="IdCity" class="col-form-label col-md-1">Miasto:</label>
            <div class="col-md-6">
                <form:select path="city.id" items="${cities}" id="IdCity" itemValue="id" itemLabel="name"
                             class="form-control"/>
            </div>
        </div>
        <form:errors path="city" element="div" cssClass="alert alert-danger"/>
        <div class="form-group row">
            <label for="IdAddress" class="col-form-label col-md-1">Adres:</label>
            <div class="col-md-6">
                <form:input path="address" id="IdAddress" class="form-control"/>
            </div>
        </div>
        <form:errors path="address" element="div" cssClass="alert alert-danger"/>
        <button type="submit" class="btn btn-primary">Zapisz</button>
    </form:form>

</div>
</body>
</html>
