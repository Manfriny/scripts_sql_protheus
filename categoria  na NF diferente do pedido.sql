define filial='0301';
define pedido='034887';
define produto='010100060';


--CATEGORIA NA NF DIFERENTE DO PEDIDO
SELECT *
FROM sc6010
WHERE c6_filial='&filial'
AND c6_num     ='&pedido'
AND C6_PRODUTO ='&produto'
AND D_E_L_E_T_ =' ';

SELECT *
FROM sc9010
WHERE c9_filial='&filial'
AND c9_pedido  ='&pedido'
AND C9_PRODUTO ='&produto'
AND D_E_L_E_T_ =' ';

SELECT *
FROM nj5010
WHERE nj5_numpv='&pedido'
AND NJ5_PRODUT ='&produto'
AND D_E_L_E_T_ =' ';

SELECT *
FROM nj6010
WHERE nj6_numpv='&pedido'
AND NJ6_PRODUT ='&produto'
AND D_E_L_E_T_ =' ';

UPDATE SC6010 SET C6_CTVAR='0000000280' WHERE C6_FILIAL='0301' AND C6_NUM='034887' AND C6_PRODUTO IN ('010100060','010100057') ;
UPDATE NJ5010 SET NJ5_CTVAR='0000000280' WHERE NJ5_FILIAL='0301' AND NJ5_NUMPV='034887' AND NJ5_PRODUT IN ('010100060','010100057') ;
