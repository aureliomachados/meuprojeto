<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultas</title>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>
	<br></br>
	<br></br>
	<br></br>
	<jsp:include page="partes/menu.jsp"></jsp:include>
	<div class=container>
		<label class="col-md-4 control-label"></label>
		<li><a href="ControleCliente?acao=listar" class= "btn btn-success btn-lg btn-block ">Lista de Clientes</a></li>
		<br></br>
		 <label class="col-md-4 control-label"></label>
		<li><a href="ControleEquipamento?acao=listar"class= "btn btn-success btn-lg btn-block">Lista de
				Equipamentos</a></li>	
				<br></br>
				 <label class="col-md-4 control-label"></label>
		<li><a href="ControleUsuario?acao=listar"class= "btn btn-success btn-lg btn-block">Lista de Usu�rios</a></li>
		<br></br>
		 <label
			class="col-md-4 control-label"></label>
		<li><a href="ControleOs?acao=listar"class= "btn btn-success btn-lg btn-block">Lista de Ordem de
				Servi�o</a></li>
</body>
</html>