package com.br.projetointegrador.baraabbAPI.DTO;

public class TipoUsuarioDTO extends AbstractDTO {
	
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
