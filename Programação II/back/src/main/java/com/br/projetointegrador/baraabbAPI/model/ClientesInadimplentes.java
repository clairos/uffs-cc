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

/**
 * 
 * @author biasi
 *
 */

@Entity
@Table(name = "BARAABB_CLIENTESINADIMPLENTES")
public class ClientesInadimplentes extends AbstractEntity {

	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDCLIENTESINADIMPLENTES", name = "SEQUENCE_IDCLIENTESINADIMPLENTES")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDCLIENTESINADIMPLENTES")
	private Long idClientesInadimplentes;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDCLIENTE", foreignKey = @ForeignKey(name= "FK_CLIENTEINAD_CLIENTE"))
	private Cliente cliente;
	
	private BigDecimal valorTotalComanda;
	
	private String statusPagamanto;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCompra;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataAcerto;
	
	private String Observacao;
	
	@Override
	public Long getId() {
		return idClientesInadimplentes;
	}

	public Long getIdClientesInadimplentes() {
		return idClientesInadimplentes;
	}

	public void setIdClientesInadimplentes(Long idClientesInadimplentes) {
		this.idClientesInadimplentes = idClientesInadimplentes;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public BigDecimal getValorTotalComanda() {
		return valorTotalComanda;
	}

	public void setValorTotalComanda(BigDecimal valorTotalComanda) {
		this.valorTotalComanda = valorTotalComanda;
	}


	public String getStatusPagamanto() {
		return statusPagamanto;
	}


	public void setStatusPagamanto(String statusPagamanto) {
		this.statusPagamanto = statusPagamanto;
	}


	public Date getDataCompra() {
		return dataCompra;
	}

	public void setDataCompra(Date dataCompra) {
		this.dataCompra = dataCompra;
	}

	public Date getDataAcerto() {
		return dataAcerto;
	}

	public void setDataAcerto(Date dataAcerto) {
		this.dataAcerto = dataAcerto;
	}

	public String getObservacao() {
		return Observacao;
	}

	public void setObservacao(String observacao) {
		Observacao = observacao;
	}
	
}
