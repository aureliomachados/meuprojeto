package meuprojeto.controle;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meuprojeto.dao.EquipamentoDao;
import meuprojeto.model.Equipamento;

/**
 * Servlet implementation class ControleEquipamento
 */
@WebServlet(description = "Servlet para caso de uso manter equipamento", urlPatterns = { "/ControleEquipamento" })
public class ControleEquipamento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String acao = (String) request.getParameter("acao");

		// pega o entity manager adicionado na sessão
		// pega o entity manager adicionado na sessão
		EntityManager manager = (EntityManager) request.getAttribute("manager");

		EquipamentoDao equipamentoDao = new EquipamentoDao(manager);

		switch (acao) {
		case "listar":

			List<Equipamento> equipamentos = equipamentoDao.getAll();

			request.getSession().setAttribute("equipamentos", equipamentos);

			request.getRequestDispatcher("lista-equipamentos.jsp").forward(
					request, response);
			break;

		case "mostrar":

			Long idEquipamento = Long.parseLong(request.getParameter("id"));

			Equipamento equipamento = equipamentoDao.getById(idEquipamento);

			request.setAttribute("equipamento", equipamento);

			request.getRequestDispatcher("mostrar-equipamento.jsp").forward(
					request, response);

			break;
		case "editar":

			Long id = Long.parseLong(request.getParameter("id"));

			Equipamento e = equipamentoDao.getById(id);

			request.setAttribute("equipamento", e);

			request.getRequestDispatcher("edita-equipamento.jsp").forward(
					request, response);
			break;

		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String acao = request.getParameter("acao");

		// pega o entity manager adicionado na sessão
		EntityManager manager = (EntityManager) request.getAttribute("manager");

		EquipamentoDao equipamentoDao = new EquipamentoDao(manager);

		String nome = null;
		String modelo = null;
		Double valorDiaria = null;
		String tipo = null;
		int quantidade = 0;
		boolean disponivel = false;

		if (!acao.equals("remover")) {
			nome = request.getParameter("nome");
			modelo = request.getParameter("modelo");
			valorDiaria = Double.parseDouble(request
					.getParameter("valorDiaria"));
			tipo = request.getParameter("tipo");
			quantidade = Integer.parseInt(request.getParameter("quantidade"));
			disponivel = Boolean.parseBoolean(request
					.getParameter("disponivel"));
		}

		switch (acao) {
		case "cadastrar":

			Equipamento equipamento = new Equipamento();

			equipamento.setNome(nome);
			equipamento.setModelo(modelo);
			equipamento.setTipo(tipo);
			equipamento.setQuantidade(quantidade);
			equipamento.setDisponivel(disponivel);
			equipamento.setValorDiaria(valorDiaria);

			equipamentoDao.add(equipamento);

			response.sendRedirect("ControleEquipamento?acao=listar");

			break;
		case "atualizar":

			// cria novo usuario
			Equipamento e = new Equipamento();

			Long id = Long.parseLong(request.getParameter("id"));

			// define novos valores
			e.setId(id);
			e.setNome(nome);
			e.setModelo(modelo);
			e.setDisponivel(disponivel);
			e.setQuantidade(quantidade);
			e.setValorDiaria(valorDiaria);
			e.setTipo(tipo);

			// atualiza o usuario
			equipamentoDao.update(e);

			// redireciona para a acao listar.
			response.sendRedirect("ControleEquipamento?acao=listar");

			break;
		case "remover":

			Long idRemove = Long.parseLong(request.getParameter("id"));

			equipamentoDao.remove(idRemove);

			response.sendRedirect("ControleEquipamento?acao=listar");

			break;

		default:
			break;
		}

	}
}
