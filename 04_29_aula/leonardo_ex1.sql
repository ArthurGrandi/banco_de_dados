INSERT INTO pizzarias (nome, endereco, telefone)
    VALUES ('Pizzaria Esperança','Rua da Esperança, 10', '47 999878787'),
            ('Pizzaria Nova','Rua Nova, 200', '47 999444444') ;


INSERT INTO ingredientes (unidadeMedida, ingrediente)
    VALUEs ('kilo', 'queijo');


UPDATE pizzarias SET nome = 'Pizzaria Colombia'
        WHERE idPizzaria = 2;