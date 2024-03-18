-- Populando a tabela BARAABB_CATEGORIAPRODUTO
INSERT INTO BARAABB_CATEGORIAPRODUTO (descricao, percentualMargem, dataCadastro)
VALUES
  ('Bebidas Alcoólicas', 20.0, CURRENT_DATE),
  ('Bebidas Não Alcoólicas', 25.0, CURRENT_DATE),
  ('Alimentos', 15.0, CURRENT_DATE);

-- Populando a tabela BARAABB_CLIENTE 10
INSERT INTO BARAABB_CLIENTE (nome, telefone, email, observacoes, dataCadastro)
VALUES
  ('João da Silva', '(11) 9999-8888', 'joao.silva@example.com', 'Cliente VIP', CURRENT_DATE),
  ('Maria Souza', '(21) 9876-5432', 'maria.souza@example.com', NULL, CURRENT_DATE),
  ('Pedro Santos', '(81) 3333-1111', 'pedro.santos@example.com', NULL, CURRENT_DATE),
  ('Ana Oliveira', '(47) 5555-2222', 'ana.oliveira@example.com', NULL, CURRENT_DATE),
  ('Carlos Ferreira', '(34) 7777-9999', 'carlos.ferreira@example.com', 'Cliente preferencial', CURRENT_DATE),
  ('Mariana Costa', '(81) 8888-5555', 'mariana.costa@example.com', 'Cliente novo', CURRENT_DATE),
  ('Lucas Rodrigues', '(21) 2222-4444', 'lucas.rodrigues@example.com', NULL, CURRENT_DATE),
  ('Julia Silva', '(11) 6666-3333', 'julia.silva@example.com', NULL, CURRENT_DATE),
  ('Gustavo Santos', '(84) 3333-7777', 'gustavo.santos@example.com', NULL, CURRENT_DATE),
  ('Isabela Sousa', '(19) 7777-1111', 'isabela.sousa@example.com', 'Cliente VIP', CURRENT_DATE);

-- Populando a tabela BARAABB_CLIENTESINADIMPLENTES 5
INSERT INTO BARAABB_CLIENTESINADIMPLENTES (cliente, valorTotalComanda, statusPagamento, dataCompra, dataAcerto, observacao)
VALUES
  (1, 50.00, 'Em aberto', CURRENT_DATE, NULL, 'Cliente com histórico de atrasos'),
  (3, 25.00, 'Em aberto', CURRENT_DATE, NULL, NULL),
  (1, 18.00, 'Em aberto', CURRENT_DATE, NULL, 'Cliente com histórico de atrasos'),
  (2, 75.50, 'Em aberto', CURRENT_DATE, NULL, 'Cliente inadimplente'),
  (5, 35.00, 'Em aberto', CURRENT_DATE, NULL, NULL);

-- Populando a tabela BARAABB_TIPOUSUARIO
INSERT INTO BARAABB_TIPOUSUARIO (descricao)
VALUES
  ('Administrador'),
  ('Vendedor'),
  ('Repositor');

-- Populando a tabela BARAABB_USUARIO
INSERT INTO BARAABB_USUARIO (senha, email, login, tipoUsuario)
VALUES
  ('senha_admin123', 'admin@example.com', 'admin', 1),
  ('senha_vendedor456', 'vendedor1@example.com', 'vendedor1', 2),
  ('senha_vendedor789', 'vendedor2@example.com', 'vendedor2', 2),
  ('senha_repositor123', 'repositor1@example.com', 'repositor1', 3);

-- Populando a tabela BARAABB_LISTACOMPRA
INSERT INTO BARAABB_LISTACOMPRA (usuario)
VALUES
  (1),
  (4);

-- Populando a tabela BARAABB_PRODUTO 10
INSERT INTO BARAABB_PRODUTO (categoriaProduto, descricao, precoCompra, precoVenda, quantidadeEstoque, usuarioCadastro, dataCadastro)
VALUES
  (1, 'Whisky Escocês', 100.00, 200.00, 20, 2, CURRENT_DATE),
  (1, 'Vodka Importada', 50.00, 100.00, 30, 2, CURRENT_DATE),
  (1, 'Cerveja Artesanal IPA', 10.00, 25.00, 100, 2, CURRENT_DATE),
  (2, 'Refrigerante Cola', 5.00, 10.00, 50, 2, CURRENT_DATE),
  (2, 'Água Mineral 500ml', 2.00, 5.00, 80, 2, CURRENT_DATE),
  (3, 'Amendoim Torrado', 3.00, 7.00, 40, 2, CURRENT_DATE),
  (3, 'Tábua de Frios', 15.00, 30.00, 10, 2, CURRENT_DATE),
  (3, 'Porção de Batata Frita', 20.00, 40.00, 15, 2, CURRENT_DATE),
  (1, 'Gin Nacional', 30.00, 60.00, 25, 2, CURRENT_DATE),
  (2, 'Suco Natural de Laranja', 8.00, 15.00, 30, 2, CURRENT_DATE);

-- Populando a tabela BARAABB_LISTACOMPRAPRODUTO
INSERT INTO BARAABB_LISTACOMPRAPRODUTO (produto, listaCompra)
VALUES
  (1, 1),
  (2, 1),
  (3, 2);

-- Populando a tabela BARAABB_VENDADIARIA 10
INSERT INTO BARAABB_VENDADIARIA (cliente, usuario, valorTotalBruto, valorTotalLiquido, dataCadastro)
VALUES
  (10, 2, 500.00, 450.00, CURRENT_DATE),
  (6, 2, 300.00, 270.00, CURRENT_DATE),
  (1, 3, 400.00, 370.00, CURRENT_DATE),
  (1, 3, 300.00, 270.00, CURRENT_DATE),
  (3, 2, 500.00, 470.00, CURRENT_DATE),
  (2, 2, 800.00, 770.00, CURRENT_DATE),
  (9, 3, 90.00, 60.00, CURRENT_DATE),
  (9, 2, 40.00, 10.00, CURRENT_DATE),
  (10, 2, 110.00, 80.00, CURRENT_DATE),
  (7, 3, 95.00, 65.00, CURRENT_DATE);

INSERT INTO BARAABB_FORMAPAGAMENTO (descricao) VALUES
  ('Dinheiro'),
  ('Cartão de crédito'),
  ('Cartão de débito'),
  ('Pix'),
  ('Boleto bancário');

-- Populando a tabela BARAABB_VENDADIARIAFORMARECEB
INSERT INTO BARAABB_VENDADIARIAFORMARECEB (formaPagamento, valorRecebido, vendaDiaria)
VALUES
  (1, 100.00, 1),
  (2, 200.00, 2),
  (3, 150.00, 3),
  (3, 50.00, 4),
  (1, 100.00, 5),
  (2, 75.00, 6),
  (1, 30.00, 7),
  (4, 90.00, 8),
  (5, 100.00, 9),
  (1, 20.00, 10);

-- Populando a tabela BARAABB_VENDADIARIAPRODUTO 10
INSERT INTO BARAABB_VENDADIARIAPRODUTO (produto, vendaDiaria, valorTotalVendido, quantidadeTotalVendida)
VALUES
  (1, 1, 1200.00, 1),
  (2, 2, 500.00, 2),
  (7, 3, 120.00, 3),
  (4, 4, 180.00, 2),
  (5, 5, 150.00, 3),
  (6, 6, 50.00, 5),
  (3, 7, 80.00, 2),
  (3, 8, 120.00, 3),
  (9, 9, 180.00, 3),
  (7, 10, 30.00, 1);
