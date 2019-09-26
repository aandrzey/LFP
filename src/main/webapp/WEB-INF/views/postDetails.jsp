<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 25.09.2019
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/comment.css" rel="stylesheet">
</head>
<body>
<%@include file="fragments/header.jspf" %>
<div class="container">
    <h2 class="page-header">Szczegóły ogłoszenia</h2>
    <p>Gra: ${post.game.name}</p>
    <p>Opis: ${post.description}</p>
    <p>Miasto: ${post.city.name}</p>
    <p>Miejsce:
        <c:if test="${null == post.venue}">
            ${post.privateVenueName}</p>
        </c:if>
        <c:if test="${null != post.venue}">
            ${post.venue.name}</p>
            <p>Adres: ${post.venue.address}</p>
        </c:if>
    <p>Data i godzina rozpoczęcia: ${post.dateStart}</p>
    <p>Data i godzina zakończenia: ${post.dateStop}</p>
    <p>Typ gry ${post.gameType.name}</p>
    <p>Użytkownik: ${post.user.username}</p>
    <p>Data dodania: ${post.created}</p>

    <h2 class="page-header">Wiadomości</h2>


    <div class="row">
        <div class="col-md-6 col-md-offset-2 col-sm-12">
            <div class="comment-wrapper">
                <div class="panel panel-info">
                    <div class="panel-body">
                        <sec:authorize access="isAuthenticated()">
                            <form:form modelAttribute="commentDto" method="post" action="/posts/${post.id}/comment">
                                <div>
                                    <label for="idContent">Dodaj komentarz:</label>
                                    <form:textarea path="content" maxlenght="300" rows="3" cols="80" id="idContent"/>
                                </div>
                                <form:errors path="content" element="div" cssClass="alert alert-danger"/>
                                <input type="submit" value="Zapisz">
                            </form:form>
                        </sec:authorize>
                        <div class="clearfix"></div>
                        <hr>
                        <ul class="media-list">
                            <c:forEach items="${post.comments}" var="comment">
                                <li class="media">
                                    <a href="#" class="pull-left">
                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt=""
                                             class="rounded-circle">
                                    </a>
                                    <div class="media-body">
                                <span class="text-muted pull-right">
                                    <small class="text-muted">${comment.created}</small>
                                </span>
                                        <strong class="text-success">${comment.user.username}</strong>
                                        <p>
                                                ${comment.content}
                                        </p>
                                    </div>
                                </li>
                                <br>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


</body>
</html>
