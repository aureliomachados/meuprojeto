<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de equipamento</title>
</head>
<body>
	<form action="ControleEquipamento" method="post">
		<!--  Tipo de ação enviada pelo usuário -->
		<input type="hidden" name="acao" value="cadastrar">
		
		Nome: <input type="text" name="nome" required="true"><br/>
		Modelo: <input type="text" name="modelo" required="true"><br/>
		Tipo: <input type="text" name="tipo" required="true"><br/>
		Valor da diária <input type="text" name="valorDiaria" required="true"><br/>
		Quantidade <input type="text" name="quantidade" required="true"><br/>
		Disponível?
		<select name="disponivel" required>
			<option value="true">Sim</option>
			<option value="false">Não</option>
		</select><br/>
		<br/>
		<input type="submit" value="Cadastrar Equipamento"/>
		
	</form>
</body>
</html>