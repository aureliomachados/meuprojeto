package meuprojeto.model;

import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Os {
	@Id
	// o atributo id sera chave primaria
	@GeneratedValue
	// tera o valor gerado automaticamente
	private long id;
	private long numeroOs;
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar dataCriacao;

	@ManyToMany(cascade = CascadeType.ALL)
	private List<Equipamento> equipamentos;

	@ManyToOne()
	private Cliente cliente;

	public Os() {

	}

	public Os(long id, long numeroOs, List<Equipamento> equipamentos,
			Cliente cliente) {
		super();
		this.id = id;
		this.numeroOs = numeroOs;
		this.equipamentos = equipamentos;
		this.cliente = cliente;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getNumeroOs() {
		return numeroOs;
	}

	public void setNumeroOs(long numeroOs) {
		this.numeroOs = numeroOs;
	}

	public List<Equipamento> getEquipamentos() {
		return equipamentos;
	}

	public void setEquipamentos(List<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

}
