package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.TipoUsuario;
import com.br.projetointegrador.baraabbAPI.repository.TipoUsuarioRepository;
import com.br.projetointegrador.baraabbAPI.service.TipoUsuarioService;

@Service
public class TipoUsuarioServiceImpl extends GenericServiceImpl<TipoUsuario> implements TipoUsuarioService{

	@Autowired
	private TipoUsuarioRepository tipoUsuarioRepository;
	
	@Override
	public JpaRepository<TipoUsuario, Long> getRepository() {
		return tipoUsuarioRepository;
	}

}
