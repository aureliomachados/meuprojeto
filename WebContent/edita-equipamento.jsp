<%@page import="meuprojeto.model.Equipamento"%>
<%@page import="meuprojeto.model.Usuario"%>
<%@page import="meuprojeto.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Equipamento equipamento = (Equipamento) request.getAttribute("equipamento");
%>
<title>Editando equipamento <%= equipamento.getNome() %></title>
<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>
<br></br>
<br></br>
<jsp:include page="partes/menu.jsp"></jsp:include>
<div class="container">
	<form class= "form-horizontal"action="ControleEquipamento" method="post">
		<!--  Tipo de ação enviada pelo usuário -->
		<input type="hidden" name="acao" value="atualizar" >
		<input type="hidden" name="id" value="<%= equipamento.getId() %>"/>
		<legend>Edição de Equipamento</legend>


				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="nome">Nome</label>
					<div class="col-md-4">
						<input id="nome" name="nome" type="text"
							placeholder="Digite o novo equipamento" class="form-control input-md"
							required="true" value="<%=equipamento.getNome()%>">

					</div>
				</div>
				


				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="modelo">Modelo</label>
					<div class="col-md-4">
						<input id="modelo" name="modelo" type="text"
							placeholder="Digite o novo modelo " class="form-control input-md"
							required="true" value="<%=equipamento.getModelo()%>">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="tipo">Tipo</label>
					<div class="col-md-4">
						<input id="tipo" name="tipo" type="text"
							placeholder="Digite o novo tipo " class="form-control input-md"
							required="true" value="<%=equipamento.getTipo()%>">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="valorDiaria">Valor da diária</label>
					<div class="col-md-4">
						<input id="valorDiaria" name="valorDiaria" type="text"
							placeholder="Digite o novo valor " class="form-control input-md"
							required="true" value="<%=equipamento.getValorDiaria()%>">

					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="quantidade">Quantidade</label>
					<div class="col-md-4">
						<input id="quantidade" name="quantidade" type="text"
							placeholder="Digite a nova quantidade " class="form-control input-md"
							required="" value="<%=equipamento.getQuantidade()%>">

					</div>
				</div>
		
		
		<label class="col-md-4 control-label" >Disponível?</label>
		
		<select name="disponivel">
			<option value="true" <%= (equipamento.isDisponivel())? "selected='selected'" : "" %>>Sim</option>
			<option value="false" <%= (equipamento.isDisponivel())? "" : "selected='selected'" %>>Não</option>
		</select><br/>
		<br/>
		<label class="col-md-4 control-label" ></label>
		<button type="submit" id="Cadastrar Equipamento" name="cadastrar"
							class="btn btn-success">Salvar</button>
		
		
		
	</form>
</body>
</html>