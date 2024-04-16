package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.Produto;
import com.br.projetointegrador.baraabbAPI.repository.ProdutoRepository;
import com.br.projetointegrador.baraabbAPI.service.ProdutoService;

@Service
public class ProdutoServiceImpl extends GenericServiceImpl<Produto> implements ProdutoService {

	@Autowired
	private ProdutoRepository produtoRepository;
	
	@Override
	public JpaRepository<Produto, Long> getRepository() {
		return produtoRepository;
	}

}
