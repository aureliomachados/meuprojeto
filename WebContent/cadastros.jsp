<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastros</title>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="partes/menu.jsp"></jsp:include>
	<br></br>
	<br></br>
	<br></br>
	<br></br>		
	<div class=container>
		<label class="col-md-4 control-label"></label>
		<li><a href="cadastro-cliente.jsp" class="btn btn-success  btn-lg btn-block">Cadastro
				de clientes</a></li>
				<br>
				<br> <label class="col-md-4 control-label"></label>
		<li><a href="cadastro-equipamento.jsp" class="btn btn-success btn-lg btn-block">Cadastro
				de equipamentos</a></li>
				<br>
				<br>
				 <label class="col-md-4 control-label"></label>
		<li><a href="cadastro.jsp" class="btn btn-success btn-lg btn-block">Cadastro
				de usuário</a></li>
	</div>
</body>
</html>