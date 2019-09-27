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
            <p class="lead">Krok 3/3 Zdefiniuj szczegóły posta</p>
            <p>Wybierz grę oraz datę kiedy chciałbyś zagrać, a także podaj typ rozgrywki (luźna gra, competitive lub
                turniej)</p>
        </div>
    </div>

    <div class="progress">
        <div class="progress-bar-purple" style="width: 100%" role="progressbar" aria-valuenow="100" aria-valuemin="0"
             aria-valuemax="100"></div>
    </div>
    <br>

    <form:form modelAttribute="postDto" method="post" action="/post/final">
        <div class="form-row">
            <div class="form-group col-md-3">
                <div>
                    <label for="idGame">Gra:</label>
                    <form:select path="game.id" id="idGame" items="${games}" itemLabel="name" itemValue="id"
                                 class="form-control"/>
                </div>
            </div>
            <form:errors path="game" element="div" cssClass="alert alert-danger"/>
            <div class="form-group col-md-3">
                <div>
                    <label for="idGameType">Gra:</label>
                    <form:select path="gameType.id" id="idGameType" items="${gameTypes}" itemLabel="name"
                                 itemValue="id" class="form-control"/>
                </div>
            </div>
            <form:errors path="game" element="div" cssClass="alert alert-danger"/>
        </div>
        <div class="form-row">
            <div class="form-group col-md-3">
                <div>
                    <label for="idDateStart">Data rozpoczęcia:</label>
                    <form:input type="date" path="dateStart" id="idDateStart" class="form-control"/>
                </div>
            </div>
            <form:errors path="dateStart" element="div" cssClass="alert alert-danger"/>
            <div class="form-group col-md-3">
                <div>
                    <label for="idTimeStart">Godzina rozpoczęcia:</label>
                    <form:input type="time" path="timeStart" id="idTimeStart" class="form-control"/>
                </div>
            </div>
            <form:errors path="timeStart" element="div" cssClass="alert alert-danger"/>
            <div class="form-group col-md-3">
                <div>
                    <label for="idDateStop">Data zakończenia:</label>
                    <form:input type="date" path="dateStop" id="idDateStop" class="form-control"/>
                </div>
            </div>
            <form:errors path="dateStop" element="div" cssClass="alert alert-danger"/>
            <div class="form-group col-md-3">
                <div>
                    <label for="idTimeStop">Godzina zakończenia:</label>
                    <form:input type="time" path="timeStop" id="idTimeStop" class="form-control"/>
                </div>
            </div>
            <form:errors path="timeStop" element="div" cssClass="alert alert-danger"/>
        </div>
        <div>
            <label for="idDescription">Opis:</label>
            <form:textarea maxlength="500" rows="3" cols="80" path="description" id="idDescription"
                           class="form-control"/>
        </div>
        <form:errors path="description" element="div" cssClass="alert alert-danger"/>


        <br>
        <button type="submit" class="btn btn-primary">Zapisz</button>
    </form:form>

</div>
</body>
</html>
