--ESTRUTURAS DE REPETIÇÃ(LOOP,WHILE-LOOP e FOR-LOOP).

--instrução LOOP.

--Sintaxe básica da instrução LOOP.
LOOP
<INSTRUÇÕES>
EXIT [WHEN]
END LOOP;

--Exemplos de utilização da instrução LOOP.

--Exemplo_1.
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

--Instrução WHILE-LOOP.

--Sintaxe básica da instrução WHILE-LOOP
WHILE <CONDIÇÃO> LOOP
    <INSTRUÇÕES>
END LOOP;

--Exemplo de utilização da instrução WHILE-LOOP.

--Exemplo_1.
--Exibir uma contagem de 1 á 100.
SET SERVEROUTPUT ON
DECLARE
vrl_contador NUMBER(3) := 1;
BEGIN
WHILE vrl_contador <= 100 LOOP
DBMS_OUTPUT.PUT_LINE(vrl_contador);
vrl_contador := vrl_contador+1;
END LOOP;
END;

--Instrução FOR-LOOP.
--Permite um número definido de iterações.

--Sintaxe básica da instrução FOR-LOOP.
FOR <CONTADOR_DE_ITERAÇÕES> IN <LIMITE_INFERIOR> ..<LIMITE_SUPERIOR>LOOP
<INSTRUÇÕES>
END LOOP;

--Exemplo de utilização da instrução FOR-LOOP.

--Exemplo_1.
--Exibir uma contagem de 1 á 100.
SET SERVEROUT ON
BEGIN
 FOR vrl_contador IN 1..100 LOOP
  DBMS_OUTPUT.PUT_LINE(vrl_contador);
END LOOP;
END;

--Palavra chave REVERSE(realiza a iteração em sentido inverso).

--Exemplo_1
--Exibir uma contagem regressiva de 100 á 1.
SET SERVEROUT ON
BEGIN
 FOR vrl_contador IN REVERSE 1..100 LOOP
  DBMS_OUTPUT.PUT_LINE(vrl_contador);
END LOOP;
END;
