package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.CategoriaProdutoDTO;
import com.br.projetointegrador.baraabbAPI.model.CategoriaProduto;
import com.br.projetointegrador.baraabbAPI.service.CategoriaProdutoService;
import com.br.projetointegrador.baraabbAPI.service.GenericService;

/**
 * 
 * @author biasi
 *
 */

@RestController
@RequestMapping("categoriaproduto")
public class CategoriaProdutoController extends AbstractController<CategoriaProduto, CategoriaProdutoDTO> {
	
	@Autowired
	private CategoriaProdutoService categoriaProdutoService;
	
	@Override
	public Class<CategoriaProduto> getModelClass() {
		return CategoriaProduto.class;
	}

	@Override
	public Class<CategoriaProdutoDTO> getDTOClass() {
		return CategoriaProdutoDTO.class;
	}

	@Override
	public GenericService<CategoriaProduto> getService() {
		return categoriaProdutoService;
	}

}
