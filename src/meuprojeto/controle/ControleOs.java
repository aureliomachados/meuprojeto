package meuprojeto.controle;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Branch;

import com.sun.org.apache.bcel.internal.generic.NEW;

import meuprojeto.dao.ClienteDao;
import meuprojeto.dao.EquipamentoDao;
import meuprojeto.dao.OsDAO;
import meuprojeto.model.Cliente;
import meuprojeto.model.Equipamento;
import meuprojeto.model.Os;

@WebServlet("/ControleOs")
public class ControleOs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControleOs() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		{
			String acao = (String) request.getParameter("acao");

			// pega o entity manager adicionado na sessão
			// pega o entity manager adicionado na sessão
			EntityManager manager = (EntityManager) request
					.getAttribute("manager");

			OsDAO osDAO = new OsDAO(manager);

			switch (acao) {
			case "listar":

				List<Os> os = osDAO.getAll();

				request.getSession().setAttribute("os", os);

				request.getRequestDispatcher("lista-os.jsp").forward(request,
						response);
				break;

			case "mostrar":

				Long idOs = Long.parseLong(request.getParameter("id"));
				Os osMostrar = osDAO.getById(idOs);

				EquipamentoDao equipamentoDao = new EquipamentoDao(manager);

				List<Equipamento> equipamentos = equipamentoDao.getAll();

				request.setAttribute("os", osMostrar);
				request.setAttribute("equipamentos", equipamentos);

				request.getRequestDispatcher("mostrar-os.jsp").forward(request,
						response);

				break;
			case "editar":

				Long id = Long.parseLong(request.getParameter("id"));

				Os e = osDAO.getById(id);

				request.setAttribute("os", e);

				request.getRequestDispatcher("edita-os.jsp").forward(request,
						response);
				break;

			default:
				break;
			}
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");

		// pega o entity manager adicionado na sessão
		EntityManager manager = (EntityManager) request.getAttribute("manager");

		OsDAO osDAO = new OsDAO(manager);

		String nome = null;
		String telefone = null;
		String celular = null;
		String endereco = null;
		String email = null;
		String equipamentos = null;

		if (!acao.equals("remover")) {
			nome = request.getParameter("nome");
			telefone = request.getParameter("telefone");
			celular = request.getParameter("celular");
			endereco = request.getParameter("endereco");
			email = request.getParameter("email");
			equipamentos = request.getParameter("equipamentos");
		}

		switch (acao) {
		case "cadastrar":

			ClienteDao clienteDao = new ClienteDao(manager);

			Cliente cliente = clienteDao.getById(Long.parseLong(request
					.getParameter("cliente_id")));

			Os os = new Os();

			os.setCliente(cliente);

			osDAO.add(os);

			response.sendRedirect("http://localhost:8080/meuprojeto/ControleCliente?acao=mostrar&id="
					+ request.getParameter("cliente_id"));

			break;

		case "cadastrar-equipamento":
			//cria o dao para equipamento
			EquipamentoDao equipamentoDao = new EquipamentoDao(manager);

			//busca a os corrente com o parâmetro vindo da requisição
			Os osParaSalvar = osDAO.getById(Long.parseLong(request
					.getParameter("id_os")));

			//busca o equipamento com o id passado como parâmetro na requisição. 
			Equipamento equipamento = equipamentoDao.getById(Long
					.parseLong(request.getParameter("id_equipamento")));

			//adiciona o equipamento na lista de equipamentos da os corrente.
			osParaSalvar.getEquipamentos().add(equipamento);

			//atualiza a os no banco de dados.
			osDAO.update(osParaSalvar);
			
			//redireciona para a página que fez a requisição passando o id da os corrente.
			response.sendRedirect("ControleOs?acao=mostrar&id=" + osParaSalvar.getId());

			break;
		case "atualizar":

			// cria novo usuario
			Os e = new Os();

			Long id = Long.parseLong(request.getParameter("id"));

			// atualiza o usuario
			osDAO.update(e);

			// redireciona para a acao listar.
			response.sendRedirect("ControleOs?acao=listar");

			break;
		case "remover":

			Long idRemove = Long.parseLong(request.getParameter("id"));

			osDAO.remove(idRemove);

			response.sendRedirect("ControleOs?acao=listar");

			break;

		default:
			break;
		}

	}

}
