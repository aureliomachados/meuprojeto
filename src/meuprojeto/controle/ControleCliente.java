package meuprojeto.controle;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meuprojeto.dao.ClienteDao;

import meuprojeto.model.Cliente;

@WebServlet("/ControleCliente")
public class ControleCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControleCliente() {
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

			ClienteDao clienteDao = new ClienteDao(manager);

			switch (acao) {
			case "listar":

				List<Cliente> cliente = clienteDao.getAll();

				request.getSession().setAttribute("cliente", cliente);

				request.getRequestDispatcher("lista-cliente.jsp").forward(
						request, response);
				break;

			case "mostrar":

				Long idCliente = Long.parseLong(request.getParameter("id"));

				Cliente clientes = clienteDao.getById(idCliente);

				request.setAttribute("clientes", clientes);

				request.getRequestDispatcher("mostrar-cliente.jsp")
						.forward(request, response);

				break;
			case "editar":

				Long id = Long.parseLong(request.getParameter("id"));

				Cliente e = clienteDao.getById(id);

				request.setAttribute("cliente", e);

				request.getRequestDispatcher("edita-cliente.jsp").forward(
						request, response);
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

		ClienteDao clienteDao = new ClienteDao(manager);

		String nome = null;
		String telefone = null;
		String celular = null;
		String endereco = null;
		String email=null;
		

		if (!acao.equals("remover")) {
			nome = request.getParameter("nome");
			telefone = request.getParameter("telefone");
			celular = request.getParameter("celular");
			endereco =request.getParameter("endereco"); 
			email = request.getParameter("email");
		}

		switch (acao) {
		case "cadastrar":

			Cliente cliente = new Cliente();

			cliente.setNome(nome);
			cliente.setTefefone(telefone);
			cliente.setCelular(celular);
			cliente.setEndereco(endereco);
			cliente.setEmail(email);
			

			clienteDao.add(cliente);

			response.sendRedirect("ControleCliente?acao=listar");

			break;
		case "atualizar":

			// cria novo usuario
			Cliente e = new Cliente();

			Long id = Long.parseLong(request.getParameter("id"));

			// define novos valores
			e.setId(id);
			e.setNome(nome);
			e.setTefefone(telefone);
			e.setCelular(celular);
			e.setEndereco(endereco);
			e.setEmail(email);
			

			// atualiza o usuario
			clienteDao.update(e);

			// redireciona para a acao listar.
			response.sendRedirect("ControleCliente?acao=listar");

			break;
		case "remover":

			Long idRemove = Long.parseLong(request.getParameter("id"));

			clienteDao.remove(idRemove);

			response.sendRedirect("ControleCliente?acao=listar");

			break;

		default:
			break;
		}

	}

}
