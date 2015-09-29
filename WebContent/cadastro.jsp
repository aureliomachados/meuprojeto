<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de usuário</title>
</head>
<body>
	<form action="ControleUsuario" method="post">
		<!--  Tipo de ação enviada pelo usuário -->
		<input type="hidden" name="acao" value="cadastrar">
		
		Nome: <input type="text" name="nome" required="true"><br/>
		Login: <input type="text" name="login" required="true"><br/>
		Senha: <input type="password" name="senha" required="true"><br/>
		
		<input type="submit" value="Cadastrar usuário"/>
		
	</form>
</body>
</html>