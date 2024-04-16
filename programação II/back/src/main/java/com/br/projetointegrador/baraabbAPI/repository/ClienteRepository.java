package com.br.projetointegrador.baraabbAPI.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.br.projetointegrador.baraabbAPI.model.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long> {

}
