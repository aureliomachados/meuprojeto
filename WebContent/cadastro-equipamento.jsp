<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de equipamento</title>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>
<br></br>
<br></br>
<jsp:include page="partes/menu.jsp"></jsp:include>

	<div class="container">
	<form class="form-horizontal"action="ControleEquipamento" method="post">
		<!--  Tipo de ação enviada pelo usuário -->
		<input type="hidden" name="acao" value="cadastrar">
		<legend>Cadastro de Equipamentos</legend>
		
		<div class="form-group">
					<label class="col-md-4 control-label" for="nome">Nome</label>
					<div class="col-md-4">
						<input id="nome" name="nome" type="text"
							placeholder="Digite o nome do equipmento" class="form-control input-md"
							required="true">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="modelo">Modelo</label>
					<div class="col-md-4">
						<input id="nome" name="modelo" type="text"
							placeholder="Digite o modelo do equipamento" class="form-control input-md"
							required="true">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="tipo">tipo</label>
					<div class="col-md-4">
						<input id="nome" name="tipo" type="text"
							placeholder="Digite o tipo de equipamento" class="form-control input-md"
							required="true">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="valorDiaria">Valor da diária</label>
					<div class="col-md-4">
						<input id="nome" name="valorDiaria" type="text"
							placeholder="Digite o valor da diária" class="form-control input-md"
							required="true">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="quantidade">Quantidade</label>
					<div class="col-md-4">
						<input id="nome" name="quantidade" type="text"
							placeholder="Digite a quantidade de equipamentos" class="form-control input-md"
							required=<%= "int" %>>

					</div>
				</div>
				
		<label class="col-md-4 control-label" >Disponível?</label>
		
		<select name="disponivel" required>
			<option value="true">Sim</option>
			<option value="false">Não</option>
		</select><br/>
		<br/>
		<label class="col-md-4 control-label" ></label>
		<button type="submit" id="Cadastrar Equipamento" name="cadastrar"
							class="btn btn-success">Cadastrar Equipamento</button>
		
		
	</form>
	</div>
</body>
</html>