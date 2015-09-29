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
<title>Editando usuário <%usuario.getNome();%></title>
</head>
<body>
	<form action="ControleUsuario" method="post">
		<!--  Tipo de ação enviada pelo usuário -->
		<input type="hidden" name="acao" value="atualizar" required>
		<input type="hidden" name="id" value="<%= usuario.getId() %>"/>
		
		Nome: <input type="text" name="nome" value="<%= usuario.getNome() %>" required="true"><br/>
		
		Login: <input type="text" name="login" value="<%= usuario.getLogin() %>" required="true"><br/>
		
		Senha: <input type="password" name="senha" value="<%= usuario.getSenha()%>" required="true"><br/>
		
		<input type="submit" value="Salvar"/>
		
	</form>
</body>
</html>