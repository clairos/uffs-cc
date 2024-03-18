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
@Table(name = "BARAABB_VENDADIARIA")
public class VendaDiaria extends AbstractEntity {

	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDVENDADIARIA", name = "SEQUENCE_IDVENDADIARIA")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDVENDADIARIA")
	private Long idVendaDiaria;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDUSUARIO", foreignKey = @ForeignKey(name ="FK_VENDADIARIA_USUARIO"))
	private Usuario usuario;
	
	private BigDecimal valorTotalBruto;
	
	private BigDecimal valorTotalLiquido;
		
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCadastro;

	@Override
	public Long getId() {
		return idVendaDiaria;
	}

	public Long getIdVendaDiaria() {
		return idVendaDiaria;
	}

	public void setIdVendaDiaria(Long idVendaDiaria) {
		this.idVendaDiaria = idVendaDiaria;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public BigDecimal getValorTotalBruto() {
		return valorTotalBruto;
	}

	public void setValorTotalBruto(BigDecimal valorTotalBruto) {
		this.valorTotalBruto = valorTotalBruto;
	}

	public BigDecimal getValorTotalLiquido() {
		return valorTotalLiquido;
	}

	public void setValorTotalLiquido(BigDecimal valorTotalLiquido) {
		this.valorTotalLiquido = valorTotalLiquido;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

}
