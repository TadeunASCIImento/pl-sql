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
