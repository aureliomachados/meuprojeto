<%@page import="meuprojeto.model.Os" %>
<%@page import="meuprojeto.model.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Os</title>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>
<br></br>
	<jsp:include page="partes/menu.jsp"></jsp:include>
	<%
		List<Os> oss = (List<Os>) session
				.getAttribute("os");
	%>
	<div class="container">

		<div class="page-header">
			<h1>Lista de Os</h1>
			<a href="cadastro-os.jsp" class="btn btn-success"><i
				class="glyphicon glyphicon-plus"></i> Adicionar novo</a>
		</div>

		<br /> <br />

		<%
			Object mensagem = request.getAttribute("mensagem");

			if (mensagem != null) {
				out.println(mensagem);
			}
		%>

		<table border="1"
		class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Telefone</th>
					<th>Celular</th>
					<th>Endereco</th>
					<th>Email</th>
					<th>Equipamentos</th>
					<th>Editar</th>
					<th>Excluir</th>
				<tr />
			</thead>
			<tbody>
				<%
					for (Os os : oss) {
				%>
				<tr>
					<td><a
						href="ControleOs?acao=mostrar&id=<%=os.getId()%>"><%=os.getNome()%></a></td>
					<td><%=os.getTefefone()%></td>
					<td><%=os.getCelular()%></td>
					<td><%=os.getEndereco()%></td>
					<td><%=os.getEmail()%></td>
					<td><%=os.getEquipamentos()%></td>

					<td><a
						href="ControleOs?acao=editar&id=<%=os.getId()%>"
						class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i>
							editar</a></td>

					<td>
						<form action="ControleOs" method="post">
							<input type="hidden" name="acao" value="remover"> <input
								type="hidden" name="id" value="<%=os.getId()%>"> <input
								type="submit" value="excluir" class="btn btn-danger">
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