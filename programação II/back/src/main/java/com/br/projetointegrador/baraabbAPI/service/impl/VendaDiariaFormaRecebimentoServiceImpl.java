package com.br.projetointegrador.baraabbAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.br.projetointegrador.baraabbAPI.model.VendaDiariaFormaRecebimento;
import com.br.projetointegrador.baraabbAPI.repository.VendaDiariaFormaRecebimentoRepository;
import com.br.projetointegrador.baraabbAPI.service.VendaDiariaFormaRecebimentoService;

@Service
public class VendaDiariaFormaRecebimentoServiceImpl extends GenericServiceImpl<VendaDiariaFormaRecebimento> implements VendaDiariaFormaRecebimentoService {
	
	@Autowired
	private VendaDiariaFormaRecebimentoRepository diariaFormaRecebimentoRepository;
	
	@Override
	public JpaRepository<VendaDiariaFormaRecebimento, Long> getRepository() {
		return diariaFormaRecebimentoRepository;
	}

	

}
