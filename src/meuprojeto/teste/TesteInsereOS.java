package meuprojeto.teste;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.model.Cliente;
import meuprojeto.model.Equipamento;
import meuprojeto.model.Os;

public class TesteInsereOS {
	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");

		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();

		Os os = new Os();

		Cliente cliente = manager.find(Cliente.class, 2L);
		Equipamento equipamento = manager.find(Equipamento.class, 10L);

		os.setNumeroOs(454);
		os.setCliente(cliente);

		manager.persist(os);

		manager.getTransaction().commit();
		
		manager.close();
		factory.close();
	}
}
