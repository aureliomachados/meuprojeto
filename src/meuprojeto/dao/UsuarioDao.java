package meuprojeto.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import meuprojeto.model.Usuario;

public class UsuarioDao {

	private EntityManager manager = null;

	public UsuarioDao(EntityManager manager) {
		this.manager = manager;
	}

	public void add(Usuario usuario) {
		try {
			manager.getTransaction().begin();

			manager.persist(usuario);

			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void remove(Usuario usuario) {
		try {
			manager.getTransaction().begin();

			manager.remove(usuario);

			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public void remove(Long id) {
		try {
			manager.getTransaction().begin();

			Usuario usuario = manager.find(Usuario.class, id);

			manager.remove(usuario);

			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public Usuario findById(Long id) {
		Usuario usuario = null;
		try {
			usuario = manager.find(Usuario.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return usuario;
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> getAll() {
		List<Usuario> usuarios = null;
		try {
			Query query = manager.createQuery("select u from Usuario as u");

			usuarios = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return usuarios;
	}

	public void update(Usuario usuario) {
		try {
			manager.getTransaction().begin();

			manager.merge(usuario);

			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public Usuario logar(Usuario usuario) {
		Usuario u = null;
		try {
			Query query = manager
					.createQuery("select u from Usuario u where u.login = :login and u.senha = :senha");

			query.setParameter("login", usuario.getLogin());
			query.setParameter("senha", usuario.getSenha());

			u = (Usuario) query.getSingleResult();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
}
