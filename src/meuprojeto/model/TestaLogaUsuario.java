package meuprojeto.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.UsuarioDao;

public class TestaLogaUsuario {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");

		EntityManager manager = factory.createEntityManager();

		Usuario usuario = new Usuario(null, "aurelio", "19122010");

		UsuarioDao dao = new UsuarioDao(manager);

		boolean resultado  = dao.logar(usuario);

		if (resultado) {
			System.out.println("Usuário logado com sucesso!");
		} else {
			System.out.println("Login ou senha incorretos");
		}

		manager.close();
		factory.close();
	}
}
