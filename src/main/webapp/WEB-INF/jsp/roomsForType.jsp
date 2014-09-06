<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<table class="table table-bordered">
	<c:forEach var="room" items="${rooms}">
		<tr>
			<td>${room.number}</td>
			<td>${room.typeRoom.name}</td>
            <td><input type="checkbox" name="roomId" value="${room.id}"/></td>
		</tr>
	</c:forEach>
	</table>
