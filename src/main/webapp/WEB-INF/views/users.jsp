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
    <script src="/js/users.js"></script>
</head>
<body>
<%@include file="fragments/header.jspf" %>

<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog"
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
                <a type="button" class="btn btn-primary deleteButtonModal">Usuń</a>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <header>Użytkownicy</header>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>
                    <c:forEach items="${user.roles}" var="role">
                        ${role.name}
                    </c:forEach>
                </td>
                <td>
                    <button type="button" data-username="${user.username}" data-id="${user.id}" class="btn btn-primary deleteButtonTable" data-toggle="modal" data-target="#modalDelete">
                        Usuń użytkownika
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>
