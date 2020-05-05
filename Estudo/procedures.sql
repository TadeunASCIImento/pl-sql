------------------------------------------------------
-- aula programação para banco de dados
--            05/05/2020
--            PROCEDURES
------------------------------------------------------
-- Cria uma procedure nomeada como PROC_SOMA.
CREATE OR REPLACE PROCEDURE PROC_SOMA
(P_1 IN NUMBER,P_2 IN NUMBER,P_T OUT NUMBER)IS
BEGIN
    P_T := P_1 + P_2;
    DBMS_OUTPUT.PUT_LINE(P_1||' + '||P_2||' = '||P_T);
    END PROC_SOMA;
EXECUTE PROC_SOMA;

-- Exibe o código da procedure
SELECT TEXT FROM USER_SOURCE
    WHERE NAME = 'PROC_SOMA'ORDER BY LINE;
------------------------------------------------------
--  CHMANDO A PROCEDURE DE SOMA
SET SERVEROUTPUT ON
DECLARE
V_1  NUMBER :=3;
V_2  NUMBER  :=5;
V_T  NUMBER;
BEGIN
PROC_SOMA(V_1,V_2,V_T);
END;
---------------------------------------------------------
-- Cria uma procedure para recuperar o aluno pela matricula.
CREATE OR REPLACE PROCEDURE PROC_NOME_ALUNO
    (P_RA IN VARCHAR)
    IS
        V_NOME VARCHAR2(50);
    BEGIN
        SELECT NOME INTO V_NOME
    FROM ALUNOS
        WHERE MATRICULA = P_RA;
                DBMS_OUTPUT.PUT_LINE(V_NOME);
        END PROC_NOME_ALUNO;
    -- executa a procedure.
    EXEC PROC_NOME_ALUNO(2217202013);
-------------------------------------------------------------
