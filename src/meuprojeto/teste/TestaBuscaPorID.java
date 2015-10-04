package meuprojeto.teste;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.UsuarioDao;
import meuprojeto.model.Usuario;

public class TestaBuscaPorID {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");

		EntityManager manager = factory.createEntityManager();

		UsuarioDao dao = new UsuarioDao(manager);

		Usuario usuario = dao.findById(1L);

		System.out.println(usuario.getNome());

		manager.close();
		factory.close();

	}
}
