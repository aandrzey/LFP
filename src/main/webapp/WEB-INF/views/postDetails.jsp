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
    <title>LFP - Looking for player</title>
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/stylesheet.css" rel="stylesheet">
    <link href="/css/comment.css" rel="stylesheet">
    <script src="/js/modalDeletePost.js"></script>
</head>
<body>
<%@include file="fragments/header.jspf" %>

<div class="modal fade" id="modal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Uwaga!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <a type="button" class="btn btn-secondary" data-dismiss="modal">Cofnij</a>
                <a type="button" class="btn btn-primary ButtonModal"></a>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <header>Szczegóły ogłoszenia</header>
    <div class="row">
        <p class="col-md-3">Gra:</p>
        <p class="col-md-auto">${post.game.name}</p>
    </div>
    <div class="row">
        <p class="col-md-3">Miasto:</p>
        <p class="col-md-auto">${post.city.name}</p>
    </div>
    <div class="row">
        <p class="col-md-3">Miejsce:</p>
        <c:if test="${null == post.venue}">
        <p class="col-md-auto">${post.privateVenueName}</p></div>
    </c:if>
    <c:if test="${null != post.venue}">
    <pv class="col-md-auto">${post.venue.name}</pv>
</div>
<div class="row">
    <p class="col-md-3">Adres:</p>
    <p class="col-md-auto">${post.venue.address}</p>
</div>
</c:if>

<div class="row">
    <p class="col-md-3">Data i godzina rozpoczęcia:</p>
    <p class="col-md-auto">${post.dateStart}</p>
</div>
<div class="row">
    <p class="col-md-3">Data i godzina zakończenia:</p>
    <p class="col-md-auto">${post.dateStop}</p>
</div>
<div class="row">
    <p class="col-md-3">Typ gry</p>
    <p class="col-md-auto">${post.gameType.name}</p>
</div>
<div class="row">
    <p class="col-md-3">Użytkownik:</p>
    <p class="col-md-auto">${post.user.username}</p>
</div>
<div class="row">
    <p class="col-md-3">Data dodania:</p>
    <p class="col-md-auto">${post.created}</p>
</div>
<div class="row">
    <p class="col-md-3">Opis:</p>
    <p class="col-md-auto">${post.description}</p>
</div>

<sec:authorize access="hasRole('ADMIN')">
    <button type="button" class="btn btn-primary btn-lg deleteButtonTable" data-id="${post.id}"
            data-toggle="modal"
            data-target="#modal">Usuń post
    </button>
</sec:authorize>

<header>Wiadomości (aby dodać komentarz musisz być zalogowany)</header>


<div>
    <div class="comment-wrapper">
        <div class="panel panel-info">
            <div class="panel-body">
                <sec:authorize access="isAuthenticated()">
                    <div class="form-group">
                    <form:form modelAttribute="commentDto" method="post" action="/posts/${post.id}/comment">
                        <div>
                            <label for="idContent">Dodaj komentarz:</label>
                            <form:textarea path="content" maxlenght="300" rows="3" cols="80" id="idContent"
                                           class="form-control"/>
                        </div>
                        <form:errors path="content" element="div" cssClass="alert alert-danger"/>
                        <button type="submit" class="btn btn-primary">Zapisz</button>
                        </div>
                    </form:form>
                </sec:authorize>
                <div class="clearfix"></div>
                <div style="overflow: hidden; max-height: 600px">
                    <div style="overflow-y: scroll">
                        <ul class="media-list">
                            <c:forEach items="${post.comments}" var="comment">
                                <div class="row">
                                    <li class="media">
                                        <div class="col-md-3">
                                            <img src="/images/logo.png" alt=""
                                                 class="rounded-circle">
                                        </div>
                                        <div class="media-body col-md-auto">
                                <span class="text-muted pull-right">
                                    <small class="text-muted">${comment.created}</small>
                                </span>
                                            <strong class="text-success">${comment.user.username}</strong>
                                            <p>${comment.content}</p>
                                        </div>
                                    </li>
                                </div>
                                <br>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</div>

</body>
</html>
