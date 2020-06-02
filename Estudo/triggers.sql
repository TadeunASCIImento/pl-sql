--    Programação para Banco de Dados -
--              02-06-2020
-- ------------- TRIGGERS -------------

-- CRIANDO AS TABELAS PARA TESTES
CREATE TABLE PRODUTO(
    codigo NUMBER(4) PRIMARY KEY,
    valor  NUMBER(7,2)NOT NULL
    );

INSERT INTO PRODUTO VALUES(1001,235.00);
INSERT INTO PRODUTO VALUES(1002,345.00);
INSERT INTO PRODUTO VALUES(1003,445.00);
INSERT INTO PRODUTO VALUES(1004,445.00);
COMMIT;

CREATE TABLE VALOR_PRODUTO (
    CODIGO NUMBER(4),
    VALOR_ANTERIOR NUMBER(7,2)NOT NULL,
    VALOR_NOVO NUMBER(7,2)NOT NULL
    );
COMMIT;
