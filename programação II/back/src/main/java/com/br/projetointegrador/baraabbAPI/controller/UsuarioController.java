package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.projetointegrador.baraabbAPI.DTO.UsuarioDTO;
import com.br.projetointegrador.baraabbAPI.model.Usuario;
import com.br.projetointegrador.baraabbAPI.service.GenericService;
import com.br.projetointegrador.baraabbAPI.service.UsuarioService;

@RestController
@RequestMapping("usuario")
public class UsuarioController extends AbstractController<Usuario, UsuarioDTO> {

	@Autowired
	private UsuarioService usuarioService;
	
	@Override
	public Class<Usuario> getModelClass() {
		return Usuario.class;
	}

	@Override
	public Class<UsuarioDTO> getDTOClass() {
		return UsuarioDTO.class;
	}

	@Override
	public GenericService<Usuario> getService() {
		return usuarioService;
	}

}
