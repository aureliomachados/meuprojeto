package meuprojeto.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Equipamento {

	@Id
	@GeneratedValue
	private Long id;
	private String nome;
	private String modelo;
	private double valorDiaria;
	private int quantidade;
	private boolean disponivel;
	private String tipo;

	public Equipamento() {

	}

	public Equipamento(String nome, String modelo, double valorDiaria,
			int quantidade, boolean disponivel, String tipo) {
		super();
		this.nome = nome;
		this.modelo = modelo;
		this.valorDiaria = valorDiaria;
		this.quantidade = quantidade;
		this.disponivel = disponivel;
		this.tipo = tipo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public double getValorDiaria() {
		return valorDiaria;
	}

	public void setValorDiaria(double valorDiaria) {
		this.valorDiaria = valorDiaria;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public boolean isDisponivel() {
		return disponivel;
	}

	public void setDisponivel(boolean disponivel) {
		this.disponivel = disponivel;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

}
