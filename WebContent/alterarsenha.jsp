<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>CalendarioWeb</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style type="text/css">
	#panel{
		height: 400px;
		width: 350px;
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-175px;
		margin-top:-250px;
	}
	#btnComplete{
		margin-top: 100px;
		float:right;
	}
	#userIcon,#passIcon,#nameIcon{
		float:left;
		margin-right:10px;
	}
	#nameIcon{
		margin-right: 8px;
	}
	#passIcon{
		margin-right:13px;
	}
	#userLabel,#passwordLabel,#confirmPasswordLabel,#nameLabel{
		width:280px;
	}
	#confirmPasswordLabel{
		margin-left: 30px;
	}
	body{
		background-image:url('imgs/bgFilme.png');
	}
	#msgError{
		text-align: center;
	}
	#alertError{
		position:absolute;
		top: 75%;
		left:31.5%;
		width:500px;
	}
</style>
</head>
<body>

  <div class="panel panel-primary" id='panel'>
  <div class="panel-heading">
    <h3 class="panel-title">Alterar senha</h3>
  </div>
  <div class="panel-body">

<form method='POST' action='Calendario.do' id='cadastroPanel'>
  <div class="form-group">
    <i class="fa fa-lock fa-2x" id='passIcon'></i><input type="password" class="form-control" id="passwordLabel" placeholder="Senha atual" name='senhaAnterior'>
  </div>
  <div class="form-group">
    <i class="fa fa-lock fa-2x" id='passIcon'></i><input type="password" class="form-control" id="passwordLabel" placeholder="Nova senha" name='novaSenha'>
  </div>
 
  <input type='hidden' name='action' value='3'/>
 <button type="submit" class="btn btn-primary" id='btnComplete'>Confirmar</button>
</form>

  </div>
  <p><font color='red'><b>${error }</b></font></p>
</div>
	
<script>


</script>
</body>
</html>
