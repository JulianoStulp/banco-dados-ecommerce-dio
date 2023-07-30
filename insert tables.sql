USE ECOMMERCE;
SELECT * FROM CLIENTE;
SELECT * FROM PRODUTO;
SELECT * FROM ESTOQUE;
SELECT * FROM PRODUTO_ESTOQUE;
SELECT * FROM VENDEDOR;
SELECT * FROM PRODUTO_VENDEDOR;
SELECT * FROM FORNECEDOR;
SELECT * FROM PRODUTO_FORNECEDOR;
SELECT * FROM PEDIDO;
SELECT * FROM PEDIDO_ITEM;
--
INSERT INTO CLIENTE (NOME, SOBRENOME, CPF, ENDERECO, DATA_NASCIMENTO) VALUES ('JOAO', 'BORGES', '12345678910', 'RUA 10', STR_TO_DATE('1,6,2013','%d,%m,%Y')),
																			 ('PEDRO', 'SILVA', '12345678911', 'RUA 11', STR_TO_DATE('2,2,2001','%d,%m,%Y')),
																			 ('GUILHERME', 'SENEGAL', '12345678912', 'RUA 12', STR_TO_DATE('3,8,2010','%d,%m,%Y')),
																			 ('JOANA', 'LOPES', '12345678913', 'RUA 13', STR_TO_DATE('20,1,2005','%d,%m,%Y')),
																			 ('MARIA', 'VERAZ', '12345678914', 'RUA 14', STR_TO_DATE('29,10,1995','%d,%m,%Y'));
-- CATEGORIA ENUM('ELETRONICO','MOVEIS','ROUPAS')
INSERT INTO PRODUTO (DESCRICAO, PRECO_UNITARIO, CATEGORIA) VALUES ('MEIAS', 1.99, 'ROUPAS'),
																  ('CELULAR', 1090.50, 'ELETRONICO'),
                                                                  ('SOFÁ', 1500, 'MOVEIS'),
                                                                  ('TV SAMSUNG', 2700.99, 'ELETRONICO'),
                                                                  ('MESA', 740.42, 'MOVEIS');
INSERT INTO ESTOQUE (DESCRICAO) VALUES ('ALMOX 1'), 
                                       ('ALMOX 2'), 
                                       ('ALMOX 3');                                                                 
INSERT INTO PRODUTO_ESTOQUE (ESTOQUE_ID, PRODUTO_ID, QUANTIDADE) VALUES (1, 1, 6),
																		(2, 2, 3),
																		(3, 3, 2),
																		(1, 4, 2),
																		(2, 5, 4),
																		(3, 5, 3);
INSERT INTO VENDEDOR (DESCRICAO, ENDERECO, COMISSAO) VALUES ('VALERIA', 'AV 12', 5),
															('JACK', 'AV 15', 3),
                                                            ('VITOR', 'AV 18', 7);
INSERT INTO PRODUTO_VENDEDOR (PRODUTO_ID, VENDEDOR_ID, QUANTIDADE) VALUES (1, 1, 3),
																		  (2, 2, 2),
                                                                          (4, 3, 1),
                                                                          (5, 2, 3);
INSERT INTO FORNECEDOR (DESCRICAO, CNPJ) VALUES ('OBJETOS DIVERSOS', '987654321012345'),
												('PONTO 10', '987654321012342');
INSERT INTO PRODUTO_FORNECEDOR (PRODUTO_ID, FORNECEDOR_ID, QUANTIDADE) VALUES (1, 1, 6),
																			  (2, 2, 3),
                                                                              (3, 2, 2),
                                                                              (4, 1, 2);
-- ENUM('Em andamento', 'Em Processamento', 'Faturado')
INSERT INTO PEDIDO (CLIENTE_ID, DESCRICAO, STATUS, VALOR_TOTAL, FRETE) VALUES (1, 'PEDIDO 12556', 'Em andamento', 3456, 'CIF'),
																			  (2, 'PEDIDO 6547423', default, 6456, 'CIF'),
                                                                              (3, 'PEDIDO 6376575', 'Em andamento', 23465, 'FOB'),
                                                                              (4, 'PEDIDO 346346', 'Faturado', 23455, 'CIF'),
                                                                              (5, 'PEDIDO 56462', default, 65464, 'FOB'),
                                                                              (2, 'PEDIDO 4353778', 'Em Processamento', 34345, 'CIF'),
                                                                              (1, 'PEDIDO 234265', 'Faturado', 5542, 'FOB'),
                                                                              (5, 'PEDIDO 126767', 'Faturado', 3434, 'FOB'),
                                                                              (3, 'PEDIDO 6576785', 'Em Processamento', 3345, 'CIF'),
                                                                              (1, 'PEDIDO 765345', 'Faturado', 7766, 'FOB');
INSERT INTO PEDIDO_ITEM (PRODUTO_ID, PEDIDO_ID, QUANTIDADE) VALUES (1, 1, 2),
																   (2, 2, 1),
																   (2, 3, 3),
																   (3, 4, 4),
																   (3, 5, 1),
																   (4, 6, 3),
																   (5, 7, 1),
																   (4, 8, 2),
																   (1, 9, 1),
																   (5, 10, 4),
																   (4, 5, 2),
																   (1, 1, 3);






