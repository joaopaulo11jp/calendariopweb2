<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Calendário Web</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link href="css/barra.css" rel="stylesheet">
<style>
body{
		background-image:url('imgs/bgFilme.png');
	}
</style>
</head>
<body>
<c:choose>
	
   <c:when test="${not empty usuario}">
	     <%@ include file="barraUsuario.jsp" %>
   </c:when>
   <c:when test="${empty usuario}">
         <%@ include file="barraVisitante.jsp" %>
   </c:when>

</c:choose>
<br><br><br><br><br><br><br>
<div id="kalendar"></div>
${error}
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://ericwenn.se/kalendar/free/"></script>
<script>

var arrayEvents = [
<c:if test="${not empty usuario }">                   
 <c:forEach var="anotacao" items="${usuario.anotacoes}">                  
      {
	  title: "${anotacao.titulo}",
	  texto: "${anotacao.texto}",
	  start: {
	    date: '${anotacao.datastring}' , time: "0.00"
	  },
	  end: {
	    date: '${anotacao.datastring}' , time: "0.00"
	  },
	  url: "",
	  color: "blue",
	  dia: '${anotacao.dia}',
	  mes: '${anotacao.mes}',
	  ano: '${anotacao.ano}'
	},
	</c:forEach>
</c:if>	
	]
	
	
var options = { 
 	events: arrayEvents,
 	firstDayOfWeek: "Monday",
 	showDays: true,
	color:"blue",
	onDayShow: function() {
  alert("A specific day is being viewed!");
	},
	onDayClick: function(e) {
	$.each(arrayEvents, function(i,item){
		if((e.data.date.getDate() == arrayEvents[i].dia) && ((e.data.date.getMonth()+1) == arrayEvents[i].mes) && (e.data.date.getFullYear() == arrayEvents[i].ano)){
 			
 			$(".s-scheme").append("<h3><b>"+arrayEvents[i].title+"</b></h3><p>"+arrayEvents[i].texto+"<br>------------------<br>");
 		}
	});	
	},
	monthHuman: [
	             ["Jan", "Janeiro"],
	             ["Fev", "Fevereiro"],
	             ["Mar", "Março"],
	             ["Abr", "Abril"],
	             ["Mai", "Maio"],
	             ["Jun", "Junho"],
	             ["Jul", "Julho"],
	             ["Ago", "Agosto"],
	             ["Set", "Setembro"],
	             ["Out", "Outubro"],
	             ["Nov", "Novembro"],
	             ["Dez", "Dezembro"]
	           ],
	           dayHuman: [
	                      ["D", "Domingo"],
	                      ["S", "Segunda"],
	                      ["T", "Terça"],
	                      ["Q", "Quarta"],
	                      ["Q", "Quinta"],
	                      ["S", "Sexta"],
	                      ["S", "Sábado"]
	                    ]          
};

var kalendar = $('#kalendar').kalendar(options);

</script>
</body>
</html>
