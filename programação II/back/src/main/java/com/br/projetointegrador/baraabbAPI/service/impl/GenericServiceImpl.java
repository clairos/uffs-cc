package com.br.projetointegrador.baraabbAPI.service.impl;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.br.projetointegrador.baraabbAPI.model.AbstractEntity;
import com.br.projetointegrador.baraabbAPI.service.GenericService;

public abstract class GenericServiceImpl<T extends AbstractEntity> implements GenericService<T> {

	@Override
	public T save(T model) {
		return getRepository().save(model);
	}

	@Override
	public List<T> findAll() {
		return getRepository().findAll();
	}

	@Override
	public Optional<T> findById(Long id) {
		return getRepository().findById(id);
	}

	@Override
	public T update(T model) {
		if(Objects.isNull(model.getId())) {
			throw new RuntimeException("Entidade " + model + "sem ID para atualizacao");
		}
		return getRepository().save(model);
	}

	@Override
	public void delete(Long id) {
		getRepository().deleteById(id);
	}
	
	public abstract JpaRepository<T, Long> getRepository();

}
