<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
    <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Нов студент</title>
    <script src="<c:url value="/resources/js/jquery-2.2.4.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js" />"></script>
</head>
<body>
<div id="wrapper">
    <div id="header">
        <h1>Система за обработка на студентски молби</h1>
    </div>
    <div id="menu">
        <nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="<c:url value="/employee" />"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<c:url value="/employee" />">Информация</a></li>
						<li><a href="<c:url value="/employee/chooseRequestsToProcess" />">Класиране</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Избери<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value="/employee/selectRequests" />">Молби</a></li>
								<li><a href="<c:url value="/employee/showStudents" />">Студенти</a></li>
								<li><a href="<c:url value="/employee/showCourses" />">Дисциплини</a></li>
								<li><a href="<c:url value="/employee/showModules" />">Модули</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="<c:url value="/employee/writeInformationMessage" />">Съобщение</a></li>
							</ul>
						</li>
						<li><a href="<c:url value="/employee/settings" />">Настройки</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<form class="navbar-form" action="/app/logout" method="post">
							<button class="btn btn-default navbar-right" type="submit">Изход</button>
						</form>
					</ul>
				</div>
			</div>
		</nav>
    </div>
    <div id="textbox">
		<form action="/app/employee/createStudentRecord" method="post" class="form-horizontal">	
			<div class="form-group">
			    <label class="col-sm-4 control-label">Факултетен номер:</label>
			    <div class="col-sm-4">
					<label class="col-sm-4 control-label"><c:out value="${param.facultyNumber}"/></label>
			    </div>
			</div>
			<div class="form-group">
			    <label for="firstName" class="col-sm-4 control-label">Име:</label>
			    <div class="col-sm-4">
					<input type="text" class="form-control" name="firstName" id="firstName" required>
			    </div>
			</div>
			<div class="form-group">
				<label for="lastName" class="col-sm-4 control-label">Фамилия:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="lastName" id="lastName" required>
				</div>
			</div>
			<div class="form-group">
				<label for="currentSemester" class="col-sm-4 control-label">Семестър:</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" name="currentSemester" id="currentSemester" min="1" max="8" required>
				</div>
			</div>
			<div class="form-group">
				<label for="gpa" class="col-sm-4 control-label">Успех:</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" name="gpa" id="gpa" min="2" max="6" step="0.01" required>
				</div>
			</div>
			<div class="form-group">
				<label for="group" class="col-sm-4 control-label">Група:</label>
				<div class="col-sm-4">
					<input type="number" class="form-control" name="group" id="group" min="1" max="999" required>
				</div>
			</div>
			<div class="form-group">
				<label for="module" class="col-sm-4 control-label">Модул:</label>
				<div class="col-sm-4">
					<select class="form-control" name="module" id="module" required>
						<option value="noModule"></option>
						<c:forEach var="module" items="${modules}">
							<option value="${module.name}">
								<c:out value="${module.fullName}"/>
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-4 control-label">Поща:</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" name="email" id="email" required>
				</div>
			</div>
			<div class="form-group">
		    	<div class="col-sm-offset-4 col-sm-2">
		    		<input type="hidden" name="facultyNumber" value="${param.facultyNumber}" required>
		      		<button type="submit" class="btn btn-success btn-block">Добави</button>
		    	</div>
		  	</div>
		</form>
		<c:if test="${message == 'InvalidDataEntered'}">
			<div class="alert alert-warning" role="alert">
				Бяха въведени невалидни данни.
			</div>
		</c:if>
    </div>
    <div id="footer">
        <hr>
        Copyright © 2016 Metodi Metodiev&nbsp;&nbsp;&nbsp;All Rights Reserved
    </div>
</div>
</body>
</html>