package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.TipoUsuarioDTO;
import com.br.projetointegrador.baraabbAPI.model.TipoUsuario;
import com.br.projetointegrador.baraabbAPI.service.GenericService;
import com.br.projetointegrador.baraabbAPI.service.TipoUsuarioService;

@RestController
@RequestMapping("tipousuario")
public class TipoUsuarioController extends AbstractController<TipoUsuario, TipoUsuarioDTO> {
	
	@Autowired
	private TipoUsuarioService tipoUsuarioService;

	@Override
	public Class<TipoUsuario> getModelClass() {
		return TipoUsuario.class;
	}

	@Override
	public Class<TipoUsuarioDTO> getDTOClass() {
		return TipoUsuarioDTO.class;
	}

	@Override
	public GenericService<TipoUsuario> getService() {
		return tipoUsuarioService;
	}

}
