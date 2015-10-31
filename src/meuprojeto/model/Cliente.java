package meuprojeto.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
// isso diz que a classe ser a tabela cliente no banco de dados.
public class Cliente {

	@Id
	// o atributo id sera chave primaria
	@GeneratedValue
	// tera o valor gerado automaticamente
	private long id;
	private String nome;
	private String tefefone;
	private String celular;
	private String endereco;
	private String email;

	@OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL)
	private List<Os> os;

	public Cliente() {

	}

	public Cliente(String nome, String tefefone, String celular,
			String endereco, String email) {
		super();
		this.nome = nome;
		this.tefefone = tefefone;
		this.celular = celular;
		this.endereco = endereco;
		this.email = email;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTefefone() {
		return tefefone;
	}

	public void setTefefone(String tefefone) {
		this.tefefone = tefefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Os> getOs() {
		return os;
	}

	public void setOs(List<Os> os) {
		this.os = os;
	}
	
	

}
