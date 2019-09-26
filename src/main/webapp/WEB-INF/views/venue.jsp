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
    <title>Title</title>
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="fragments/header.jspf"%>

<div class="container">
    <form:form modelAttribute="venueDto" method="post">
        <div>
            <label for="IdName">Nazwa:</label>
            <form:input path="name" id="IdName"/>
        </div>
        <form:errors path="name" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="IdCity">Miasto:</label>
            <form:select path="city.id" items="${cities}" id="IdCity" itemValue="id" itemLabel="name"/>
        </div>
        <form:errors path="city" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="IdAddress">Adres:</label>
            <form:input path="address" id="IdAddress"/>
        </div>
        <form:errors path="address" element="div" cssClass="alert alert-danger"/>
        <input type="submit" value="Zapisz">
    </form:form>

</div>
</body>
</html>
