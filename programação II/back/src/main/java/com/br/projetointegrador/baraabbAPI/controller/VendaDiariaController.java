package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.VendaDiariaDTO;
import com.br.projetointegrador.baraabbAPI.model.VendaDiaria;
import com.br.projetointegrador.baraabbAPI.service.GenericService;
import com.br.projetointegrador.baraabbAPI.service.VendaDiariaService;

@RestController
@RequestMapping("vendadiaria")
public class VendaDiariaController extends AbstractController<VendaDiaria, VendaDiariaDTO> {

	@Autowired
	private VendaDiariaService vendaDiariaService;
	
	@Override
	public Class<VendaDiaria> getModelClass() {
		return VendaDiaria.class;
	}

	@Override
	public Class<VendaDiariaDTO> getDTOClass() {
		return VendaDiariaDTO.class;
	}

	@Override
	public GenericService<VendaDiaria> getService() {
		return vendaDiariaService;
	}

}
