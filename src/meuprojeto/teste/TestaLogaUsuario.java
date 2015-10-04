package meuprojeto.teste;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.UsuarioDao;
import meuprojeto.model.Usuario;

public class TestaLogaUsuario {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");

		EntityManager manager = factory.createEntityManager();

		Usuario usuario = new Usuario(null, "aurelio", "123456");

		UsuarioDao dao = new UsuarioDao(manager);

		if (dao.logar(usuario) != null) {
			System.out.println("Usuário logado com sucesso!");
		} else {
			System.out.println("Login ou senha incorretos");
		}

		manager.close();
		factory.close();
	}
}
