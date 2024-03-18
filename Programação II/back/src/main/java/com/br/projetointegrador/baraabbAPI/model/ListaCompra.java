package com.br.projetointegrador.baraabbAPI.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

/**
 * 
 * @author biasi
 *
 */

@Entity
@Table(name = "BARAABB_LIATACOMPRAS")
public class ListaCompra extends AbstractEntity {

	private static final long serialVersionUID = 1L;
	
	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDLISTACOMPRA", name = "SEQUENCE_IDLISTACOMPRA")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDLISTACOMPRA")
	private Long idListaCompra;
	
	@JoinColumn(name = "IDUSUARIO", foreignKey = @ForeignKey(name="FK_LISTACOMPRA_USUARIO"))
	private Usuario usuario;
	
	@OneToMany(cascade = CascadeType.ALL) // mappedBy = "LISTACOMPRAS"
	private Set<ListaCompraProduto> produtosSet = new HashSet<>();

	@Override
	public Long getId() {
		return idListaCompra;
	}

	public Long getIdListaCompra() {
		return idListaCompra;
	}

	public void setIdListaCompra(Long idListaCompra) {
		this.idListaCompra = idListaCompra;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Set<ListaCompraProduto> getProdutosSet() {
		return produtosSet;
	}

	public void setProdutosSet(Set<ListaCompraProduto> produtosSet) {
		this.produtosSet = produtosSet;
	}
	
}
