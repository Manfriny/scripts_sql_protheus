define filial='0401';
define pedido='019444';
define troca='000544';

--verifico o item do pedido no pedido de venda
SELECT *
FROM sc6010
WHERE c6_filial='&filial'
AND c6_num     ='&pedido'
--AND c6_produto  ='010200144 '
AND D_E_L_E_T_ =' ';

--verifico o item na rotina de troca
SELECT *
FROM nko010
WHERE nko_filial='&filial'
AND NKO_TRCNUM     ='&troca'
AND NKO_CODPRO  ='010200144 '
AND D_E_L_E_T_ =' ';

--verifico o item do pedido na liberação do pedido de venda, analisar se realmente não foi faturado e se não existe carga montada para o item
SELECT *
FROM sc9010
WHERE c9_filial='&filial'
AND c9_pedido  ='&pedido'
--AND c9_produto  ='010200144 '
AND D_E_L_E_T_ =' ';

--verifico o item do pedido na programação de entrega
SELECT *
FROM nj5010
WHERE nj5_numpv='&pedido'
AND nj5_produt  ='010200144 '
AND D_E_L_E_T_ =' ';


--verifico se o item do pedido existe na seleção de lotes
SELECT *
FROM nj6010
WHERE nj6_numpv='&pedido'
AND nj6_produto  ='010200144 '
AND D_E_L_E_T_ =' ';

--executo replace
update nko010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ WHERE nko_filial='&filial' AND NKO_TRCNUM     ='&troca' AND NKO_CODPRO  ='010200144 ' AND D_E_L_E_T_ =' ';
update sc6010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ WHERE c6_filial='&filial' AND c6_num     ='&pedido' AND c6_produto  ='010200144 ' AND D_E_L_E_T_ =' ';
update sc9010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ WHERE c9_filial='&filial' AND c9_pedido     ='&pedido' AND  D_E_L_E_T_ =' ';
update nj5010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ WHERE nj5_numpv='&pedido'AND nj5_produt  ='010200144 ' AND D_E_L_E_T_ =' ';


select D2_DOC from sd2010 where d2_filial='0301' and d2_COD='010300061' and d2_lotectl='DF1260265017';

SELECT * FROM SD1010 WHERE D1_filial='0301' and d1_COD='010300061' and d1_lotectl='DF1260265017';
