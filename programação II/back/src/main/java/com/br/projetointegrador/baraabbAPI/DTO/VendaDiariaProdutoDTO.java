package com.br.projetointegrador.baraabbAPI.DTO;

import java.math.BigDecimal;

public class VendaDiariaProdutoDTO extends AbstractDTO {

	private Long idVendaDiariaProduto;
	
	private ProdutoDTO produto;
	
	private VendaDiariaDTO vendaDiaria;
	
	private BigDecimal valorTotalVendido;
	
	private Long quantidadeTotalVendida;
	
	@Override
	public Long getId() {
		return idVendaDiariaProduto;
	}

	public Long getIdVendaDiariaProduto() {
		return idVendaDiariaProduto;
	}

	public void setIdVendaDiariaProduto(Long idVendaDiariaProduto) {
		this.idVendaDiariaProduto = idVendaDiariaProduto;
	}

	public ProdutoDTO getProduto() {
		return produto;
	}

	public void setProduto(ProdutoDTO produto) {
		this.produto = produto;
	}

	public VendaDiariaDTO getVendaDiaria() {
		return vendaDiaria;
	}

	public void setVendaDiaria(VendaDiariaDTO vendaDiaria) {
		this.vendaDiaria = vendaDiaria;
	}

	public BigDecimal getValorTotalVendido() {
		return valorTotalVendido;
	}

	public void setValorTotalVendido(BigDecimal valorTotalVendido) {
		this.valorTotalVendido = valorTotalVendido;
	}

	public Long getQuantidadeTotalVendida() {
		return quantidadeTotalVendida;
	}

	public void setQuantidadeTotalVendida(Long quantidadeTotalVendida) {
		this.quantidadeTotalVendida = quantidadeTotalVendida;
	}

}
