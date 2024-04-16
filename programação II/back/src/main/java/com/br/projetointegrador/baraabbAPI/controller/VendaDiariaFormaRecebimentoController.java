package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.VendaDiariaFormaRecebimentoDTO;
import com.br.projetointegrador.baraabbAPI.model.VendaDiariaFormaRecebimento;
import com.br.projetointegrador.baraabbAPI.service.GenericService;
import com.br.projetointegrador.baraabbAPI.service.VendaDiariaFormaRecebimentoService;

@RestController
@RequestMapping("vendadiariaformarecebimento")
public class VendaDiariaFormaRecebimentoController extends AbstractController<VendaDiariaFormaRecebimento, VendaDiariaFormaRecebimentoDTO> {

	@Autowired
	private VendaDiariaFormaRecebimentoService diariaFormaRecebimentoService;
	
	@Override
	public Class<VendaDiariaFormaRecebimento> getModelClass() {
		return VendaDiariaFormaRecebimento.class;
	}

	@Override
	public Class<VendaDiariaFormaRecebimentoDTO> getDTOClass() {
		return VendaDiariaFormaRecebimentoDTO.class;
	}

	@Override
	public GenericService<VendaDiariaFormaRecebimento> getService() {
		return diariaFormaRecebimentoService;
	}

}
