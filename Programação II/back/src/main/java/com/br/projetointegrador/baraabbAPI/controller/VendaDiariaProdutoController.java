package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.VendaDiariaProdutoDTO;
import com.br.projetointegrador.baraabbAPI.model.VendaDiariaProduto;
import com.br.projetointegrador.baraabbAPI.service.GenericService;
import com.br.projetointegrador.baraabbAPI.service.VendaDiariaProdutoService;

@RestController
@RequestMapping("vendadiariaproduto")
public class VendaDiariaProdutoController extends AbstractController<VendaDiariaProduto, VendaDiariaProdutoDTO> {

	@Autowired
	private VendaDiariaProdutoService vendaDiariaProdutoService;
	
	@Override
	public Class<VendaDiariaProduto> getModelClass() {
		return VendaDiariaProduto.class;
	}

	@Override
	public Class<VendaDiariaProdutoDTO> getDTOClass() {
		return VendaDiariaProdutoDTO.class;
	}

	@Override
	public GenericService<VendaDiariaProduto> getService() {
		return vendaDiariaProdutoService;
	}

}
