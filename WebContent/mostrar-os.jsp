<%@page import="java.util.List"%>
<%@page import="meuprojeto.model.Equipamento"%>
<%@page import="meuprojeto.model.Os"%>
<%@page import="meuprojeto.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Os os = (Os) request.getAttribute("os");
	List<Equipamento> equipamentos = (List<Equipamento>) request
			.getAttribute("equipamentos");
%>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
<title>Os <%=os.getCliente().getNome()%></title>

</head>
<body>
	<br />
	<br />
	<br />
	<br />
	<jsp:include page="partes/menu.jsp"></jsp:include>
	<div class="container">
		<div class="row">

			<div class="col-lg-4">
				<table border="1"
					class="table table-bordered table-hover table-striped">
					<tr>
						<th>Número da OS</th>
						<td><%=os.getId()%></td>
					</tr>
					<tr>
						<th>Nome</th>
						<td><%=os.getCliente().getNome()%></td>
					</tr>
					<tr>
						<th>Telefone</th>
						<td><%=os.getCliente().getTefefone()%></td>
					</tr>
					<tr>
						<th>Celular</th>
						<td><%=os.getCliente().getCelular()%></td>
					</tr>
					<tr>
						<th>Endereco</th>
						<td><%=os.getCliente().getEndereco()%></td>
					</tr>
					<tr>
						<th>Email</th>
						<td><%=os.getCliente().getEmail()%></td>
					</tr>
				</table>
			</div>

			<!-- Formulário -->
			<div class="col-lg-8">

				<div class="page-header">
					<h2>Adicionar equipamento à OS</h2>
				</div>
				<form class="form-horizontal" action="ControleOs" method="post">

					<input type="hidden" name="id_os" value="<%=os.getId()%>" /> <input
						type="hidden" name="acao" value="cadastrar-equipamento" />
					<fieldset>

						<!-- Select Basic -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="id_equipamento">Equipamento</label>
							<div class="col-md-4">
								<select id="id_equipamento" name="id_equipamento"
									class="form-control" required="true">
									<option value="">Selecione</option>
									<%
										for (Equipamento equipamento : equipamentos) {
											if (!os.getEquipamentos().contains(equipamento)) {
									%>
									<option value="<%=equipamento.getId()%>"><%=equipamento.getNome()%></option>
									<%
										}
										}
									%>
								</select>
							</div>
						</div>

						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="salvar"></label>
							<div class="col-md-4">
								<button id="salvar" name="salvar" class="btn btn-primary">Salvar</button>
							</div>
						</div>

					</fieldset>
				</form>

			</div>
		</div>

		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading panel-title text-center">Lista de
					equipamentos da Ordem de Serviço</div>

				<div class="panel-body">
					<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>Equipamento</th>
								<th>Tipo</th>
								<th>Modelo</th>
								<th>Remover</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Equipamento equipamento : os.getEquipamentos()) {
							%>
							<tr>
								<td><%=equipamento.getNome()%></td>
								<td><%=equipamento.getTipo()%></td>
								<td><%=equipamento.getModelo()%></td>
								<td>
									<form action="ControleOs" method="post">
										<input type="hidden" name="id_os" value="<%= os.getId() %>"/>
										<input type="hidden" name="id_equipamento" value="<%= equipamento.getId() %>"/>
										<input type="hidden" name="acao" value="remover-equipamento"/>
										
										<button class="btn btn-danger btn-sm" type="submit"><i class="glyphicon glyphicon-remove"></i> Remover</button>
									</form>
								</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>