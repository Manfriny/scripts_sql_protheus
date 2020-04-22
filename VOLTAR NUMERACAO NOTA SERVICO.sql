define Filial = '0401';
define DocIni = '000742';
define DocFim = '000744';
define Serie  = 'U';

--verificar se existem notas na frente
--create table SD9010_BKP_20190404 as 
--create table SD9010_BKP_20181217 as 
SELECT *
    FROM sd9010
    WHERE d9_filial='&Filial'
    AND d9_doc >= '&DocIni'/*notas de serviço (nao usar notas sefaz)*/
    AND d9_serie ='&Serie'
  --  AND d9_doc <= '&DocFim'/*notas de serviço (nao usar notas sefaz)*/
    AND D_E_L_E_T_=' '
    ORDER BY D9_DOC
;


--limpar registros de emissao da nf
UPDATE sd9010
SET D9_DTUSO      ='        ',
  d9_hora         ='    ',
  d9_usuario      ='                         '
WHERE r_e_c_n_o_ IN
  (SELECT r_e_c_n_o_
    FROM sd9010
    WHERE d9_filial='&Filial'
    AND d9_doc BETWEEN '&DocIni' AND '&DocFim'/*notas de serviço (nao usar notas sefaz)*/
    AND d9_serie ='&Serie'
  );


--voltar numeracao no parametro
UPDATE SX5010 SET X5_DESCRI='&DocIni',X5_DESCSPA='&DocIni',X5_DESCENG='&DocIni'
WHERE x5_tabela='01'/*NUNCA MUDA*/
AND x5_filial  ='&Filial'
AND X5_CHAVE   ='&Serie'/*SERIE*/
;

-- PROXIMO NUMERO DE NOTA
SELECT  X5_DESCRI,X5_DESCSPA,X5_DESCENG FROM SX5010
WHERE x5_tabela='01'/*NUNCA MUDA*/
AND x5_filial  ='&Filial'
AND X5_CHAVE   ='&Serie'/*SERIE*/
;