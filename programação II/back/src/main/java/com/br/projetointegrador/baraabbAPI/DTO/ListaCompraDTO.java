package com.br.projetointegrador.baraabbAPI.DTO;

public class ListaCompraDTO extends AbstractDTO {
	
	private Long idListaCompra;
	
	private UsuarioDTO usuario;
	
	public Long getId() {
		return idListaCompra;
	}

	public Long getIdListaCompra() {
		return idListaCompra;
	}

	public void setIdListaCompra(Long idListaCompra) {
		this.idListaCompra = idListaCompra;
	}

	public UsuarioDTO getUsuario() {
		return usuario;
	}

	public void setUsuario(UsuarioDTO usuario) {
		this.usuario = usuario;
	}

}
