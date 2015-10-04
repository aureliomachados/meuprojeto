<%@page import="meuprojeto.model.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de usuários</title>

<jsp:include page="partes/cabecalho.jsp"></jsp:include>

<%
	List<Usuario> usuarios = (List<Usuario>) session
			.getAttribute("usuarios");
%>
</head>
<body>

	<jsp:include page="partes/menu.jsp"></jsp:include>


	<div class="container">

		<div class="page-header">
		<h1>Lista de usuários</h1>
			<a href="cadastro.jsp" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> Adicionar novo</a>
		</div>


		<table border="1"
			class="table table-bordered table-hover table-striped">
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
					<td><a
						href="ControleUsuario?acao=mostrar&id=<%=usuario.getId()%>"><%=usuario.getNome()%></a></td>
					<td><%=usuario.getLogin()%></td>
					<td><a
						href="ControleUsuario?acao=editar&id=<%=usuario.getId()%>" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i> editar</a></td>
					<td>
						<form action="ControleUsuario" method="post">
							<input type="hidden" name="acao" value="remover"> <input
								type="hidden" name="id" value="<%=usuario.getId()%>"> 
								<input type="submit" value="excluir" class="btn btn-danger">
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>
</body>
</html>