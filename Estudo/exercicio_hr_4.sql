
-- Utilizando um cursor para recuperar apenas os dez primeiros registros
-- da tabela employees do schema HR do banco Oracle.
SET SERVEROUTPUT ON
    DECLARE
      CURSOR crs_emp IS
        SELECT first_name,last_name,salary FROM employees;
               vrl_first_name employees.first_name%TYPE;
               vrl_last_name employees.last_name%TYPE;
               vrl_salary employees.salary%TYPE;
               BEGIN
               OPEN crs_emp;
               LOOP
               FETCH crs_emp INTO vrl_first_name,vrl_last_name,vrl_salary;
                            dbms_output.put_line('Nome: '||vrl_first_name||
                      'Sobrenome: '||vrl_last_name||'Salário: '||vrl_salary);
                EXIT WHEN crs_emp%ROWCOUNT>=10 OR crs_emp%NOTFOUND;
                    END LOOP;
                    CLOSE crs_emp;
                    END;

-- Realizando Inner Join com a tabela Jobs para recuperar o cargo do funcionário.
--
SET SERVEROUTPUT ON
        DECLARE
        CURSOR crs_emp IS
        SELECT first_name,last_name,salary,job_title FROM employees
        INNER JOIN jobs ON jobs.job_id = employees.job_id;
                   vrl_first_name employees.first_name%TYPE;
                   vrl_last_name employees.last_name%TYPE;
                   vrl_salary employees.salary%TYPE;
                   vrl_cargo jobs.job_title%TYPE;
         BEGIN
              OPEN crs_emp;
              LOOP
                FETCH crs_emp INTO vrl_first_name,vrl_last_name,vrl_salary,vrl_cargo;
                      dbms_output.put_line(' Nome: '||vrl_first_name||
                     ' Sobrenome: '||vrl_last_name||' Salário: '||vrl_salary||' Cargo: '||vrl_cargo);
                EXIT WHEN crs_emp%ROWCOUNT>=10 OR crs_emp%NOTFOUND;
                     END LOOP;
                     CLOSE crs_emp;
                     END;
