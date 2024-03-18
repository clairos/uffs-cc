package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.ListaCompraProduto;
import com.br.projetointegrador.baraabbAPI.repository.ListaCompraProdutoRepository;
import com.br.projetointegrador.baraabbAPI.service.ListaCompraProdutoService;

@Service
public class ListaCompraProdutoServiceImpl extends GenericServiceImpl<ListaCompraProduto> implements ListaCompraProdutoService {

	@Autowired
	private ListaCompraProdutoRepository compraProdutoRepository;
	
	@Override
	public JpaRepository<ListaCompraProduto, Long> getRepository() {
		return compraProdutoRepository;
	}


}
