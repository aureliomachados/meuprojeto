package meuprojeto.dao;

import java.util.List;

import javax.persistence.EntityManager;

import meuprojeto.model.Cliente;



public class ClienteDao {

	private EntityManager manager = null;

	public ClienteDao(EntityManager manager) {
		this.manager = manager;
	}

	public void add(Cliente cliente) {
		try {
			this.manager.getTransaction().begin();

			this.manager.persist(cliente);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void update(Cliente cliente) {
		try {
			this.manager.getTransaction().begin();

			this.manager.merge(cliente);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void remove(Cliente cliente) {
		try {
			this.manager.getTransaction().begin();

			this.manager.remove(cliente);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void remove(Long id) {
		try {
			this.manager.getTransaction().begin();

			Cliente cliente = this.manager.find(Cliente.class, id);

			this.manager.remove(cliente);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public Cliente getById(Long id) {
		Cliente cliente = null;
		try {
			cliente = this.manager.find(Cliente.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cliente;
	}

	@SuppressWarnings("unchecked")
	public List<Cliente> getAll() {
		List<Cliente> clientes = null;
		try {
			clientes = this.manager.createQuery(
					"select c from Cliente as c").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return clientes;
	}
}
