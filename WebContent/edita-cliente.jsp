<%@page import="meuprojeto.model.Cliente"%>
<%@page import="meuprojeto.model.Usuario"%>
<%@page import="meuprojeto.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Cliente cliente = (Cliente) request.getAttribute("cliente");
%>
<title>Editando cliente <%= cliente.getNome() %></title>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>
<br></br>
<br></br>
<jsp:include page="partes/menu.jsp"></jsp:include>
<div class="container">
	<form class= "form-horizontal"action="ControleCliente" method="post">
		<!--  Tipo de ação enviada pelo usuário -->
		<input type="hidden" name="acao" value="atualizar" >
		<input type="hidden" name="id" value="<%= cliente.getId() %>"/>
		<legend>Edição de Cliente</legend>


				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="nome">Nome</label>
					<div class="col-md-4">
						<input id="nome" name="nome" type="text"
							placeholder="Digite o novo equipamento" class="form-control input-md"
							required="true" value="<%=cliente.getNome()%>">

					</div>
				</div>
				


				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="telefone">Telefone</label>
					<div class="col-md-4">
						<input id="telefone" name="telefone" type="text"
							placeholder="Digite o novo telefone " class="form-control input-md"
							required="true" value="<%=cliente.getTefefone()%>">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="tipo">Celular</label>
					<div class="col-md-4">
						<input id="celular" name="celular" type="text"
							placeholder="Digite o novo celular " class="form-control input-md"
							required="true" value="<%=cliente.getCelular()%>">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="endereco">Endereço</label>
					<div class="col-md-4">
						<input id="endereco" name="endereco" type="text"
							placeholder="Digite o novo endereço " class="form-control input-md"
							required="true" value="<%=cliente.getEndereco()%>">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="quantidade">Email</label>
					<div class="col-md-4">
						<input id="email" name="email" type="text"
							placeholder="Digite o novo email " class="form-control input-md"
							required="" value="<%=cliente.getEmail()%>">

					</div>
				</div>
		
		
		
		<label class="col-md-4 control-label" ></label>
		<button type="submit" id="Cadastrar Equipamento" name="cadastrar"
							class="btn btn-success">Salvar</button>
		
		
		
	</form>
</body>
</html>