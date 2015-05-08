<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="Calendario.do">
     	CalendárioWeb
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
	
    

       
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${usuario.nome } <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="Calendario.do?gerenciaanotacoes=do">Gerenciar anotações</a></li>
            <li><a href="Calendario.do?mudasenha=do">Mudar senha</a></li>
            <li><a href="Calendario.do?exclui=do">Excluir-se</a></li>
            
            <li class="divider"></li>
            <li><a href="Calendario.do?logout=true">Log Out</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>