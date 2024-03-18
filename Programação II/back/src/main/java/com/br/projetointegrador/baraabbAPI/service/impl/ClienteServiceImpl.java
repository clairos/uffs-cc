package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.Cliente;
import com.br.projetointegrador.baraabbAPI.repository.ClienteRepository;
import com.br.projetointegrador.baraabbAPI.service.ClienteService;

@Service
public class ClienteServiceImpl extends GenericServiceImpl<Cliente> implements ClienteService {

	@Autowired
	private ClienteRepository produtoRepository;
	
	@Override
	public JpaRepository<Cliente, Long> getRepository() {
		return produtoRepository;
	}

}
