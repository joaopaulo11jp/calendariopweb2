<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<title>Calend�rio Web</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<style>
.navbar-default {
  background-color: #051b79;
  border-color: #067cd1;
}
.navbar-default .navbar-brand {
  color: #ecf0f1;
}
.navbar-default .navbar-brand:hover, .navbar-default .navbar-brand:focus {
  color: #ddd0eb;
}
.navbar-default .navbar-text {
  color: #ecf0f1;
}
.navbar-default .navbar-nav > li > a {
  color: #ecf0f1;
}
.navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
  color: #ddd0eb;
}
.navbar-default .navbar-nav > li > .dropdown-menu {
  background-color: #051b79;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a {
  color: #ecf0f1;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:hover,
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:focus {
  color: #ddd0eb;
  background-color: #067cd1;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > .divider {
  background-color: #051b79;
}
.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus {
  color: #ddd0eb;
  background-color: #067cd1;
}
.navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:hover, .navbar-default .navbar-nav > .open > a:focus {
  color: #ddd0eb;
  background-color: #067cd1;
}
.navbar-default .navbar-toggle {
  border-color: #067cd1;
}
.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {
  background-color: #067cd1;
}
.navbar-default .navbar-toggle .icon-bar {
  background-color: #ecf0f1;
}
.navbar-default .navbar-collapse,
.navbar-default .navbar-form {
  border-color: #ecf0f1;
}
.navbar-default .navbar-link {
  color: #ecf0f1;
}
.navbar-default .navbar-link:hover {
  color: #ddd0eb;
}

@media (max-width: 767px) {
  .navbar-default .navbar-nav .open .dropdown-menu > li > a {
    color: #ecf0f1;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #ddd0eb;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #ddd0eb;
    background-color: #067cd1;
  }
}
</style>

</head>
<body>
<c:choose>
   <c:when test="${empty sessionScope.usuario }">
         <%@ include file="barraVisitante.jsp" %>
   </c:when>

	<c:when test="${not empty sessionScope.usuario }">
		<%@ include file="barraUsuario.jsp" %>
	</c:when>
</c:choose>

<div id="kalendar"></div>

<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://ericwenn.se/kalendar/free/"></script>
<script>
var arrayEvents = [{
  title: "Olympics",
  location: "Sochi",
  start: {
    date: "20150515", time: "17.00"
  },
  end: {
    date: "20150520", time: "17.00"
  },
  url: "http://www.sochi2014.com",
  color: "yellow"
}]
var options = { 
 	events: arrayEvents,
 	firstDayOfWeek: "Monday",
 	showDays: true,
	color:"blue",
	onDayShow: function() {
  alert("A specific day is being viewed!");
	},
	onDayClick: function(e) {
  alert("The Date Object "
        + e.data.date.getFullYear() + " and it’s "
        + e.data.info);
}
};

var kalendar = $('#kalendar').kalendar(options);

</script>
</body>
</html>
