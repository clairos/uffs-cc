package com.br.projetointegrador.baraabbAPI.model;

import java.math.BigDecimal;

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

/**
 * 
 * @author biasi
 *
 */

@Entity
@Table(name = "BARAABB_VENDADIARIAPRODUTO")
public class VendaDiariaProduto extends AbstractEntity {

	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDVENDADIARIAPRODUTO", name = "SEQUENCE_IDVENDADIARIAPRODUTO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDVENDADIARIAPRODUTO")
	private Long idVendaDiariaProduto;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDPRODUTO", foreignKey = @ForeignKey(name = "FK_VENDDIAPRODUTO_PRODUTO"))
	private Produto produto;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDVENDADIARIA", foreignKey = @ForeignKey(name = "FK_VENDDIAPRODUTO_VENDADIARIA"))
	private VendaDiaria vendaDiaria;
	
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

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
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
