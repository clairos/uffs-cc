package com.br.projetointegrador.baraabbAPI.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("testeAPI")
public class HelloController {
	
	@GetMapping("/hello")
	public ResponseEntity<String> hello() {
		String string = "API barAABB RODANDO!";
		return ResponseEntity.status(HttpStatus.OK).body(string);
	}

}
