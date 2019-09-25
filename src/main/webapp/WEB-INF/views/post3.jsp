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
        <div class="progress-bar" style="width: 100%" role="progressbar" aria-valuenow="100" aria-valuemin="0"
             aria-valuemax="100"></div>
    </div>

    <form:form modelAttribute="postDto" method="post" action="/post/final">
        <div>
            <label for="idGame">Gra:</label>
            <form:select path="game.id"  id="idGame" items="${games}" itemLabel="name" itemValue="id"/>
        </div>
        <form:errors path="game" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idDescription">Opis:</label>
            <form:textarea maxlength="500" rows="3" cols="80" path="description" id="idDescription"/>
        </div>
        <form:errors path="description" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idDateStart">Data rozpoczęcia:</label>
            <form:input type="date" path="dateStart" id="idDateStart"/>
        </div>
        <form:errors path="dateStart" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idTimeStart">Godzina rozpoczęcia:</label>
            <form:input type="time" path="timeStart" id="idTimeStart"/>
        </div>
        <form:errors path="timeStart" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idDateStop">Data zakończenia:</label>
            <form:input type="date" path="dateStop" id="idDateStop"/>
        </div>
        <form:errors path="dateStop" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idTimeStop">Godzina zakończenia:</label>
            <form:input type="time" path="timeStop" id="idTimeStop"/>
        </div>
        <form:errors path="timeStop" element="div" cssClass="alert alert-danger"/>
        <div>
            <label for="idGameType">Gra:</label>
            <form:select path="gameType.id"  id="idGameType" items="${gameTypes}" itemLabel="name" itemValue="id"/>
        </div>
        <form:errors path="game" element="div" cssClass="alert alert-danger"/>
        <input type="submit" value="Zapisz">
    </form:form>

</div>
</body>
</html>
