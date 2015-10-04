package meuprojeto.teste;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import meuprojeto.dao.EquipamentoDao;
import meuprojeto.model.Equipamento;

public class TestaListaEquipamento {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence
				.createEntityManagerFactory("meuprojeto");

		EntityManager manager = factory.createEntityManager();

		EquipamentoDao equipamentoDao = new EquipamentoDao(manager);

		List<Equipamento> equipamentos = equipamentoDao.getAll();

		for (Equipamento equipamento : equipamentos) {
			System.out.println("Nome " + equipamento.getNome());
		}
	}
}
