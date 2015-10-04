package meuprojeto.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import meuprojeto.model.Equipamento;

public class EquipamentoDao {

	private EntityManager manager = null;

	public EquipamentoDao(EntityManager manager) {
		this.manager = manager;
	}

	public void add(Equipamento equipamento) {
		try {
			this.manager.getTransaction().begin();

			this.manager.persist(equipamento);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void update(Equipamento equipamento) {
		try {
			this.manager.getTransaction().begin();

			this.manager.merge(equipamento);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void remove(Equipamento equipamento) {
		try {
			this.manager.getTransaction().begin();

			this.manager.remove(equipamento);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void remove(Long id) {
		try {
			this.manager.getTransaction().begin();

			Equipamento equipamento = this.manager.find(Equipamento.class, id);

			this.manager.remove(equipamento);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public Equipamento getById(Long id) {
		Equipamento equipamento = null;
		try {
			equipamento = this.manager.find(Equipamento.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return equipamento;
	}

	@SuppressWarnings("unchecked")
	public List<Equipamento> getAll() {
		List<Equipamento> equipamentos = null;
		try {
			equipamentos = this.manager.createQuery(
					"select e from Equipamento as e").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return equipamentos;
	}
}
