package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.Usuario;
import com.br.projetointegrador.baraabbAPI.repository.UsuarioRepository;
import com.br.projetointegrador.baraabbAPI.service.UsuarioService;

@Service
public class UsuarioServiceImpl extends GenericServiceImpl<Usuario> implements UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Override
	public JpaRepository<Usuario, Long> getRepository() {
		return usuarioRepository;
	}

}
