package com.br.projetointegrador.baraabbAPI.service;

import java.util.List;
import java.util.Optional;

import com.br.projetointegrador.baraabbAPI.model.AbstractEntity;

public interface GenericService<T extends AbstractEntity> {

	public T save(T model);
	
	public List<T> findAll();
	
	public Optional<T> findById(Long id);
	
	public T update(T model);
	
	public void delete(Long id);
	
}