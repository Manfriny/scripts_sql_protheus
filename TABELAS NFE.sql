define Pedido='164804';
define Nota='066252';
select D2_PEDIDO from sd2010 where d2_doc='&Nota';

--NOTA FISCAL
select * from SC5010 where C5_FILIAL='0301' and C5_NUM='&Pedido' and D_E_L_E_T_=' ';
select * from SC6010 where C6_FILIAL='0301' and C6_NUM='&Pedido' and D_E_L_E_T_=' ';
select * from SC9010 where C9_FILIAL='0301' and C9_PEDIDO='&Pedido' and D_E_L_E_T_=' ';
select * from SF2010 where F2_FILIAL='0301' and F2_DOC='&Nota' and D_E_L_E_T_=' ';
select * from SD2010 where D2_FILIAL='0301' and D2_DOC='&Nota' and D_E_L_E_T_=' ';
select F3_DTCANC,F3_OBSERV,F3_PROTOC,F3_CODRSEF,F3_CODRET,F3_CHVNFE from SF3010 where F3_FILIAL='0301' and F3_NFISCAL in ('&Nota') and D_E_L_E_T_=' ';
update SF3010 set F3_CODRSEF='101',F3_CODRET='M' where F3_FILIAL='0301' and F3_NFISCAL in ('&Nota') and D_E_L_E_T_=' ';
select ft.FT_OBSERV,ft.* from SFT010 ft where FT_FILIAL='0301' and FT_NFISCAL='&Nota' and D_E_L_E_T_=' ';

--NOTA COM LOTE
select * from F0A010 where F0A_FILIAL='0301' and F0A_DOC='&Nota' and D_E_L_E_T_=' ';

--XML DA NOTA
select * from SPED.SPED050 where NFE_ID like '%3%&Nota%' and D_E_L_E_T_=' ';
--UPDATE SPED.SPED050 set D_E_L_E_T_='*', R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%3%065851%' and D_E_L_E_T_=' ';

--MENSAGEN RETORNO SEFAZ
select * from SPED.SPED054 where NFE_ID like '%3%&Nota%' and D_E_L_E_T_=' ';
--UPDATE SPED.SPED054 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%3%065851%' and D_E_L_E_T_=' ';


--LOTE
select * from SPED.SPED052 where LOTE='000000000000009';
--EVENTOS NFE (ex:Lote de envio; Cancelamento)
select * from SPED.SPED150 where NFE_CHV='52180903482332000148550030000662521005211440';

--FINANCEIRO
select * from SE1010 where E1_NUM like '%&Nota%';
--update SE1010 set E1_PARCELA='001' where E1_NUM like '%&Nota%';

--
select * from CD2010 where CD2_FILIAL='0301' and ((CD2_CODCLI='79264628' and CD2_LOJCLI='01')or(CD2_CODFOR='79264628' and CD2_LOJFOR='01'));

--
-- NFe
SELECT * FROM SPED.SPED050 X WHERE X.NFE_ID LIKE '%3%67122%';

--
-- Retornos Sefaz
SELECT * FROM SPED.SPED054 X WHERE X.NFE_CHV = '52180903482332000148550030000671221003511463';

--
-- Documetos na fila de processamento ( 1 documento por minuto )
SELECT * FROM SPED.TSSTR1;

--
-- Tentativas de processamento de cada documento
SELECT * FROM SPED.TSSTR2 X WHERE X.DOCRECNO = 111628;