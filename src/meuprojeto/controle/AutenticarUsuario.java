package meuprojeto.controle;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meuprojeto.dao.UsuarioDao;
import meuprojeto.model.Usuario;

/**
 * Servlet implementation class AutenticarUsuario
 */
@WebServlet("/AutenticarUsuario")
public class AutenticarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");

		if (acao.equals("sair")) {

			request.getSession().removeAttribute("usuarioLogado");
			request.getSession().invalidate();

			response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		Usuario usuario = new Usuario();
		
		usuario.setLogin(login);
		usuario.setSenha(senha);

		EntityManager manager = (EntityManager) request.getAttribute("manager");

		UsuarioDao usuarioDao = new UsuarioDao(manager);

		Usuario usuarioLogado = usuarioDao.logar(usuario);

		if (usuarioLogado != null) {
			request.getSession().setAttribute("usuarioLogado", usuarioLogado);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		} else {
			request.setAttribute("mensagem", "Login ou senha incorretos.");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
			//response.sendRedirect("login.jsp");
		}
	}

}
