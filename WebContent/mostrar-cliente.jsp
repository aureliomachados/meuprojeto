<%@page import="meuprojeto.model.Os"%>
<%@page import="meuprojeto.model.Cliente"%>
<%@page import="meuprojeto.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Cliente cliente = (Cliente) request.getAttribute("clientes");
%>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
<title>Usuário <%=cliente.getNome()%></title>

</head>
<body>
	<br></br>
	<br></br>

	<jsp:include page="partes/menu.jsp"></jsp:include>
	<div class="container">

		<div class="page-header">
			<h1>Cliente</h1>
		</div>

		<div class="row">

			<div class="col-md-5">
				<div class="page-header">
					<h2>Informações do cliente</h2>
				</div>

				<table border="1"
					class="table table-bordered table-hover table-striped">
					<tr>
						<th>Nome</th>
						<td><%=cliente.getNome()%>
					</tr>
					<tr>
						<th>Telefone</th>
						<td><%=cliente.getTefefone()%>
					</tr>
					<th>Celular</th>
					<td><%=cliente.getCelular()%>
					</tr>
					<th>Endereco</th>
					<td><%=cliente.getEndereco()%>
					</tr>
					<th>Email</th>
					<td><%=cliente.getEmail()%>
					</tr>
				</table>
			</div>

			<div class="col-md-7">

				<div class="page-header">
					<h2>
						Os do cliente
						<%=cliente.getNome()%></h2>
				</div>
				
				<form action="ControleOs" method="post">
					<input type="hidden" name="cliente_id" value="<%=cliente.getId() %>"/>
					<input type="hidden" name="acao" value="cadastrar"/>
					
					<button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Adicionar nova OS</button>
				</form>
				<br/>
				
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th>Número</th>
							<th>Id</th>
						</tr>
					</thead>
					<tbody>
						<% for(Os os : cliente.getOs()){%>
							<tr>
								<td><%= os.getId() %></td>
								<td><a href="ControleOs?acao=mostrar&id=<%= os.getId() %>"><%= os.getId() %></a></td>
							</tr>
						<%} %>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>