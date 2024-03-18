package com.br.projetointegrador.baraabbAPI.model;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

/**
 * 
 * @author biasi
 *
 */

@Entity
@Table(name = "BARAABB_CATEGORIAPRODUTO")
public class CategoriaProduto extends AbstractEntity {

	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDCATEGORIAPRODUTO", name = "SEQUENCE_IDCATEGORIAPRODUTO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDCATEGORIAPRODUTO")
	private Long idCategoriaProduto;
	
	private String descricao;
	
	private BigDecimal percentualMargem;
	
	@Temporal(TemporalType.TIMESTAMP)
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
