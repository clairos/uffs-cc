package com.br.projetointegrador.baraabbAPI.DTO;

public class ListaCompraProdutoDTO extends AbstractDTO {
	
	private Long idListaCompraProduto;
	
	private ProdutoDTO produto;
	
	private ListaCompraDTO listaCompra;

	@Override
	public Long getId() {
		return idListaCompraProduto;
	}

	public Long getIdListaCompraProduto() {
		return idListaCompraProduto;
	}

	public void setIdListaCompraProduto(Long idListaCompraProduto) {
		this.idListaCompraProduto = idListaCompraProduto;
	}

	public ProdutoDTO getProduto() {
		return produto;
	}

	public void setProduto(ProdutoDTO produto) {
		this.produto = produto;
	}

	public ListaCompraDTO getListaCompra() {
		return listaCompra;
	}

	public void setListaCompra(ListaCompraDTO listaCompra) {
		this.listaCompra = listaCompra;
	}
	
}
