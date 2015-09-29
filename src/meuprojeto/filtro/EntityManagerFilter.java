package meuprojeto.filtro;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EntityManagerFilter
 */
@WebFilter(description = "Filtro para disponibilizar um entitymanager a cada requisição", urlPatterns = { "/*" })
public class EntityManagerFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public EntityManagerFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// cast para httpservletrequest
		HttpServletRequest req = (HttpServletRequest) request;

		// declara a variável factory
		EntityManagerFactory factory;

		// verifica se existe ou não um entitymanagerfactory criado na sessão.
		if (req.getSession().getAttribute("factory") == null) {

			// cria o factory(necessário para criar o entitymanager)
			factory = Persistence.createEntityManagerFactory("meuprojeto");
			
			//adiciona o EntityManagerFactory criado na sessão.
			req.getSession().setAttribute("factory", factory);
		} else {
			//pega o EntityManagerFactory da sessão
			factory = (EntityManagerFactory) req.getSession().getAttribute(
					"factory");
		}
		// cria o entity manager (objeto que gerencia as operações com o banco
		// de dados)
		EntityManager manager = factory.createEntityManager();

		// adiciona o entitymanger na requisição
		request.setAttribute("manager", manager);

		// processa a requisição
		chain.doFilter(request, response);

		// fecha os recursos após processamento.
		manager.close();
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
