package meuprojeto.teste;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.EquipamentoDao;
import meuprojeto.model.Equipamento;

public class TestaBuscaEquipamento {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");
		EntityManager manager = factory.createEntityManager();
		
		EquipamentoDao equipamentoDao = new EquipamentoDao(manager);
		
		Equipamento equipamento = equipamentoDao.getById(1L);
		
		System.out.println(equipamento.getNome());

	}
}
