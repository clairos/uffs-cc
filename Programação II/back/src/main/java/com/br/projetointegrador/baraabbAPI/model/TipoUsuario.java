package com.br.projetointegrador.baraabbAPI.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

/**
 * 
 * @author biasi
 *
 */

@Entity
@Table(name = "BARAABB_TIPOUSUARIO")
public class TipoUsuario extends AbstractEntity {

	private static final long serialVersionUID = 1L;
	
	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDTIPOUSUARIO", name = "SEQUENCE_IDTIPOUSUARIO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDTIPOUSUARIO")
	private Long idTipoUsuario;
	
	private String descricao;

	@Override
	public Long getId() {
		return idTipoUsuario;
	}

	public Long getIdTipoUsuario() {
		return idTipoUsuario;
	}

	public void setIdTipoUsuario(Long idTipoUsuario) {
		this.idTipoUsuario = idTipoUsuario;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
}
