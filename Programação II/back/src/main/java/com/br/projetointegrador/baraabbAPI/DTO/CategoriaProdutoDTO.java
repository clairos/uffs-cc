package com.br.projetointegrador.baraabbAPI.DTO;

import java.math.BigDecimal;
import java.util.Date;

public class CategoriaProdutoDTO extends AbstractDTO {
	
	private Long idCategoriaProduto;
	
	private String descricao;
	
	private BigDecimal percentualMargem;
	
	private Date dataCadastro;

	@Override
	public Long getId() {
		return idCategoriaProduto;
	}

	public Long getIdCategoriaProduto() {
		return idCategoriaProduto;
	}

	public void setIdCategoriaProduto(Long idCategoriaProduto) {
		this.idCategoriaProduto = idCategoriaProduto;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public BigDecimal getPercentualMargem() {
		return percentualMargem;
	}

	public void setPercentualMargem(BigDecimal percentualMargem) {
		this.percentualMargem = percentualMargem;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

}
