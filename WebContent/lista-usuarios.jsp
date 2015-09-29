<%@page import="meuprojeto.model.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de usuários</title>
</head>
<body>

	<%
		List<Usuario> usuarios = (List<Usuario>) session
				.getAttribute("usuarios");
	%>
	
	<a href="cadastro.jsp">Adicionar novo</a><br/><br/>

	<table border="1">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Login</th>
				<th>Editar</th>
				<th>Excluir</th>
			<tr />
		</thead>
		<tbody>
			<%
				for (Usuario usuario : usuarios) {
			%>
			<tr>
				<td><a href="ControleUsuario?acao=mostrar&id=<%= usuario.getId()%>"><%=usuario.getNome()%></a></td>
				<td><%=usuario.getLogin() %></td>
				<td><a href="ControleUsuario?acao=editar&id=<%= usuario.getId()%>">editar</a></td>
				<td>
					<form action="ControleUsuario" method="post">
						<input type="hidden" name="acao" value="remover">
						<input type="hidden" name="id" value="<%= usuario.getId()%>">
						
						<input type="submit" value="excluir">
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>