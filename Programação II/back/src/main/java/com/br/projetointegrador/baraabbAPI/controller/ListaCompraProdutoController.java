package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.ListaCompraProdutoDTO;
import com.br.projetointegrador.baraabbAPI.model.ListaCompraProduto;
import com.br.projetointegrador.baraabbAPI.service.GenericService;
import com.br.projetointegrador.baraabbAPI.service.ListaCompraProdutoService;

@RestController
@RequestMapping("listacompraproduto")
public class ListaCompraProdutoController extends AbstractController<ListaCompraProduto, ListaCompraProdutoDTO> {

	@Autowired
	private ListaCompraProdutoService compraProdutoService;
	
	@Override
	public Class<ListaCompraProduto> getModelClass() {
		return ListaCompraProduto.class;
	}

	@Override
	public Class<ListaCompraProdutoDTO> getDTOClass() {
		return ListaCompraProdutoDTO.class;
	}

	@Override
	public GenericService<ListaCompraProduto> getService() {
		return compraProdutoService;
	}

}
