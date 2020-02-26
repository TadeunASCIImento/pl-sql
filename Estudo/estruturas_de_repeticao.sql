--ESTRUTURAS DE REPETIÇÃ(LOOP,WHILE-LOOP e FOR-LOOP).

--Sintaxe básica da instrução LOOP.
LOOP
<INSTRUÇÕES>
EXIT [WHEN]
END LOOP;

--Exemplos de utilização da instrução LOOP.
--Imprimindo números de 1 á 99.
SET SERVEROUTPUT ON
DECLARE
vrl_contador NUMBER(3) := 1;
vrl_qtd_par NUMBER(4):= 0;
vrl_qtd_impar NUMBER(4):= 0;
BEGIN
LOOP
CASE
WHEN (MOD(vrl_contador,2) = 0)THEN
DBMS_OUTPUT.PUT_LINE('O número '||vrl_contador||' é Par.');
vrl_qtd_par := vrl_qtd_par + 1;
WHEN (MOD(vrl_contador,2) <> 0)THEN
DBMS_OUTPUT.PUT_LINE('O número '||vrl_contador||' é Impar.');
vrl_qtd_impar := vrl_qtd_impar + 1;
ELSE
DBMS_OUTPUT.PUT_LINE('Número inválido, não é um número inteiro');
END CASE;
vrl_contador:= vrl_contador+1;
EXIT WHEN vrl_contador > 99;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Quantidade de números pares: '||vrl_qtd_par);
DBMS_OUTPUT.PUT_LINE('Quantidade de números impares: '||vrl_qtd_impar);
END;
