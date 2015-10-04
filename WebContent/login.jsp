<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Efetuar login</title>

<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>

<jsp:include page="partes/menu.jsp"></jsp:include>

<form action="AutenticarUsuario" method="post">
	Login: <input type="text" name="login" required="true"><br/>
	Senha: <input type="password" name="senha" required="true"><br/>
	<input type="submit" value="Efetuar login">
</form>
</body>
</html>