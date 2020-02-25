--INSTRUÇÕES SELECT, INSERT, UPDATE E DELETE.

--A instrução SELECT recupera os dados do banco para as variáveis
--PL/SQL. A sintaxe básica para isso é apresentada a seguir:
SELECT NOME_DA_COLUNA INTO NOME_DA_VARIAVEL
FROM NOME_DA_TABELA WHERE ...;

--Instrução INSERT.
DECLARE
VARIAVEL_1 TIPO_DADO :='VALOR_DA_VARIAVEL';
...
VARIAVEL_N TIPO_DADO :='VALOR_DA_VARIAVEL';
BEGIN
INSERT INTO NOME_TABELA (NOME_COLUNA_1,...NOME_COLUNA_N)
VALUES(VARIAVEL_1,...VARIAVEL_N);
END;

--Instrução UPDATE.
DECLARE
VARIAVEL_1 TIPO_DADO :='VALOR_DA_VARIAVEL';
VARIAVEL_2 TIPO_DADO :='VALOR_DA_VARIAVEL';
BEGIN
UPDATE NOME_TABELA SET NOME_COLUNA = VARIAVEL_1 WHERE COLUNA_REFERENCIA = VARIAVEL_2;
END;

--Instrução DELETE.
DECLARE
VARIAVEL_1 TIPO_DADO:='VALOR_DA_VARIAVEL';
BEGIN
DELETE FROM NOME_TABELA WHERE COLUNA_REFERENCIA = VARIAVEL_1;
END;


--Exemplo_01
--Tabela ALUNOS criada para realização dos exemplos.
CREATE TABLE ALUNOS(
matricula CHAR(10)CONSTRAINT mt_al_pk PRIMARY KEY,
nome VARCHAR2(50)CONSTRAINT nm_al_nn NOT NULL
);
--Inseridos registros na tabela para realização dos testes.
INSERT INTO ALUNOS(matricula,nome) VALUES (2217202013,'Tadeu do Nascimento');
INSERT INTO ALUNOS(matricula,nome) VALUES(2217202014,'Beatriz Bernardes Lima');
INSERT INTO ALUNOS(matricula,nome) VALUES(2217202015,'Claudia Alves de Souza');

--Exemplo de comando SELECT em PL/SQL.
--Exemplo_01
SET SERVEROUTPUT ON
DECLARE
VRL_MATRICULA CHAR(10) :='2217202013';
VRL_NOME VARCHAR2(50);
BEGIN
SELECT NOME INTO VRL_NOME FROM ALUNOS WHERE MATRICULA = VRL_MATRICULA;
DBMS_OUTPUT.PUT_LINE('O nome do Aluno é: ' ||VRL_NOME);
END;

--Exemplo_02
SET SERVEROUTPUT ON
DECLARE
VRL_ALUNO ALUNOS%ROWTYPE;
BEGIN
VRL_ALUNO.MATRICULA :='2217202014';
SELECT NOME INTO VRL_ALUNO.NOME FROM ALUNOS
WHERE MATRICULA = VRL_ALUNO.MATRICULA;
DBMS_OUTPUT.PUT_LINE('O nome do Aluno(a) é :'||VRL_ALUNO.NOME);
END;

--Exemplo de comando INSERT em PL/SQL.
--Exemplo_01
SET SERVEROUTPUT ON
DECLARE
VRL_MATRICULA CHAR(10) := '2217202016';
VRL_NOME VARCHAR(50) := 'Daniela Dorneles';
BEGIN
INSERT INTO ALUNOS(MATRICULA,NOME)VALUES(VRL_MATRICULA,VRL_NOME);
END;

--Exemplo de comando UPDATE em PL/SQL.
--Exemplo_01
SET SERVEROUTPUT ON
DECLARE
VRL_MATRICULA CHAR(10):='2217202016';
VRL_NOME VARCHAR2(50) :='Daniela Dornelles da Silva';
BEGIN
UPDATE ALUNOS SET NOME = VRL_NOME WHERE MATRICULA = VRL_MATRICULA;
END;

-- Exemplo de comando DELETE em PL/SQL.
--Exemplo_01
SET SERVEROUTPUT ON
DECLARE
VRL_MATRICULA CHAR(10):='2217202016';
BEGIN
DELETE FROM ALUNOS WHERE MATRICULA = VRL_MATRICULA;
END;