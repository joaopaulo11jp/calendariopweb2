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
    <h3 class="panel-title">Sign Up</h3>
  </div>
  <div class="panel-body">

<form method='POST' action='#' id='cadastroPanel'>
  <div class="form-group">
    <i class="fa fa-user fa-2x" id='userIcon'></i><input type="text" class="form-control" id="userLabel" placeholder="Username" name='login'>
  </div>
  <div class="form-group">
    <i class="fa fa-smile-o fa-2x" id='nameIcon'></i></i><input type="text" class="form-control" id="nameLabel" placeholder="Name" name='nomeusuario'>
  </div>
  <div class="form-group">
    <i class="fa fa-lock fa-2x" id='passIcon'></i><input type="password" class="form-control" id="passwordLabel" placeholder="Password" name='senha'>
  </div>
  <div class="form-group">
    <input type="password" class="form-control" id="confirmPasswordLabel" placeholder="Confirm your password">
  </div>
  
 <button type="submit" class="btn btn-primary" id='btnComplete'>Complete</button>
</form>

  </div>
</div>

<script>
	var n = null;
	   var conflogin = false;
	   var confsenha = false;
	   var confconfirmsenha = false;
		$("#userLabel").keyup(function(){
		  

			if(document.querySelector("#userLabel").value.length > 10){
				$("#userLabel").css("background-color","#FFA1A8");
				if(n == null) n = noty({layout:'bottom',type:'error',text: 'Login tem no máximo 10 caracteres!',theme: 'meutema'});
				conflogin = false;
			}else{
				$("#userLabel").css("background-color","#FFF");
				if(n != null) n.close();
				n = null;
				conflogin = true;
			}	
		});

		function verifQtdCarac(){ /*esta funcao verificará quantidade de caracteres do campo senha*/
			if(document.querySelector("#passwordLabel").value.length < 6){
				$("#passwordLabel").css("background-color","#FFA1A8");
				if(n == null) n = noty({layout:'bottom',type:'error',text: 'Senha deve ter no mínimo 6 caracteres!',theme: 'meutema'});
				confsenha = false
			}else{
				$("#passwordLabel").css("background-color","#FFF");
				if(n != null) n.close();
				n = null;
				confsenha = true;
			}	
		}

		function verifSenha(){
			if(document.querySelector("#passwordLabel").value != document.querySelector("#cxconfsenha").value){
				$("#confirmPasswordLabel").css("background-color","#FFA1A8");
				if(n == null) n = noty({layout:'bottom',type:'error',text: 'Senha nao confere!',theme: 'meutema'});
				confconfirmsenha = false;
			}else{
				$("#confirmPasswordLabel").css("background-color","#FFF");
				if(n != null) n.close();
				n = null;
				if(document.querySelector("#passwordLabel").value.length >= 6)
				confsenha = true;
				confconfirmsenha = true;
			}
		}

		$("#passwordLabel").focusout(function(){
			verifQtdCarac();
			$("#passwordLabel").keyup(function(){
				$("#passwordLabel").css("background-color","#FFF");
				// = 0;
			});
		});

		$("#confirmPasswordLabel").focusout(function(){
			verifSenha();
			$("#confirmPasswordLabel").keyup(function(){
				$("#confirmPasswordLabel").css("background-color","#FFF");
				   verifSenha();
				//coisaerrada = 0;
			});
		});

		$("#cadastroPanel").submit(function( event ){
			var n1
			
			if(!( (confsenha == true) && (conflogin == true) && (confconfirmsenha == true) )){
				if(n1 == null) n1 = noty({layout:'top',type:'error',text: 'Há campos pendentes!',theme: 'meutema'});
				return false;
			}else{
	
			}

		});



</script>
</body>
</html>
