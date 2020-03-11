
--EXCEPTIONS(Tratamento de erros)

--Sintaxe básica de uma exception pré-definida.
/*
DECLARE
    ...
BEGIN
    ...
EXCEPTION
WHEN NOME_DA_EXEÇÃO THEN
    RELAÇÃO_COMANDOS;
WHEN NOME_DA_EXCEÇÃO THEN
    RELAÇÃO_DE_COMANDOS;
    ...
END;
*/

-- Exemplo de tratamento de erros(exception Pré-definida)
SET SERVEROUTPUT ON
DECLARE
VRL_MATRICULA ALUNOS.MATRICULA%TYPE :=2217202020;
VRL_NOME ALUNOS.NOME%TYPE :='Tadeu do Nascimento';
BEGIN
SELECT MATRICULA, NOME INTO VRL_MATRICULA,VRL_NOME
    FROM ALUNOS
    WHERE MATRICULA = VRL_MATRICULA;
    DBMS_OUTPUT.PUT_LINE('MATRICULA: '||VRL_MATRICULA||' NOME: '||VRL_NOME);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Aluno não localizado no banco de dados');
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Mais de um aluno com este número de matricula');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro desconchecido');
END;

-- Exemplo de tratamento de erros(exception definida pelo usuário)

/*Sintaxe básica de exception definida pelo usuário
SET SERVEROUTPUT ON
DECLARE
    NOME_DA_EXEPTION;
BEGIN
...
    IF ... THEN
    RAISE NOME_DA_EXCEPTION;
    END IF;
...
    EXCEPTION
    WHEN NOME_DA_EXCEPTION THEN
    RELAÇÃO_DE_COMANDOS
END;
/
*/

-- Exemplo de tratamento de erro(execption definida pelo usuário
SET SERVEROUTPUT ON
DECLARE
  VRL_CONTADOR NUMBER(4);
  TURMA_COMPLETA EXCEPTION;
  VRL_MATRICULA CHAR(10):=2217202029;
  VRL_NOME VARCHAR2(50):='Sônia Santos';
BEGIN
SELECT COUNT(MATRICULA)INTO VRL_CONTADOR FROM ALUNOS;
    IF VRL_CONTADOR >= 5 THEN RAISE TURMA_COMPLETA;
    ELSE INSERT INTO ALUNOS VALUES(VRL_MATRICULA,VRL_NOME);
    DBMS_OUTPUT.PUT_LINE('Incluído com sucesso!');
END IF;
    EXCEPTION
    WHEN TURMA_COMPLETA THEN
    DBMS_OUTPUT.PUT_LINE('Número de alunos para esta turma está esgotado!');
END;
/
