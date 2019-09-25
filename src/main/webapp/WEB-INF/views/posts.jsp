<%--
  Created by IntelliJ IDEA.
  User: andrzej
  Date: 24.09.2019
  Time: 13:24
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
    <div class="search">
        <form method="get" >
            <div>
                <label for="idCity">Miasto:</label>
                <input type="text" name="city" id="idCity">
            </div>
            <div>
                <label for="idGame">Gra:</label>
                <input type="text" name="game" id="idGame">
            </div>
            <div>
                <label for="idVenue">Miejsce:</label>
                <input type="text" name="venue" id="idVenue">
            </div>
            <div>
                <label for="idDate">Data:</label>
                <input type="date" name="dateString" id="idDate">
            </div>
            <div>
                <label for="idGameType">Typ gry:</label>
                <input type="text" name="gameType" id="idGameType">
            </div>
            <input type="submit" value="Wyszukaj">
        </form>
    </div>

    <div class="row pageSize">
        <label class="d-inline-block">Liczba elementów na stronie:</label>
        <div class="col-2">
        <form class="d-inline-block" method="get" action="/posts/pageSize">
            <input type="hidden" name="pageSize" value="10">
            <button class="btn btn-primary">10</button>
        </form>
        <form class="d-inline-block" method="get" action="/posts/pageSize">
            <input type="hidden" name="pageSize" value="50">
            <button class="btn btn-primary">50</button>
        </form>
        <form class="d-inline-block" method="get" action="/posts/pageSize">
            <input type="hidden" name="pageSize" value="100">
            <button class="btn btn-primary">100</button>
        </form>
        </div>
    </div>

    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Miasto</th>
            <th scope="col">Gra</th>
            <th scope="col">Miejsce</th>
            <th scope="col">Data</th>
            <th scope="col">Typ gry</th>
            <th scope="col">Użytkownik</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${posts}" var="post">
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
                    <a href="/post/${post.id}">Zobacz szczegóły</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active">
                <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
            </li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</div>

</body>
</html>
