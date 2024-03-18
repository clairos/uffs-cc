package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.ClientesInadimplentes;
import com.br.projetointegrador.baraabbAPI.repository.ClientesInadimplentesRepository;
import com.br.projetointegrador.baraabbAPI.service.ClientesInadimplentesService;

@Service
public class ClientesInadimplentesServiceImpl extends GenericServiceImpl<ClientesInadimplentes> implements ClientesInadimplentesService {

	@Autowired
	private ClientesInadimplentesRepository inadimplentesRepository;
	
	@Override
	public JpaRepository<ClientesInadimplentes, Long> getRepository() {
		return inadimplentesRepository;
	}

}
