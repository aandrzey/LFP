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
    <script src="webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="fragments/header.jspf" %>
<h1>DUPA</h1>
<div class="container">
    <div class="progress">
        <div class="progress-bar" style="width: 66%" role="progressbar" aria-valuenow="66" aria-valuemin="0"
             aria-valuemax="100"></div>
    </div>

    <form:form modelAttribute="postDto" method="post" action="/post/details">
        <div>
            <label for="idVenue">Miejsce:</label>
            <form:select path="venue.id" items="${venues}" id="idVenue" itemLabel="name" itemValue="id"/>
        </div>
        <form:errors path="venue" element="div" cssClass="alert alert-danger"/>
        <input type="submit" value="Dalej">
    </form:form>

</div>

</body>
</html>
