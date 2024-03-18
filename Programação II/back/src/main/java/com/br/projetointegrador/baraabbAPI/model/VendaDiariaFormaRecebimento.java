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
@Table(name = "BARAABB_VENDADIAFORMARECEB")
public class VendaDiariaFormaRecebimento extends AbstractEntity {

	private static final long serialVersionUID = 1L;
	
	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDVENDADIARIAFORMARECEBIMENTO", name = "SEQUENCE_IDVENDADIARIAFORMARECEBIMENTO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDVENDADIARIAFORMARECEBIMENTO")
	private Long idVendaDiariaFormaRecebimento;
	
	private String formaPagamento;
	
	private BigDecimal valorRecebido;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDVENDADIARIA", foreignKey = @ForeignKey(name = "FK_VENDDIAFORMARECEB_VENDADIARIA"))
	private VendaDiaria vendaDiaria;

	@Override
	public Long getId() {
		return idVendaDiariaFormaRecebimento;
	}

	public Long getIdVendaDiariaFormaRecebimento() {
		return idVendaDiariaFormaRecebimento;
	}

	public void setIdVendaDiariaFormaRecebimento(Long idVendaDiariaFormaRecebimento) {
		this.idVendaDiariaFormaRecebimento = idVendaDiariaFormaRecebimento;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public BigDecimal getValorRecebido() {
		return valorRecebido;
	}

	public void setValorRecebido(BigDecimal valorRecebido) {
		this.valorRecebido = valorRecebido;
	}

	public VendaDiaria getVendaDiaria() {
		return vendaDiaria;
	}

	public void setVendaDiaria(VendaDiaria vendaDiaria) {
		this.vendaDiaria = vendaDiaria;
	}
	
}
