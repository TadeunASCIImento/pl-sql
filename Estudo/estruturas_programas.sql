--Estrutura do bloco de um programa em PL/SQL
DECLARE
--Nesta seção são declaradas constantes e variáveis e cursores.
BEGIN
--Nesta seção apresenta comandos SQL, estruturas de programação
--e blocos aninhados.

EXCEPTION
--Nesta seção são realizados os tratamentos de excessões e emissões
--de mensagens.
END;
--Indica o fim do programa.

--Exemplo_1 de programa PL/SQL
SET SERVEROUTPUT ON
DECLARE
V_MENSAGEM VARCHAR(50):='Olá Mundo PL/SQL';
BEGIN
DBMS_OUTPUT.PUT_LINE(V_MENSAGEM);
END;

--Exemplo_2 de programa PL/SQL
SET SERVEROUTPUT ON
DECLARE
soma NUMBER;
BEGIN
soma :=34+67;
dbms_output.put_line('Soma: '||soma);
EXCEPTION
WHEN OTHERS THEN
RAISE_APPLICATION_ERROR(-20001,'Erro ao realizar a soma');
END;


--Exemplo de blocos aninhados.
DECLARE
--.....
BEGIN
--.....
BEGIN
--.....
EXCEPTION
--.....
END;
--.....
EXCEPTION
--.....
END;

--Estrutura básica de uma procedure.
CREATE OR REPLACE PROCEDURE NOME_PROCEDURE
(ARGUMENTO_1 MODO TIPO_DADO,
....
ARGUMENTO_N MODO TIPO_DADO)IS
NOME_VARIAVEL_LOCAL_1 TIPO_DADO;
....
NOME_VARIAVEL_LOCAL_N TIPO_DADO;

BEGIN
.....
END;

--Chamando uma procedure.
EXECUTE NOME_PROCEDURE(ARGUMENTO_1,...ARGUMENTO_N);

--Estrutura básica de uma Function(Função).
CREATE OR REPLACE FUNCTION NOME_FUNCAO
(ARGUMENTO_1 MODO TIPO_DADO,
....
ARGUMENTO_N MODO TIPO_DADO)
RETURN TIPO_DADO IS NOME_VARIAVEL_LOCAL_1 TIPO_DADO;
....
NOME_VARIAVEL_LOCALN, TIPO_DADO;
BEGIN
....
END;

--Chamando uma function.
SELECT NOME_FUNCTION(ARGUMENTO_1,....ARGUMENTO_N)FROM DUAL;
--DUAL é o nome de uma pseudo-tabela utilizado para que o
--comando SELECT possa atender à sintaxe padrão da linguagem SQL.

-- Triggers
-- Sintaxe básica de um trigger(Gatilho):
CREATE OR REPLACE TRIGGER NOME_TRIGGER
BEFORE|AFTER INSERT|UPDATE OF NOME_COLUNA ON NOME_TABELA
FOR EACH ROW
BEGIN
...
END NOME_TRIGGER

--A instrução SELECT recupera os dados do banco para as variáveis
--PL/SQL. A sintaxe básica para isso é apresentada a seguir:
SELECT NOME_DA_COLUNA INTO NOME_DA_VARIAVEL
FROM NOME_DA_TABELA WHERE ...;
