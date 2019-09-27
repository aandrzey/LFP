<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 22.09.2019
  Time: 17:24
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
    <script src="/js/chart.js"></script>


</head>
<%@include file="fragments/header.jspf" %>

<div class="container">
    <br>
    <div class="mh-10 jumbotron">
        <h1 class="display-4">Witaj na stronie LFP</h1>
        <p class="lead">Strona LFP pomoże Ci znaleźć przeciwnika do następnej rozgrywki w Twoją ulubioną grę bitweną.
            Wyszukaj posty innych graczy lub zarejestruj się i umieść ogłoszenie.</p>
        <hr class="my-4">
        <a class="btn btn-primary btn-lg" href="/posts" role="button">Zobacz posty</a>
        <a class="btn btn-primary btn-lg" href="/register" role="button">Rejestracja</a>
        <a class="btn btn-primary btn-lg" href="/login" role="button">Login</a>
    </div>
    <div>
        <div id="piechart_3d" data-chartData="${chartData}" style="width: 900px; height: 500px;"></div>
    </div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</body>
</html>
