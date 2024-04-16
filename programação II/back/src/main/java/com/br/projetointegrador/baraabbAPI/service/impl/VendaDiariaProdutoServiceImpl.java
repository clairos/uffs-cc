package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.VendaDiariaProduto;
import com.br.projetointegrador.baraabbAPI.repository.VendaDiariaProdutoRepository;
import com.br.projetointegrador.baraabbAPI.service.VendaDiariaProdutoService;

@Service
public class VendaDiariaProdutoServiceImpl extends GenericServiceImpl<VendaDiariaProduto> implements VendaDiariaProdutoService {
	
	@Autowired
	private VendaDiariaProdutoRepository vendaDiariaProdutoRepository;	
	
	@Override
	public JpaRepository<VendaDiariaProduto, Long> getRepository() {
		return vendaDiariaProdutoRepository;
	}

}
