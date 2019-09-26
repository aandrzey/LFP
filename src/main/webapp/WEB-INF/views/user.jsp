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
    <title>Title</title>
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="fragments/header.jspf"%>

<div class="container">
    <h2>Profil użytkownika</h2>
    <p>Username: ${user.username}</p>
    <p>Email: ${user.email}</p>
    <a href="/update">Edytuj</a>
    <br><br>
    <a href="/post">Dodaj post</a>
    <br><br>
    <a href="/venue">Dodaj miejsce</a>

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
                    <a href="/posts/${post.id}">Zobacz szczegóły</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
