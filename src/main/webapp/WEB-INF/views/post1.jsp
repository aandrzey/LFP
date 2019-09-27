<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 24.09.2019
  Time: 14:48
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

    <div class="mh-10 jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Dodaj nowy post</h1>
            <hr class="my-4">
            <p class="lead">Krok 1/3 Wybierz miasto</p>
        </div>
    </div>
    <div class="progress">
        <div class="progress-bar-purple" style="width: 33%" role="progressbar" aria-valuenow="33" aria-valuemin="0"
             aria-valuemax="100"></div>
    </div>
    <br>
    <form:form method="post" modelAttribute="postCityDto" action="/post/venue">
        <div class="form-group row">
            <label for="idCity" class="col-sm-2 col-form-label">Miasto:</label>
            <div class="col-md-6">
                <form:select path="city.id" items="${cities}" id="idCity" itemLabel="name" itemValue="id"
                             class="form-control"/>
            </div>
        </div>
        <br>
        <button type="submit" class="btn btn-primary">Dalej</button>
    </form:form>

</div>

</body>
</html>
