--Rotina: OGA180 njf
select * from njf010 where njf_filial='0303' and NJF_CODAMO='000019';
select * from njg010 where njg_filial='0303' and njg_codamo='000019';--njg_coddes,njg_perddes

--VIGOR
update njg010 set NJG_PERDES='93' where njg_filial='0303' and njg_codamo='000019' and NJG_ITEM='004';
--VIABILIDADE
update njg010 set NJG_PERDES='95' where njg_filial='0303' and njg_codamo='000019' and NJG_ITEM='006';