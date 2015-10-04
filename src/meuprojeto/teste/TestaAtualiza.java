package meuprojeto.teste;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.UsuarioDao;
import meuprojeto.model.Usuario;

public class TestaAtualiza {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");

		EntityManager manager = factory.createEntityManager();

		UsuarioDao dao = new UsuarioDao(manager);

		Usuario usuario = dao.findById(1L);

		usuario.setNome("Deusdete Guedes de Souza");
		usuario.setLogin("deusdete");

		dao.update(usuario);

		manager.close();
		factory.close();

	}
}
