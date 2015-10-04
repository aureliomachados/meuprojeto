package meuprojeto.teste;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.EquipamentoDao;
import meuprojeto.model.Equipamento;

public class TestaInsereEquipamento {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");
		EntityManager manager = factory.createEntityManager();

		EquipamentoDao dao = new EquipamentoDao(manager);

		Equipamento equipamento = new Equipamento();

		equipamento.setNome("teste");
		equipamento.setModelo("teste");
		equipamento.setQuantidade(20);
		equipamento.setTipo("Teste");
		equipamento.setValorDiaria(10.0);
		equipamento.setDisponivel(true);

		dao.add(equipamento);

		System.out.println("Equipamento adicionado com sucesso!");

		manager.close();
		factory.close();
	}
}
