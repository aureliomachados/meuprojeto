<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro OS </title>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>
<br></br>
<br></br>
<jsp:include page="partes/menu.jsp"></jsp:include>

	<div class="container">
	<form class="form-horizontal"action="ControleOs" method="post">
		<!--  Tipo de a��o enviada pelo usu�rio -->
		<input type="hidden" name="acao" value="cadastrar">
		<legend> OS</legend>
		
		<div class="form-group">
					<label class="col-md-2 control-label" for="nome">Nome</label>
					<div class="col-md-4">
						<input id="nome" name="nome" type="text"
							placeholder="Digite o nome do cliente" class="form-control input-md"
							required="true">

					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-7 control-label" for="telefone">Telefone</label>
					<div class="col-md-4">
						<input id="telefone" name="telefone" type="text"
							placeholder="Digite o telefone" class="form-control input-md"
							required="true">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="celular">Celular</label>
					<div class="col-md-4">
						<input id="celular" name="celular" type="text"
							placeholder="Digite o celular" class="form-control input-md"
							required="true">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-7 control-label" for="endereco">Endere�o</label>
					<div class="col-md-4">
						<input id="endereco" name="endereco" type="text"
							placeholder="Digite o endere�o" class="form-control input-md"
							required="true">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label" for="email">Email</label>
					<div class="col-md-4">
						<input id="email" name="email" type="text"
							placeholder="Digite o email" class="form-control input-md"
							required=<%= "int" %>>

					</div>
				</div>
				<legend></legend>
				<div class="form-group">
					<label class="col-md-4 control-label"   for="equipamentos">Equipamentos</label>
					<div class="col-md-10">
					
						<input id="equipamentos" name="equipamentos" type="text"
							placeholder="Equipamentos" class="form-control input-md"
							required=<%= "int" %>>

					</div>
				</div>
				
		<a href="ControleEquipamento?acao=listar">Lista de Equipamentos</a>
		<br/>
		<label class="col-md-4 control-label" ></label>
		<button type="submit" id="Cadastrar Os" name="cadastrar"
							class="btn btn-success">Salvar</button>
		
		
	</form>
	</div>
</body>
</html>