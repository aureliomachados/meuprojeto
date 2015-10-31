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
 <li><a href="ControleCliente?acao=listar">Lista de Clientes</a></li>
  <li><a href="ControleEquipamento?acao=listar">Lista de Equipamentos</a></li>
   <li><a href="ControleUsuario?acao=listar">Lista de Usuários</a></li>
    <li><a href="ControleOs?acao=listar">Lista de Ordem de Serviço</a></li>




</body>
</html>