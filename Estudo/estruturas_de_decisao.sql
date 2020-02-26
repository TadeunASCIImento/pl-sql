
-- ESTRUTURAS DE DECISÃO IF-THEN-ELSE.

--Sintaxe básica da instrução.
IF <EXPRESSÃO> THEN
   <INSTRUÇÕES>;
   ELSIF <EXPRESSÃO> THEN
   <INSTRUÇÕES>
   ELSE
   <INSTRUÇÕES>;
END IF;

--Exemplos de utilização das estruturas de decisão.
--Exemplo_1
--Verifica paridade de um número usando A função MOD.
SET SERVEROUTPUT ON
DECLARE
VRL_NUMERO NUMBER(2):= 26;
BEGIN
IF MOD(VRL_NUMERO,2) = 0 THEN
DBMS_OUTPUT.PUT_LINE('O numero '||VRL_NUMERO||' é Par.');
ELSE
DBMS_OUTPUT.PUT_LINE('O numero '||VRL_NUMERO||' é Impar.');
END IF;
END;

--Exemplo_2
--Estrutura de decisão IF-THEN-ELSE.
--Verifica se o ano corresponde é um ano bissexto.
DECLARE
VRL_ANO NUMBER(4):= 2020;
BEGIN
IF(MOD(VRL_ANO,4) = 0 AND MOD(VRL_ANO,100) !=0)
OR (MOD(VRL_ANO,400) = 0 )THEN
DBMS_OUTPUT.PUT_LINE('O ano '||VRL_ANO||' é Bissexto.');
ELSE
DBMS_OUTPUT.PUT_LINE('O ano '||VRL_ANO||' não é Bissexto.');
END IF;
END;

--Exemplo_3
--Calculando a média de alunos de acordo com uma tabela "NOTAS".
--Considerando apenas as duas maiores notas para o cálculo.
--Onde o aluno será reprovado se média menor que 7 e aprovado se média igual ou maior que 7.
--Porém reprovado por faltas caso tenha mais de 25% de faltas em qualquer caso.

--Criando a tabela NOTAS para realização do exemplo_3.
CREATE TABLE notas(
matricula_aluno NUMBER(20),
codigo_disciplina NUMBER(4),
nota_1 NUMBER(3,1)CONSTRAINT nt1_aln_nn NOT NULL,
nota_2 NUMBER(3,1)CONSTRAINT nt2_aln_nn NOT NULL,
nota_3 NUMBER(3,1)CONSTRAINT nt3_aln_nn NOT NULL,
numero_aulas NUMBER(2)CONSTRAINT nmr_aul_nn NOT NULL,
numero_faltas NUMBER(2)CONSTRAINT nmr_flt_nn NOT NULL,
CONSTRAINT notas_pk PRIMARY KEY(matricula_aluno,codigo_disciplina)
);

--Inserindo dados na tabela.
INSERT INTO notas VALUES(2217202013,1122,9,10,8.7,40,5);
INSERT INTO notas VALUES(2217202014,1122,8,8,10.7,40,20);
INSERT INTO notas VALUES(2217202015,1122,7,10,9.7,40,10);
INSERT INTO notas VALUES(2217202016,1122,6,10,8.7,40,4);

SET SERVEROUTPUT ON
DECLARE
vrl_notas notas%ROWTYPE;
vrl_media NUMBER(3,2);

BEGIN
SELECT * INTO vrl_notas FROM notas WHERE matricula_aluno = 2217202013;
IF(vrl_notas.numero_faltas/vrl_notas.numero_aulas >0.25)THEN
DBMS_OUTPUT.PUT_LINE('Reprovado por faltas');
ELSE
IF(vrl_notas.nota_1 >= vrl_notas.nota_3)AND(vrl_notas.nota_2 >= vrl_notas.nota_3)
THEN vrl_media := (vrl_notas.nota_1+vrl_notas.nota_2)/2;
ELSIF(vrl_notas.nota_2 >= vrl_notas.nota_1)THEN
vrl_media := (vrl_notas.nota_2+vrl_notas.nota_3)/2;
ELSE vrl_media := (vrl_notas.nota_1+vrl_notas.nota_3)/2;
END IF;
IF(vrl_media < 7) THEN
DBMS_OUTPUT.PUT_LINE('Aluno reprovado por média insuficiente');
ELSE
DBMS_OUTPUT.PUT_LINE('Aluno aprovado');
END IF;
END IF;
DBMS_OUTPUT.PUT_LINE('Média final: '||vrl_media);
END;
     
