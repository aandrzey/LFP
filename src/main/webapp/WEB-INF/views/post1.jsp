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
    <title>Title</title>
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="fragments/header.jspf" %>
<div class="container">
    <div class="progress">
        <div class="progress-bar" style="width: 33%" role="progressbar" aria-valuenow="33" aria-valuemin="0"
             aria-valuemax="100"></div>
    </div>

    <form:form method="post" modelAttribute="postCityDto" action="/post/venue">
        <div>
            <label for="idCity">Miasto:</label>
            <form:select  path="city.id" items="${cities}" id="idCity" itemLabel="name" itemValue="id"/>
        </div>
        <input type="submit" value="Dalej">
    </form:form>

</div>

</body>
</html>
