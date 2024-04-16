package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.VendaDiaria;
import com.br.projetointegrador.baraabbAPI.repository.VendaDiariaRepository;
import com.br.projetointegrador.baraabbAPI.service.VendaDiariaService;

@Service
public class VendaDiariaServiceImpl extends GenericServiceImpl<VendaDiaria> implements VendaDiariaService {

	@Autowired
	private VendaDiariaRepository vendaDiariaRepository;
	
	@Override
	public JpaRepository<VendaDiaria, Long> getRepository() {
		return vendaDiariaRepository;
	}

}
