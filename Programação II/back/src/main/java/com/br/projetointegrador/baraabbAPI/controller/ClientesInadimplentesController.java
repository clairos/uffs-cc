package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.ClientesInadimplentesDTO;
import com.br.projetointegrador.baraabbAPI.model.ClientesInadimplentes;
import com.br.projetointegrador.baraabbAPI.service.ClientesInadimplentesService;
import com.br.projetointegrador.baraabbAPI.service.GenericService;

@RestController
@RequestMapping("clientesinadimplentes")
public class ClientesInadimplentesController extends AbstractController<ClientesInadimplentes, ClientesInadimplentesDTO> {

	@Autowired
	private ClientesInadimplentesService clientesInadimplentesService;
	
	@Override
	public Class<ClientesInadimplentes> getModelClass() {
		return ClientesInadimplentes.class;
	}

	@Override
	public Class<ClientesInadimplentesDTO> getDTOClass() {
		return ClientesInadimplentesDTO.class;
	}

	@Override
	public GenericService<ClientesInadimplentes> getService() {
		return clientesInadimplentesService;
	}

}
