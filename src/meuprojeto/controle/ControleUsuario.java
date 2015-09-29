package meuprojeto.controle;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meuprojeto.dao.UsuarioDao;
import meuprojeto.model.Usuario;

/**
 * Servlet implementation class ControleUsuario
 */
@WebServlet(description = "Classe para controle do caso de uso manter usuário", urlPatterns = { "/ControleUsuario" })
public class ControleUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Recebe requisições do tipo GET
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Pega o nome da ação
		String acao = request.getParameter("acao");

		// pega o entity manager adicionado na sessão
		EntityManager manager = (EntityManager) request.getAttribute("manager");
		// intancia o dao passando o manager
		UsuarioDao usuarioDao = new UsuarioDao(manager);

		switch (acao) {
		case "listar":
			// lista os usuarios
			List<Usuario> usuarios = usuarioDao.getAll();

			// adiciona a lista de usuarios como atributo da sessão
			request.getSession().setAttribute("usuarios", usuarios);

			// redireciona para a jsp lista-usuarios.jsp
			request.getRequestDispatcher("lista-usuarios.jsp").forward(request,
					response);

			break;

		case "mostrar":

			// recupera o id passado na sessão

			Long id = Long.parseLong(request.getParameter("id"));

			// busca o usuário com o id passado
			Usuario usuario = usuarioDao.findById(id);

			// adiciona o usuário na requisição
			request.setAttribute("usuario", usuario);

			// redireciona para mostrar-usuario.jsp
			request.getRequestDispatcher("mostrar-usuario.jsp").forward(
					request, response);
			break;

		case "editar":

			// recupera o id passado na sessão

			Long idRec = Long.parseLong(request.getParameter("id"));

			// busca o usuário com o id passado
			Usuario u = usuarioDao.findById(idRec);

			// adiciona o usuário na requisição
			request.setAttribute("usuario", u);

			// redireciona para mostrar-usuario.jsp
			request.getRequestDispatcher("edita-usuario.jsp").forward(request,
					response);

			break;

		default:
			break;
		}

	}

	/**
	 * Recebe requisições do tipo POT
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Pega o nome da ação
		String acao = request.getParameter("acao");

		// recupera os parâmetros passados pelo formulário
		String nome = request.getParameter("nome");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		// pega o entity manager adicionado na sessão
		EntityManager manager = (EntityManager) request.getAttribute("manager");

		// intancia o dao passando o manager
		UsuarioDao usuarioDao = new UsuarioDao(manager);

		switch (acao) {
		case "cadastrar":

			// instancia o usuário
			Usuario usuario = new Usuario();

			// popula os atributos do usuário.
			usuario.setNome(nome);
			usuario.setLogin(login);
			usuario.setSenha(senha);

			// adiciona o usuario no dao
			usuarioDao.add(usuario);

			// redireciona para lista-usuarios.jsp
			response.sendRedirect("ControleUsuario?acao=listar");

			break;
		case "atualizar":

			// cria novo usuario
			Usuario u = new Usuario();
			
			Long id = Long.parseLong(request.getParameter("id"));

			// define novos valores
			u.setId(id);
			u.setNome(nome);
			u.setLogin(login);
			u.setSenha(senha);

			// atualiza o usuario
			usuarioDao.update(u);

			// redireciona para a acao listar.
			response.sendRedirect("ControleUsuario?acao=listar");

			break;
		case "remover":
			
			Long idRemove = Long.parseLong(request.getParameter("id"));

			usuarioDao.remove(idRemove);

			response.sendRedirect("ControleUsuario?acao=listar");

			break;

		default:
			break;
		}
	}

}
