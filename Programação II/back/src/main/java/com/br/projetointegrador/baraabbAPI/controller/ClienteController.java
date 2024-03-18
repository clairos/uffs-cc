package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.ClienteDTO;
import com.br.projetointegrador.baraabbAPI.model.Cliente;
import com.br.projetointegrador.baraabbAPI.service.ClienteService;
import com.br.projetointegrador.baraabbAPI.service.GenericService;

/**
 * 
 * @author biasi
 *
 */

@RestController
@RequestMapping("cliente")
public class ClienteController extends AbstractController<Cliente, ClienteDTO> {

	@Autowired
	private ClienteService clienteService;
	
	@Override
	public Class<Cliente> getModelClass() {
		return Cliente.class;
	}

	@Override
	public Class<ClienteDTO> getDTOClass() {
		return ClienteDTO.class;
	}

	@Override
	public GenericService<Cliente> getService() {
		return clienteService;
	}

}
