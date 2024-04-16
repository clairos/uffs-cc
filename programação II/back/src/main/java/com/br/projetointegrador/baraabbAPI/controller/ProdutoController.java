package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.ProdutoDTO;
import com.br.projetointegrador.baraabbAPI.model.Produto;
import com.br.projetointegrador.baraabbAPI.service.GenericService;
import com.br.projetointegrador.baraabbAPI.service.ProdutoService;

@RestController
@RequestMapping("produto")
public class ProdutoController extends AbstractController<Produto, ProdutoDTO> {

	@Autowired
	private ProdutoService produtoService;
	
	@Override
	public Class<Produto> getModelClass() {
		return Produto.class;
	}

	@Override
	public Class<ProdutoDTO> getDTOClass() {
		return ProdutoDTO.class;
	}

	@Override
	public GenericService<Produto> getService() {
		return produtoService;
	}

}
