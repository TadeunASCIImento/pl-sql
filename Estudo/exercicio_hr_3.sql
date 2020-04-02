--
-- Exercício (3) Seleciona nome,sobrenome,
-- departamento,endereco residencial e país onde empregado vive.
-- pesquisando através do id do empregado.

-- Foi criada uma procedure para execução da tarefa
-- que receberá um valor através de uma variável de substituição.
--
CREATE OR REPLACE PROCEDURE LOTACAO_EMPREGADO(MATRICULA NUMBER)IS
--
V_NOME EMPLOYEES.FIRST_NAME%TYPE;
V_SOBRENOME EMPLOYEES.LAST_NAME%TYPE;
V_DEPARTAMENTO DEPARTMENTS.DEPARTMENT_NAME%TYPE;
V_ENDERECO LOCATIONS.STREET_ADDRESS%TYPE;
V_PAIS COUNTRIES.COUNTRY_NAME%TYPE;
--
BEGIN
SELECT
    FIRST_NAME      AS NOME,
    LAST_NAME       AS SOBRENOME ,
    DEPARTMENT_NAME AS DEPARTAMENTO,
    STREET_ADDRESS  AS ENDEREÇO,
    COUNTRY_NAME    AS PAÍS
    INTO
        V_NOME,
        V_SOBRENOME,
        V_DEPARTAMENTO,
        V_ENDERECO,
        V_PAIS
            FROM
                EMPLOYEES
                INNER JOIN
                      DEPARTMENTS
                          ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
                INNER JOIN
                      LOCATIONS
                          ON LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID
                INNER JOIN COUNTRIES
                          ON COUNTRIES.COUNTRY_ID = LOCATIONS.COUNTRY_ID
                WHERE
                      EMPLOYEE_ID = MATRICULA;
                --
                          DBMS_OUTPUT.PUT_LINE
                          ('Nome: '||V_NOME||
                           ' Sobrenome: '||V_SOBRENOME||
                           ' Departamento: '||V_DEPARTAMENTO||
                           ' Endereço: '||V_ENDERECO||
                           ' País: '||V_PAIS);
                           --
                          EXCEPTION
                          WHEN
                                OTHERS
                           THEN
                          DBMS_OUTPUT.PUT_LINE(SQLERRM);
--
END;
--
--
-- Chamando a procedure que irá solicitar a matricula.
-- Informe um número de 100 até 206 conforme cadastrado na tabela employees
-- (&MATRICULA) variável de substituição receberá o valor informado.
EXECUTE LOTACAO_EMPREGADO(&MATRICULA);
