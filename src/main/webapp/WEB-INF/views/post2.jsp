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
            <p class="lead">Krok 2/3 Wybierz miejsce</p>
            <p>Wybierz miejsce publicznie dostępne z listy (sklepy, kawiarnie, kluby) lub zaznacz opcje miejsca
                prywatnego i je określ (np. dom, prywatny klub).</p>
        </div>
    </div>
    <div class="progress">
        <div class="progress-bar-purple" style="width: 66%" role="progressbar" aria-valuenow="66" aria-valuemin="0"
             aria-valuemax="100"></div>
    </div>
    <br>

    <form:form modelAttribute="postVenueDto" method="post" action="/post/details">
        <div class="form-group">
            <div class="form-row">
                <div id="venue" class="form-group col-md-6">
                    <label for="idVenue">Miejsce:</label>
                    <form:select path="venue.id" id="idVenue" class="form-control">
                        <form:option value="" label="Wybierz miejsce"/>
                        <form:options items="${venues}" itemLabel="name" itemValue="id"/>
                    </form:select>
                </div>
            </div>
            <form:errors path="venue" element="div" cssClass="alert alert-danger"/>
        </div>
        <div class="form-group">
            <div class="form-check" id="privateVenue">
                <form:checkbox path="privateVenue" id="idPrivateVenue" class="form-check-input"/>
                <label for="idPrivateVenue" class="form-check-label">Miejsce prywatne</label>
            </div>
            <form:errors path="privateVenue" element="div" cssClass="alert alert-danger"/>
        </div>
        <div class="form-group">
            <div id="privateVenueName">
                <label for="idPrivateVenueName">Nazwa miejsca prywatnego:</label>
                <form:input path="privateVenueName" id="idPrivateVenueName" class="form-control"/>
            </div>
            <form:errors path="privateVenueName" element="div" cssClass="alert alert-danger"/>
        </div>
        <br>
        <button type="submit" class="btn btn-primary">Dalej</button>

    </form:form>

</div>
<script src="/js/post2.js" type="text/javascript"></script>
</body>
</html>
