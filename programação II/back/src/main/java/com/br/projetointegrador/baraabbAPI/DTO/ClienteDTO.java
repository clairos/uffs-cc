package com.br.projetointegrador.baraabbAPI.DTO;

import java.util.Date;

import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class ClienteDTO extends AbstractDTO {
	
	private Long idCliente;
	
	@NotBlank(message = "Descricao é obrigatoria")
	private String nome;
	
	@NotNull(message = "Telefone é obrigatório")
	private String telefone;
	
	@NotNull(message = "Email é obrigatório")
	private String email;
	
	private String observacoes;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date datacadastro;

	@Override
	public Long getId() {
		return idCliente;
	}

	public Long getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public Date getDatacadastro() {
		return datacadastro;
	}

	public void setDatacadastro(Date datacadastro) {
		this.datacadastro = datacadastro;
	}
	
}
