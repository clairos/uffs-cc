package com.br.projetointegrador.baraabbAPI.DTO;

import java.math.BigDecimal;
import java.util.Date;

public class ClientesInadimplentesDTO extends AbstractDTO {

	private Long idClientesInadimplentes;
	
	private ClienteDTO cliente;
	
	private BigDecimal valorTotalComanda;
	
	private String statusPagamanto;
	
	private Date dataCompra;
	
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

	public ClienteDTO getCliente() {
		return cliente;
	}

	public void setCliente(ClienteDTO cliente) {
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
