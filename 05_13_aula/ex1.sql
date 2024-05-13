-- Aula destinada à prática de instruções SQL/DDL e DML.

-- Para esta aula, foi preparado um exercício dirigido, que está disponível no Google Drive.

-- OBS.: PRESTEM ATENÇÃO NAS DICAS DO EXERCÍCIO E COMENTÁRIOS NOS CÓDIGOS DE EXEMPLO. Repliquem as boas práticas nos seus exercícios e no Trabalho final.

-- Arquivos a serem utilizados:

-- BD_I-Aula010e-ProjetoFisico-Pratica SQLite.pdf - descrição do exercício

-- BD_I-Aula010e-ClinicaMedica-SQLite.rar - arquivos com SQL  para consulta.

-- CONSULTA ENVOLVENDO UMA TABELA DE RELACIONAMENTO
-- LISTA DE CARDAPIOS E PIZZAS

SELECT c.descricao AS 'Cardápio', 
       p.idpizza, p.nome AS 'pizza'

    FROM cardapio c,
         composicaço co,
         pizza p,

    WHERE c.idCardapio = co.idCardapio

        AND co.idPizza = p.idPizza;

    ORDER BY c.descricao, p.nome;

-- LISTAR A RECEITA DE UMA PIZZA

SELECT p.nome, i.ingrediente, ip.ingredientesPizza, i.unidadeMedia

    FROM pizzas p,
         ingredientesPizza ip,
         ingredientes I

    WHERE p.idpizza = ip.ingredientesPizza
