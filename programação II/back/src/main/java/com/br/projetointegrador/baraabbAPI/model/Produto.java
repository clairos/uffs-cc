package com.br.projetointegrador.baraabbAPI.model;

import java.math.BigDecimal;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "BARAABB_PRODUTO")
public class Produto extends AbstractEntity {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDPRODUTO", name = "SEQUENCE_IDPRODUTO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDPRODUTO")
	private Long idProduto;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDCATEGORIAPRODUTO", foreignKey = @ForeignKey(name="FK_PRODUTO_CATEGORIAPROD"))
	private CategoriaProduto categoriaProduto;
	
	private String descricao;
	
	private BigDecimal precoCompra;
	
	private BigDecimal precoVenda;
	
	private Long quantidadeEstoque;
	
	private Usuario usuarioCadastro;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCadastro;

	@Override
	public Long getId() {
		return idProduto;
	}

	public Long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Long idProduto) {
		this.idProduto = idProduto;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public CategoriaProduto getCategoriaProduto() {
		return categoriaProduto;
	}

	public void setCategoriaProduto(CategoriaProduto categoriaProduto) {
		this.categoriaProduto = categoriaProduto;
	}

	public BigDecimal getPrecoCompra() {
		return precoCompra;
	}

	public void setPrecoCompra(BigDecimal precoCompra) {
		this.precoCompra = precoCompra;
	}

	public BigDecimal getPrecoVenda() {
		return precoVenda;
	}

	public void setPrecoVenda(BigDecimal precoVenda) {
		this.precoVenda = precoVenda;
	}

	public Long getQuantidadeEstoque() {
		return quantidadeEstoque;
	}

	public void setQuantidadeEstoque(Long quantidadeEstoque) {
		this.quantidadeEstoque = quantidadeEstoque;
	}

	public Usuario getUsuarioCadastro() {
		return usuarioCadastro;
	}

	public void setUsuarioCadastro(Usuario usuarioCadastro) {
		this.usuarioCadastro = usuarioCadastro;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

}
