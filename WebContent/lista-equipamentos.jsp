<%@page import="meuprojeto.model.Equipamento"%>
<%@page import="meuprojeto.model.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de equipamentos</title>
</head>
<body>

	<%
		List<Equipamento> equipamentos = (List<Equipamento>) session
				.getAttribute("equipamentos");
	%>

	<a href="cadastro-equipamento.jsp">Adicionar novo</a>
	<br />
	<br />
	
	<%
	Object mensagem = request.getAttribute("mensagem");
	
	if(mensagem != null){
		out.println(mensagem);
	}
	%>

	<table border="1">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Modelo</th>
				<th>Valor da diária</th>
				<th>Quantidade</th>
				<th>Disponível</th>
				<th>Tipo</th>
				<th>Editar</th>
				<th>Excluir</th>
			<tr />
		</thead>
		<tbody>
			<%
				for (Equipamento equipamento : equipamentos) {
			%>
			<tr>
				<td><a
					href="ControleEquipamento?acao=mostrar&id=<%=equipamento.getId()%>"><%=equipamento.getNome()%></a></td>
				<td><%=equipamento.getModelo()%></td>
				<td><%=equipamento.getValorDiaria() %></td>
				<td><%=equipamento.getQuantidade() %></td>
				<td><%=(equipamento.isDisponivel())? "Sim" : "Não" %></td>
				<td><%= equipamento.getTipo() %></td>
				<td><a
					href="ControleEquipamento?acao=editar&id=<%=equipamento.getId()%>">editar</a></td>
				<td>
					<form action="ControleEquipamento" method="post">
						<input type="hidden" name="acao" value="remover"> 
						<input type="hidden" name="id" value="<%=equipamento.getId()%>"> 
						<input type="submit" value="excluir">
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