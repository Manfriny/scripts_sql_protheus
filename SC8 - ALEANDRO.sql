
select * from sbf010 where bf_filial='0401' and bf_produto='012500543';

select c8_xstatus,a.c8_numped,a.* from sc8010 a where c8_filial='0301' and c8_num='007720';
select C1_QUANT,C1_QUJE,a.* from sc1010 a where c1_num='018723';
select C7_QTDSOL,C7_QUANT,C7_QUJE,C7_ENCER,a.* from sc7010 a where c7_filial='0301' and c7_num='440268' and a.c7_numsc='018723';

select c8_xstatus,a.* from sc8010 a where c8_xstatus <> 'A' order by a.c8_xstatus ;and c8_xstatus <> ' ';
select c8_xstatus,a.c8_numped,a.* from sc8010 a where C8_EMISSAO > '20190110';