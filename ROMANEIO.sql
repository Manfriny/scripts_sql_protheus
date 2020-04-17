select C5_XMDVEN as mod_vend from SC5010 where C5_NUM='162167';

--163201

--==================================================================================================================
select * from NJJ010 where NJJ_FILIAL='0402' and NJJ_CODROM in ('0000015472','0000015469');

update 
    NJJ010 
set 
    NJJ_DOCEMI='20180712', NJJ_DOCNUM='023711',NJJ_DOCSER='1',NJJ_DOCESP='SPED',NJJ_CHVNFE='52180702745323000210550010000237111002578860' 
where 
    NJJ_FILIAL='0402' and NJJ_CODROM='0000015472';

--==================================================================================================================    
select * from NJM010 where NJM_FILIAL='0402' and NJM_CODROM in ('0000015472','0000015469');

update 
    NJM010 
set 
    NJM_DOCEMI='20180712',NJM_DOCNUM='023711',NJM_DOCSER='1',NJM_DOCESP='SPED',NJM_CHVNFE='52180702745323000210550010000237111002578860' 
where 
    NJM_FILIAL='0402' and NJM_CODROM='0000015472';

--==================================================================================================================    



select f2.F2_FILIAL,f2.F2_EMISSAO,f2.F2_DOC,f2.F2_SERIE,f2.F2_ESPECIE,f2.F2_CHVNFE,f2.* from SF2010 f2 where f2.F2_FILIAL='0402' and  F2_CODROM like '%015469';
select D2.D2_PEDIDO,D2.D2_FILIAL,D2.D2_EMISSAO,D2.D2_DOC,D2.D2_SERIE,D2.D2_ESPECIE,D2.* from SD2010 D2 where D2.D2_FILIAL='0402' and  D2_CODROM like '%015472';