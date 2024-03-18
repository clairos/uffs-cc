package com.br.projetointegrador.baraabbAPI.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.br.projetointegrador.baraabbAPI.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

}
