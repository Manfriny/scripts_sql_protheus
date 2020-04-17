select d3_estorno,a.* from sd3010 a where d3_filial='0301' and d3_numseq in ('99E37J','99E894','99EH25','99EHUS') and D3_CF='DE4';
update sd3010 set d3_estorno='S' where d3_filial='0301' and d3_numseq in ('99E37J','99E894','99EH25','99EHUS') and D3_CF='DE4';

select np9_status,a.* from NP9010 a where np9_lote='DP1654362519';
update NP9010 set np9_status='1' where np9_lote='DP1654362519';

select * from sb8010 where b8_lotectl='DP1654362519';
select * from sbf010 where bf_lotectl='DP1654362519';


select * from sdd010;
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010300314' and dd_lotectl='DO138860019' and dd_localiz='R-F BL35QD04';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010300136' and dd_lotectl='DO138860019' and dd_localiz='R-D BL51QD05';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010500111' and dd_lotectl='SS1300652519' and dd_localiz='R-D BL45QD01';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010500107' and dd_lotectl='SS1300652519' and dd_localiz='R-F BL07QD03';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010500117' and dd_lotectl='SS1300652519' and dd_localiz='R-F BL07QD04';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010500111' and dd_lotectl='SS1300652519' and dd_localiz='R-D BL48QD04';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010800001' and dd_lotectl='NO1054165019' and dd_localiz='R-K';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010300301' and dd_lotectl='EX1951062519' and dd_localiz='R-F BL07QD02';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010800010' and dd_lotectl='NO1000960019' and dd_localiz='R-D BL15QD05';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010800010' and dd_lotectl='NO1000960019' and dd_localiz='R-F BL12QD04';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010800010' and dd_lotectl='NO1003960019' and dd_localiz='R-F BL12QD04';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010300249' and dd_lotectl='UN600962519' and dd_localiz='R-E BL102QD02';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010300249' and dd_lotectl='UN600962519' and dd_localiz='R-E BL103QD04';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010300249' and dd_lotectl='UN602462519' and dd_localiz='R-E BL102QD02';
update sdd010 set dd_motivo='RP' where DD_PRODUTO='010300249' and dd_lotectl='UN602462519' and dd_localiz='R-E BL81QD02';
