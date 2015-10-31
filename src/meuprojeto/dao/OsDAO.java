package meuprojeto.dao;

import java.util.List;

import javax.persistence.EntityManager;

import meuprojeto.model.Os;

public class OsDAO {
	private EntityManager manager = null;

	public OsDAO(EntityManager manager) {
		this.manager = manager;
	}

	public void add(Os os) {
		try {
			this.manager.getTransaction().begin();

			this.manager.persist(os);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void update(Os os) {
		try {
			this.manager.getTransaction().begin();

			this.manager.merge(os);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void remove(Os os) {
		try {
			this.manager.getTransaction().begin();

			this.manager.remove(os);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void remove(Long id) {
		try {
			this.manager.getTransaction().begin();

			Os os = this.manager.find(Os.class, id);

			this.manager.remove(os);

			this.manager.getTransaction().commit();
		} catch (Exception e) {
			this.manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public Os getById(Long id) {
		Os os = null;
		try {
			os = this.manager.find(Os.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return os;
	}

	@SuppressWarnings("unchecked")
	public List<Os> getAll() {
		List<Os> os = null;
		try {
			os = this.manager.createQuery(
					"select c from Os as c").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return os;
	}
}

