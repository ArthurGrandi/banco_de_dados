-- CONSULTADNO APENAS UMA TABELA

SELECT * 
FROM pizzas;

--

SELECT p.*
	FROM pizzas p;

--

SELECT p.idpizza, p.nome
	FROM pizzas p;

--

SELECT pi.idpizza, pi.nome AS pizza
	FROM pizzas pi;

--

SELECT * 
	FROM clientes
		bairros

	WHERE clientes.idbairro = bairros.idbairro; - - RESTRIÇÃO DE INTEGRIDADE (RI)

-- CONSULTANDO >1 TABELA

SELECT * 
	FROM clientes; -- 7 registros

SELECT * 
	FROM bairros; -- 3 registros

SELECT * 
	FROM clientes,
		 bairros; -- 21 registros
-- ERRO: Faltou a clausula WHERE
-- NESSE CASO VÃO HAVER 21 REGISTROS

-- CORRIGINDO:

SELECT *
	FROM clientes,
		 bairros
	WHERE clientes.idbairro = bairros.idbairro;

-- RETORNA 7 REGISTROS (CLIENTES COM O BAIRRO)

SELECT idCliente, cliente, bairro, tempoEspera

	FROM clientes,
		 bairros

	WHERE clientes.idbairro = bairros.idbairro;

-- OU

SELECT c.idCliente, c.cliente, 
	   b.idbairro AS codbairro, b.bairro, b.tempoEspera

	FROM clientes c,
		 bairros b
		 
	WHERE c.idbairro = b.idbairro;

-- SITUAÇÃO ONDE OCORREM MUITOS ERROS

SELECT c.cliente, b.bairro
	
	FROM clientes c	-- NÃO COLOCOU A VIRGULA
		 bairros b

	WHERE b.idbairro = c.idcliente; 
		-- b.PK		-- c.FK
	-- ERRO: Relacionar duas chaves primarias

-- CORRIGINDO

SELECT c.cliente, b.bairro
	
	FROM clientes c,	
		 bairros b

	WHERE b.idbairro = c.idbairro; -- RESTRIÇÃO DE INTEGRIDADE
		AND b.bairro = 'Barra'; -- FILTRO 

