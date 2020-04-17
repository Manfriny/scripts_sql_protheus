
-- AJUSTAR CLASSIFICAÇÃO ROMANEIO
select * from njk010 where NJK_FILIAL='0402' and njk_codrom='0000025988'; and NJK_ITEM='006';
update njk010 set NJK_DESRES='INTACTA TESTADO POSITIVO' where NJK_FILIAL='0402' and njk_codrom='0000025988' and NJK_ITEM='006';

--Impureza tem que ajustar quantidade
select * from njk010 where njk_filial='0301' and njk_codrom='0000016079' and NJK_ITEM='002';
update njk010 set NJK_PERDES=1.2,NJK_QTDDES=49.17 where njk_filial='0301' and njk_codrom='0000016079' and NJK_ITEM='002';

-- AJUSTA CLASSIFICAÇÃO AVULSA - usar o codigo da amostra
SELECT *  FROm NJG010 where njg_filial='0301' and NJG_CODAMO='000043';



--LIBERAÇÃO DO LOTE
select NP9_STATUS,a.* from np9010 a where NP9_FILIAL='0301' and NP9_LOTE='XXXXXXXXXX';