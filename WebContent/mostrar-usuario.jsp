<%@page import="meuprojeto.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Usuario usuario = (Usuario) request.getAttribute("usuario");
%>
<title>Usuário <%=usuario.getNome()%></title>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>
<br></br>
<br></br>
	<jsp:include page="partes/menu.jsp"></jsp:include>
	<legend>Usuário</legend>
	<div class="container">

		<div class="page-header">
	<table border="1"class="table table-bordered table-hover table-striped">
		<tr>
			<th>Nome</th>
			<td><%=usuario.getNome()%>
		</tr>
		<tr>
			<th>Login</th>
			<td><%=usuario.getLogin()%>
		</tr>
	</table>
</body>
</html>