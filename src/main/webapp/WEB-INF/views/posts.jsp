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
    <title>LFP - Looking for player</title>
    <script src="/webjars/jquery/3.0.0/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/stylesheet.css" rel="stylesheet">
    <script src="/js/posts.js"></script>
</head>
<body>
<%@include file="fragments/header.jspf" %>

<div class="container">

    <header>Aktualne ogłoszenia (domyślnie pokazywane są tylko te ogłoszenie które się jeszcze nie odbyły)</header>
    <br>

    <div class="search">
        <form method="get">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <label for="idCity">Miasto:</label>
                        <input type="text" name="city" id="idCity" value="${citySearch}" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <label for="idGame">Gra:</label>
                        <input type="text" name="game" id="idGame" value="${gameSearch}" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <label for="idDate">Data</label>
                        <input type="date" name="dateString" id="idDate" value="${dateSearch}" class="form-control">
                    </div>
                    <div class="col-md-3">
                        <label for="idGameType">Typ gry:</label>
                        <input type="text" name="gameType" id="idGameType" value="${gameTypeSearch}"
                               class="form-control">
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Wyszukaj</button>
        </form>
    </div>

    <div class="row pageSize ml-1">
        <label class="d-inline-block pt-2">Liczba elementów na stronie:</label>
        <div class="col-2">
            <form class="d-inline-block" method="get" action="/posts">
                <input type="hidden" name="pageSize" value="10">
                <input type="hidden" name="city" value="${citySearch}">
                <input type="hidden" name="game" value="${gameSearch}">
                <input type="hidden" name="dateString" value="${dateSearch}">
                <input type="hidden" name="gameType" value="${gameTypeSearch}">
                <button class="btn btn-primary">10</button>
            </form>
            <form class="d-inline-block" method="get" action="/posts">
                <input type="hidden" name="pageSize" value="50">
                <button class="btn btn-primary">50</button>
                <input type="hidden" name="city" value="${citySearch}">
                <input type="hidden" name="game" value="${gameSearch}">
                <input type="hidden" name="dateString" value="${dateSearch}">
                <input type="hidden" name="gameType" value="${gameTypeSearch}">
            </form>
            <form class="d-inline-block" method="get" action="/posts">
                <input type="hidden" name="pageSize" value="100">
                <input type="hidden" name="city" value="${citySearch}">
                <input type="hidden" name="game" value="${gameSearch}">
                <input type="hidden" name="dateString" value="${dateSearch}">
                <input type="hidden" name="gameType" value="${gameTypeSearch}">
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
            <th scope="col">Data i godzina</th>
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
                    <a type="button" class="btn btn-primary" href="/posts/${post.id}">Zobacz szczegóły</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item previous">
                <a class="page-link"
                   href="/posts?pageNumber=${currentPage-1}&city=${citySearch}&game=${gameSearch}&dateString=${dateSearch}&gameType=${gameTypeSearch}">Previous</a>
            </li>
            <c:forEach begin="1" end="${pages}" varStatus="loop">
                <c:if test="${loop.count == currentPage+1}">
                    <li class="page-item active">
                        <a class="page-link"
                           href="/posts?pageNumber=${loop.count-1}&city=${citySearch}&game=${gameSearch}&dateString=${dateSearch}&gameType=${gameTypeSearch}">${loop.count}
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${loop.count != currentPage+1}">
                    <li class="page-item">
                        <a class="page-link"
                           href="/posts?pageNumber=${loop.count-1}&city=${citySearch}&game=${gameSearch}&dateString=${dateSearch}&gameType=${gameTypeSearch}">${loop.count}</a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item next">
                <a class="page-link"
                   href="/posts?pageNumber=${currentPage+1}&city=${citySearch}&game=${gameSearch}&dateString=${dateSearch}&gameType=${gameTypeSearch}">Next</a>
            </li>
        </ul>
    </nav>
</div>

</body>
</html>
