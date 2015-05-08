<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Calendário Web</title>
<link href="css/bootstrap-datepicker.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/barra.css" rel="stylesheet">
<style>

#painel{
	height:330px;
	
}

</style>
</head>

<body>
<c:choose>
	<c:when test="${not empty usuario}">
		<%@ include file="barraUsuario.jsp" %>	
	</c:when>
	<c:when test="${empty usuario }">
		<c:redirect url='Calendario.do'></c:redirect>
	</c:when>
</c:choose>
	

	<div class="container">

		<div class="main-page">
			

			<div class="panel panel-primary" id="painel">
				<div class="panel-heading">Gerencia anotações</div>
				<div class="panel-body">
					<form action="Calendario.do" method="POST" class="form-horizontal"
						role="form">

						<div class="form-group">
							<label for="titulo" class="col-sm-2 control-label">Título:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="tituloid" name="titulo"
									/>
							</div>
						</div>

						<div class="form-group">
							<label for="texto" class="col-sm-2 control-label">Texto:</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="textoid" name="texto"
									/></textarea>	
							</div>		
						</div>
						<div class="form-group">
							<label for="texto" class="col-sm-2 control-label">Data:</label>
							<div class="col-sm-10" id='sandbox-container'>
								<div class="input-group date">
  									<input type="text"  id='datapick' class="form-control" name='data'><span class="input-group-addon"></span>
								</div>
                				</div>
							</div>
						</div>
						<input type='hidden' name='action' value='4'/>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Registrar</button>
								  	
							</div>
						</div>

					</form>

				</div>
			</div>
<h1>${error}</h1>
			<c:if test="${fn:length(usuario.anotacoes) > 0}">

				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Titulo</th>
							<th>Data</th>
							<th>Texto</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="anotacao" items="${usuario.anotacoes}">
							<tr>
								<td>${anotacao.titulo}
								</td>
								<td>${anotacao.datastringbars}</td>
								<td>${anotacao.texto}</td>
								<form action='Calendario.do' method='POST'>
								<input type='hidden' name='id' value='${anotacao.id }'/>
								<input type='hidden' name='action' value='5'/>
								<td><button type='submit'class="btn btn-primary btn-sm active" role="button"><span
										class="glyphicon glyphicon-trash"></span> Excluir</button>
								</form>		
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</c:if>

		</div>

	</div>
	<!-- /.container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>	
	<script src="js/bootstrap.js"></script>
	<script>
	$(document).ready(function () {
		$('#datapick').datepicker({
			format: "dd/mm/yyyy",
	        language: "pt-BR"
		});
	});	
	</script>
</body>
</html>