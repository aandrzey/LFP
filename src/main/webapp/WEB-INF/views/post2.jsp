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
        <div class="progress-bar" style="width: 66%" role="progressbar" aria-valuenow="66" aria-valuemin="0"
             aria-valuemax="100"></div>
    </div>

    <form:form modelAttribute="postVenueDto" method="post" action="/post/details">
        <div id="venue">
            <label for="idVenue">Miejsce:</label>
            <form:select path="venue.id"  id="idVenue" >
                <form:option value="" label="Wybierz miejsce"/>
                <form:options items="${venues}" itemLabel="name" itemValue="id"/>
            </form:select>
        </div>
        <form:errors path="venue" element="div" cssClass="alert alert-danger"/>
        <div id="privateVenue">
            <label for="idPrivateVenue">Własne miejsce:</label>
            <form:checkbox path="privateVenue" id="idPrivateVenue"/>
        </div>
        <form:errors path="privateVenue" element="div" cssClass="alert alert-danger"/>
        <div id="privateVenueName">
            <label for="idPrivateVenueName">Własne miejsce:</label>
            <form:input path="privateVenueName" id="idPrivateVenueName"/>
        </div>
        <form:errors path="privateVenueName" element="div" cssClass="alert alert-danger"/>
        <input type="submit" value="Dalej">
    </form:form>

</div>
<script src="/js/post2.js" type="text/javascript"></script>
</body>
</html>
