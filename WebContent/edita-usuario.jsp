<%@page import="meuprojeto.model.Usuario"%>
<%@page import="meuprojeto.dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Usuario usuario = (Usuario) request.getAttribute("usuario");
%>
<title>Editando usuário <%=usuario.getNome()%></title>

<jsp:include page="partes/cabecalho.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="partes/menu.jsp"></jsp:include>


	<div class="container">

		<form class="form-horizontal" action="ControleUsuario" method="post">
			<!--  Tipo de ação enviada pelo usuário -->
			<input type="hidden" name="acao" value="atualizar"> <input
				type="hidden" name="id" value="<%=usuario.getId()%>" />
			<fieldset>

				<!-- Form Name -->
				<legend>Cadastro de usuário</legend>


				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="nome">Nome</label>
					<div class="col-md-4">
						<input id="nome" name="nome" type="text"
							placeholder="Digite seu nome" class="form-control input-md"
							required="" value="<%=usuario.getNome()%>">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="login">Login</label>
					<div class="col-md-4">
						<input id="login" name="login" type="text"
							placeholder="Digite seu login" class="form-control input-md"
							required="" value="<%=usuario.getLogin()%>">

					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="senha">Senha</label>
					<div class="col-md-4">
						<input id="senha" name="senha" type="password"
							placeholder="Digite sua senha" class="form-control input-md"
							required="" value="<%=usuario.getSenha()%>">

					</div>
				</div>

				<!-- Button (Double) -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="cadastrar"></label>
					<div class="col-md-8">
						<button type="submit" id="cadastrar" name="cadastrar"
							class="btn btn-success">Cadastrar</button>
						<a href="ControleUsuario?acao=listar" class="btn btn-warning">Cancelar</a>
					</div>
				</div>

			</fieldset>
		</form>
	</div>



</body>
</html>