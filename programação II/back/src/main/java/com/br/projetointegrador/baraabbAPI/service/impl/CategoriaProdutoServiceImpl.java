package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.CategoriaProduto;
import com.br.projetointegrador.baraabbAPI.repository.CategoriaProdutoRepository;
import com.br.projetointegrador.baraabbAPI.service.CategoriaProdutoService;

@Service
public class CategoriaProdutoServiceImpl extends GenericServiceImpl<CategoriaProduto> implements CategoriaProdutoService {

	@Autowired
	private CategoriaProdutoRepository categoriaProdutoRepository;
	
	@Override
	public JpaRepository<CategoriaProduto, Long> getRepository() {
		return categoriaProdutoRepository;
	}

}
