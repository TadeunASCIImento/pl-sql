
-- Criando uma procedure para buscar os empregados por
-- uma faixa salarial.
--
CREATE OR REPLACE PROCEDURE PROC_BUSCA_SALARIO_EMP_CARGO(
    P_SAL_INI EMPLOYEES.SALARY%TYPE,
    P_SAL_FIM EMPLOYEES.SALARY%TYPE)
    IS
    CURSOR C_EMP IS
      SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
        WHERE SALARY BETWEEN P_SAL_INI AND P_SAL_FIM;
    BEGIN
      FOR V_EMP IN C_EMP LOOP
      DBMS_OUTPUT.PUT_LINE('NOME: '||V_EMP.FIRST_NAME||' '||V_EMP.LAST_NAME||
        ' SALÁRIO: '||V_EMP.SALARY);
        END LOOP;
    END;
    -- Executa a procedure passando dois valores para o salário
    -- através de duas variáveis de substituição.
    SET SERVEROUTPUT ON
    EXECUTE PROC_BUSCA_SALARIO_EMP_CARGO(&SAL_1,&SAL_2);
