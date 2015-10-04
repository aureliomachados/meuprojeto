<%@page import="meuprojeto.model.Equipamento"%>
<%@page import="meuprojeto.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Equipamento equipamento = (Equipamento) request
			.getAttribute("equipamento");
%>
<title>Usuário <%=equipamento.getNome()%></title>
</head>
<body>
	<table border="1">
		<tr>
			<th>Nome</th>
			<td><%=equipamento.getNome()%>
		</tr>
		<tr>
			<th>Modelo</th>
			<td><%=equipamento.getModelo()%>
		</tr>
		<tr>
			<th>Tipo</th>
			<td><%=equipamento.getTipo()%></td>
		</tr>
		<tr>
			<th>Valor da Diária</th>
			<td><%=equipamento.getValorDiaria()%></td>
		</tr>
		<tr>
			<th>Disponível</th>
			<td><%=(equipamento.isDisponivel()) ? "Sim" : "Não"%></td>
		</tr>
		<tr>
			<th>Quantidade</th>
			<td><%=equipamento.getQuantidade()%></td>
		</tr>
	</table>
</body>
</html>