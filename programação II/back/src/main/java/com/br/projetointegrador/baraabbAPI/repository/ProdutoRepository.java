package com.br.projetointegrador.baraabbAPI.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.br.projetointegrador.baraabbAPI.model.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {

}
