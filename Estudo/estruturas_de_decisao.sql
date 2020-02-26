
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



-- ESTRUTURA DE DECISÃO CASE.

--Na ausência da cláusula ELSE e a expressão de teste não
--corresponda a nenhum dos valores de teste, um erro CASE_NOT_FOUND(ORA-6592) é levantado.
--Sintaxe básica da estrutura.
CASE <VARIAVEL> --Variável ou expressão a ser testada.
WHEN VALOR_1 --Valor para comparação.
THEN <INSTRUÇÕES>
WHEN VALOR_2
THEN <INSTRUÇÕSES>
...
WHEN VALOR_N
THEN <INSTRUÇÕES>
ELSE --Opcional
    <INSTRUÇÕES>
END CASE;

--Exemplos de utilização da estrutura CASE.

--Exemplo_1
DECLARE
vrl_sigla VARCHAR2(10):='CC';
vrl_curso VARCHAR2(30);
BEGIN
CASE vrl_sigla
WHEN 'SI' THEN
vrl_curso := 'SISTEMAS DA INFORMÇÃO';
WHEN 'CC' THEN
vrl_curso := 'CIÊNCIA DA COMPUTAÇÃO';
WHEN 'TADS' THEN
vrl_curso := 'TECNOLOGIA EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS';
WHEN 'TBD' THEN
vrl_curso := 'TECNOLOGIA EM BANCO DE DADOS';
WHEN 'TGTI' THEN
vrl_curso := 'TECNOLOGIA EM GESTÃO DE TECNOLOGIA DA INFORMAÇÃO';
WHEN 'TRC' THEN
vrl_curso := 'TECNOLOGIA EM REDES DE COMPUTADORES';
WHEN 'TSEG' THEN
vrl_curso := 'TECNOLOGIA EM SEGURANÇA DA INFORMAÇÃO';
WHEN 'TSIN' THEN
vrl_curso := 'TECNOLOGIA EM SISTEMAS PARA INTERNET';
ELSE
vrl_curso := 'CURSO DESCONHECIDO';
END CASE;
DBMS_OUTPUT.PUT_LINE(vrl_sigla || ' – ' || vrl_curso);
END;

--Exemplo_2
DECLARE
vrl_numero NUMBER(2) := 26;
BEGIN
CASE
WHEN (MOD(vrl_numero,2) = 0)THEN
DBMS_OUTPUT.PUT_LINE('O número '||vrl_numero||' é Par.');
WHEN (MOD(vrl_numero,2) <> 0)THEN
DBMS_OUTPUT.PUT_LINE('O número '||vrl_numero||' é Impar.');
ELSE
DBMS_OUTPUT.PUT_LINE('Número inválido, não é um número inteiro');
END CASE;
END;
