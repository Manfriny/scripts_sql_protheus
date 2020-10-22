--AJUSTAR FISICO FISCAL ROMANEIO SIMBOLICO
--CABEÇALHO ROMANEIO
select njj.njj_peso1,njj.njj_peso3,njj.njj_pssubt,njj.njj_psliqu,njj_psbase,njj.* from njj010 njj where njj.njj_filial='0301' and njj.njj_codrom='0000016833';
update njj010 njj set njj.njj_peso1=35000,njj.njj_peso3=35000,njj.njj_pssubt=35000,njj.njj_psliqu=35000,njj.njj_psbase=35000 where njj.njj_filial='0301' and njj.njj_codrom='0000016833';
--ITENS DO ROMANEIO
select njm.njm_qtdfis,njm.njm_qtdfco,njm.* from njm010 njm where njm.njm_filial='0301' and njm.njm_codrom='0000016833';
update njm010 njm set njm.njm_qtdfco=35000 where njm.njm_filial='0301' and njm.njm_codrom='0000016833';
--CLASSIFICAÇÃO DO ROMANEIO
select * from NJK010 where njk_filial='0301' and njk_codrom='0000016833';
update NJK010 njk set NJK_BASDES=35000 where njk_filial='0301' and njk_codrom='0000016833';
--SALDO DO CONTRATO
select njr.njr_qtsfco,njr.njr_qslfco,njr.* from njr010 njr where njr.njr_filial='0301' and njr.njr_codctr='004093';
update njr010 njr set njr.njr_qtsfco=215000.00,njr.njr_qslfco=57000.00 where njr.njr_filial='0301' and njr.njr_codctr='004093';