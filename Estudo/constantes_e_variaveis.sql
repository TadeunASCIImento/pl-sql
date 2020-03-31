--Constantes e variáveis em PL/SQL.
--Exemplo_01 Declarando uma constante.
DECLARE
PI CONSTANT NUMBER(3,2):= 3.1415;
RAIO CONSTANT NUMBER(9):= 5.456;

--Exemplo_02 Declaração de variáveis.
VALOR_1 NUMBER(2) :=15;
VALOR_2 NUMBER(2) NOT NULL := 10;
QUANT NUMBER(2):= 10;
VALOR NUMBER(5,2) := 250.45;
TOTAL NUMBER(6,2) := QUANT * VALOR;

--Herança de Tipo e tamanho.
--Exemplo_01.
VARIAVEL_1 NUMBER(2);

--Aqui VARIAVEL_2 herda o mesmo tipo de VARIAVEL_1.
VARIAVEL_2 VARIAVEL_1%TYPE;

--Herdando tipo de coluna de uma tabela.
--Exemplo_02.
--VARIAVEL_NOME herdou o mesmo Tipo da coluna NOME_CLIENTE
--da tabela CLIENTE.
VARIAVEL_NOME cliente.nome_cliente%TYPE;

--Herdando o tipo de uma linha inteira de uma tabela.
VARIAVEL_CLIENTE CLIENTE%ROWTYPE;

-- VARIÁVEIS BIND

-- Declara uma variável
VARIABLE MENSAGEM VARCHAR2(200);
-- Usando a variável declarada anteriormente
SET AUTOPRINT ON
SET SERVEROUTPUT ON
BEGIN
:MENSAGEM :='Aprendendo PL/SQL';
END;
/
-- Imprime o conteúdo da variável
PRINT MENSAGEM;
-- Mostra todas as variáveis na sessão corrente
VAR;


-- VARIÁVEIS DE SUBSTITUIÇÃO

-- Declara uma variável de substituição
DEFINE MATRICULA_EMPREGADO = '7370';

-- Mostra o valor da variável
DEFINE MATRICULA_EMPREGADO;

-- Exclui definição da variável
UNDEFINE MATRICULA_EMPREGADO;
