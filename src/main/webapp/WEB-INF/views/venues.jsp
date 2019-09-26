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
    <script src="/js/venues.js"></script>
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

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Miejsca</h1>
            <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
        </div>
    </div>

    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link <c:if test="${verified != true}">active</c:if>" href="/admin/venues/toVerify">Do weryfikacji</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <c:if test="${verified == true}">active</c:if>" href="/admin/venues/verified">Zweryfikowane</a>
        </li>
    </ul>

    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Nazwa</th>
            <th scope="col">Miasto</th>
            <th scope="col">Adres</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${venues}" var="venue" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${venue.name}</td>
                <td>${venue.city.name}</td>
                <td>${venue.address}</td>
                <td>
                    <c:if test="${venue.verified == false}">
                        <button type="button" data-name="${venue.name}" data-id="${venue.id}" class="btn btn-primary verifyButtonTable" data-toggle="modal" data-target="#modal">
                            Zweryfikuj miejsce
                        </button>
                    </c:if>
                    <button type="button" data-name="${venue.name}" data-id="${venue.id}" class="btn btn-primary deleteButtonTable" data-toggle="modal" data-target="#modal">
                        Usuń miejsce
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>
