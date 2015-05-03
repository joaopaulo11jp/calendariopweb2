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
		height: 200px;
		width: 500px;
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-250px;
		margin-top:-100px;
	}
	#btnSignIn{
		float:right;
		margin-left:10px;
	}
	#btnSignUp{
		float:right;
	}
	#userIcon,#passIcon{
		float:left;
		margin-right:10px;
	}
	#passIcon{
		margin-right:13px;
	}
	#userLabel,#passwordLabel{
		width:430px;
	}
	body{
		background-image:url('imgs/bgFilme.png');
	}
	#msgError{
		text-align: center;
	}
	#alertError{
		position:absolute;
		top: 70%;
		left:31.5%;
		width:500px;
	}
</style>
</head>
<body>

  <div class="panel panel-primary" id='panel'>
  <div class="panel-heading">
    <h3 class="panel-title">Log In</h3>
  </div>
  <div class="panel-body">

<form method='POST' action='#'>
  <div class="form-group">
    <i class="fa fa-user fa-2x" id='userIcon'></i><input type="text" class="form-control" id="userLabel" placeholder="Username" name='login'>
  </div>
  <div class="form-group">
    <i class="fa fa-lock fa-2x" id='passIcon'></i><input type="password" class="form-control" id="passwordLabel" placeholder="Password" name='senha'>
  </div>
  
 <button type="submit" class="btn btn-primary" id='btnSignIn'>Sign In</button>
 <a href="cadastro.jsp" class="btn btn-default" role="button" id='btnSignUp'>Sign Up</a>
</form>
  </div>
</div>

</body>
</html>
