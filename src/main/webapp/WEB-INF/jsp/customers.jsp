<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Готель</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <ul class="nav nav-pills">
        <li><a href="serviceType.do">Service Type</a></li>
        <li><a href="typeRoom.do">Room Type</a></li>
        <li><a href="customers.do">Customers</a></li>
        <li><a href="orders.do">Orders</a></li>
        <li><a href="rooms.do">Rooms</a></li>
    </ul>
	<table class="table table-bordered">
        <c:forEach var="customers" items="${customerss}">
            <tr>
                <td>${customers.name}</td>
                <td>${customers.surname}</td>
                <td>${customers.middlename}</td>
                <td>${customers.numberCard}</td>
                <td>${customers.typeCard}</td>
                <td>${customers.bonusCard}</td>
            </tr>
        </c:forEach>
	</table>
</body>
</html>