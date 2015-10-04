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
</head>
<body>
	<form action="ControleEquipamento" method="post">
		<!--  Tipo de ação enviada pelo usuário -->
		<input type="hidden" name="acao" value="atualizar" >
		<input type="hidden" name="id" value="<%= equipamento.getId() %>"/>
		
		Nome: <input type="text" name="nome" value="<%=equipamento.getNome() %>" required="true"><br/>
		Modelo: <input type="text" name="modelo" value="<%=equipamento.getModelo()%>" required="true"><br/>
		Tipo: <input type="text" name="tipo" value="<%= equipamento.getTipo() %>" required="true"><br/>
		Valor da diária <input type="text" value="<%= equipamento.getValorDiaria()%>" name="valorDiaria" required="true"><br/>
		Quantidade <input type="text" name="quantidade" value="<%=equipamento.getQuantidade() %>" required="true"><br/>
		Disponível?
		<select name="disponivel">
			<option value="true" <%= (equipamento.isDisponivel())? "selected='selected'" : "" %>>Sim</option>
			<option value="false" <%= (equipamento.isDisponivel())? "" : "selected='selected'" %>>Não</option>
		</select><br/>
		<br/>
		<input type="submit" value="Salvar"/>
		
	</form>
</body>
</html>