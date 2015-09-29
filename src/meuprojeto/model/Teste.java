package meuprojeto.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.UsuarioDao;

public class Teste {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");

		EntityManager manager = factory.createEntityManager();

		Usuario usuario = new Usuario();

		usuario.setNome("Aurélio Guedes de souza");
		usuario.setLogin("aurelio");
		usuario.setSenha("123456");

		UsuarioDao dao = new UsuarioDao(manager);

		dao.add(usuario);

		System.out.println("Usuário adicionado com sucesso!");

		manager.close();
		factory.close();

	}
}
