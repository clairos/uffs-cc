package com.br.projetointegrador.baraabbAPI.model;

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
@Table(name = "BARAABB_LISTACOMPRAPRODUTO")
public class ListaCompraProduto extends AbstractEntity {

	private static final long serialVersionUID = 1L;
	
	@Id
	@SequenceGenerator(allocationSize = 1, sequenceName = "IDLISTACOMPRAPRODUTO", name = "SEQUENCE_IDLISTACOMPRAPRODUTO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "SEQUENCE_IDLISTACOMPRAPRODUTO")
	private Long idListaCompraProduto;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDPRODUTO", foreignKey = @ForeignKey(name="FK_LISTACOMPRAPRODUTO_PRODUTO"))
	private Produto produto;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "IDLISTACOMPRA", foreignKey = @ForeignKey(name="FK_LISTACOMPRAPRODUTO_LISTCOMPRA"))
	private ListaCompra listaCompra;

	@Override
	public Long getId() {
		return idListaCompraProduto;
	}

	public Long getIdListaCompraProduto() {
		return idListaCompraProduto;
	}

	public void setIdListaCompraProduto(Long idListaCompraProduto) {
		this.idListaCompraProduto = idListaCompraProduto;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public ListaCompra getListaCompra() {
		return listaCompra;
	}

	public void setListaCompra(ListaCompra listaCompra) {
		this.listaCompra = listaCompra;
	}

}
