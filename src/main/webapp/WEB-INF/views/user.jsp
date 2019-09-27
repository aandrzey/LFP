<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 24.09.2019
  Time: 12:26
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

    <header>Profil użytkownika</header>

    <div class="row">
        <p class="col-md-3">Username:</p>
        <p class="col-md-auto">${user.username}</p>
    </div>
    <div class="row">
        <p class="col-md-3">Email:</p>
        <p class="col-md-auto">${user.email}</p>
    </div>
    <br>
    <a class="btn btn-primary" href="/update">Edytuj dane</a>
    <a class="btn btn-primary" href="/post">Dodaj nowy post</a>
    <a class="btn btn-primary" href="/venue">Zaproponuj nowe miejsce</a>
    <br>
    <br>
    <header>Twoje ogłoszenia:</header>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Miasto</th>
            <th scope="col">Gra</th>
            <th scope="col">Miejsce</th>
            <th scope="col">Data i godzina</th>
            <th scope="col">Typ gry</th>
            <th scope="col">Użytkownik</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${user.posts}" var="post">
            <tr>
                <td>${post.city.name}</td>
                <td>${post.game.name}</td>
                <td>
                    <c:if test="${null == post.venue}">
                        ${post.privateVenueName}
                    </c:if>
                    <c:if test="${null != post.venue}">
                        ${post.venue.name}
                    </c:if>
                </td>
                <td>${post.dateStart}</td>
                <td>${post.gameType.name}</td>
                <td>${post.user.username}</td>
                <td>
                    <a type="button" class="btn btn-primary" href="/posts/${post.id}">Zobacz szczegóły</a>
                    <button type="button" class="btn btn-primary deleteButtonTable" data-id="${post.id}"
                            data-toggle="modal" data-target="#modal">Usuń post
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
