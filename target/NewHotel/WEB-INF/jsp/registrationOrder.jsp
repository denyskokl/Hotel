<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Test</title>
    <link href="${pageContext.request.contextPath}/resources/css/style.css"  rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/test.js"> </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mousewheel.js"> </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/will_pickdate.js"> </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(function(){
            $('.date').will_pickdate({
                format: 'j-m-Y',
                inputOutputFormat: 'Y-m-d H:i:s',
                days: ['Понедельник', 'Вторник', 'Среда', 'Четверг','Пятница', 'Суббота', 'Воскресенье'],
                months: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
                timePicker: false,
                militaryTime: true,
                allowEmpty:true ,
                yearsPerPage:3
            });
        });
    function chooseRoomType(){
        var typeRoom = $("#typeRoom").val();
        $.post(
                "roomsForType.do",
                {typeRoomId:typeRoom},
                function(data){
                    $("#rooms").html(data)
                }
        );
    }

    </script>
</head>
<body>
    <ul class="nav nav-pills">
        <li><a href="serviceType.do">Service Type</a></li>
        <li><a href="typeRoom.do">Room Type</a></li>
        <li><a href="customers.do">Customers</a></li>
        <li><a href="orders.do">Orders</a></li>
        <li><a href="rooms.do">Rooms</a></li>
    </ul>
    <form action = "registrationOrder.do" class="form-horizontal" method = "post">
        <div class="form-group">
            <label for="inputSurname" class="col-sm-2 control-label">Surname</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputSurname" placeholder="Surname" name="surname">
            </div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputName" placeholder="Name" name="name">
            </div>
        </div>
        <div class="form-group">
            <label for="inputMiddlename" class="col-sm-2 control-label">Middlename</label>
            <div class="col-sm-10">
                <input type="text"  class="form-control" id="inputMiddlename" placeholder="Middlename" name="middlename">
            </div>
        </div>
        <div class="form-group">
            <label for="undefined_display1" class="col-sm-2 control-label">Data-Arrival</label>
            <div class="col-sm-10">
                <input type="text" size="40" style="display: inline-block;" class = "date" id="undefined_display1" name="dataArrival"/>
                <input type="text" size="40" style="display: none;"/>
            </div>
        </div>
        <div class="form-group">
            <label for="undefined_display2" class="col-sm-2 control-label">Data-Departure</label>
            <div class="col-sm-10">
                <input type="text" size="40" style="display: inline-block;" class = "date" id="undefined_display2" name="dataDeparture"/>
                <input type="text" size="40" style="display: none;"/>
            </div>
        </div>
        <div class="form-group">
            <label for="undefined_display3" class="col-sm-2 control-label">Data-Order</label>
            <div class="col-sm-10">
                <input type="text" size="40" style="display: inline-block;" class = "date" id="undefined_display3" name="dataOrder"/>
                <input type="text" size="40" style="display: none;"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Room type</label>
            <div class="btn-group">
                <select class="dropdown-submenu" id="typeRoom" onchange="chooseRoomType();">
                    <c:forEach items="${typeRoom}" var="room">
                        <option name="idRoom" value="${room.id}">${room.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div id="rooms"></div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Save</button>
            </div>
        </div>
    </form>

</body>
</html>