package meuprojeto.teste;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.EntityManagerFactory;

import meuprojeto.dao.UsuarioDao;
import meuprojeto.model.Usuario;

public class TestaRemove {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");
		EntityManager manager = factory.createEntityManager();

		UsuarioDao dao = new UsuarioDao(manager);

		Usuario usuario = dao.findById(2L);

		dao.remove(usuario.getId());

		manager.close();
		factory.close();
	}
}
