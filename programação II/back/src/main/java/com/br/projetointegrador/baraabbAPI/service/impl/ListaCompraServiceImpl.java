package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.ListaCompra;
import com.br.projetointegrador.baraabbAPI.repository.ListaCompraRepository;
import com.br.projetointegrador.baraabbAPI.service.ListaCompraService;

@Service
public class ListaCompraServiceImpl extends GenericServiceImpl<ListaCompra> implements ListaCompraService {

	@Autowired
	private ListaCompraRepository compraRepository;
	
	@Override
	public JpaRepository<ListaCompra, Long> getRepository() {
		return compraRepository;
	}

}
