package meuprojeto.teste;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.UsuarioDao;
import meuprojeto.model.Usuario;

public class TestaListaTodos {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");

		EntityManager manager = factory.createEntityManager();

		UsuarioDao dao = new UsuarioDao(manager);

		List<Usuario> usuarios = dao.getAll();

		for (Usuario usuario : usuarios) {
			System.out.println("Nome: " + usuario.getNome());
			System.out.println("Login: " + usuario.getLogin());
			System.out.println("Senha: " + usuario.getSenha());
			System.out.println();
		}

		manager.close();
		factory.close();
	}
}
