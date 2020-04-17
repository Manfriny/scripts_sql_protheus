define Filial = '0401';
define Pedido = '024929';
define Nota   = '069925';
define Serie  = '2';

--=================================================================================

select c6.C6_XLOTECL,c6.C6_LOTECTL,c6.C6_DTVALID,c6.C6_LOCALIZ,c6.C6_LOCAL,c6.C6_CLI,c6.* from SC6010 c6 where C6_FILIAL='&Filial' and C6_NUM in ('&Pedido') and c6.D_E_L_E_T_=' ' order by c6.C6_ITEM;
update SC6010 set C6_LOTECTL=C6_XLOTECL where C6_FILIAL='&Filial' and C6_NUM in ('&Pedido') and D_E_L_E_T_=' ';
update SC6010 set C6_DTVALID='20181231' where C6_FILIAL='&Filial' and C6_NUM in ('&Pedido') and D_E_L_E_T_=' ';

--=================================================================================

select c9.C9_LOTECTL,c9.C9_DTVALID,c9.C9_LOCAL,c9.C9_CARGA,c9.C9_SEQCAR,c9.* from SC9010 c9 where C9_FILIAL='&Filial' and C9_PEDIDO in ('&Pedido') and c9.D_E_L_E_T_ = ' ' order by c9.C9_ITEM;
merge into sc9010 x
using (SELECT SC6010.C6_DTVALID,SC6010.C6_LOTECTL as LOTEC6, SC9010.C9_LOTECTL as LOTEC9, SC9010.R_E_C_N_O_
 FROM SC6010
 INNER JOIN SC9010
  ON SC6010.C6_FILIAL = SC9010.C9_FILIAL and SC6010.C6_NUM = SC9010.C9_PEDIDO and SC6010.C6_PRODUTO = SC9010.C9_PRODUTO and SC6010.C6_ITEM = sc9010.c9_item and SC6010.C6_LOCAL = SC9010.C9_LOCAL and sc9010.d_e_l_e_t_ = SC6010.D_E_L_E_T_ 
 WHERE SC6010.C6_NUM='&Pedido' and SC6010.C6_LOTECTL <> ' ') y
 on (x.R_E_C_N_O_ = y.R_E_C_N_O_)
 WHEN MATCHED THEN UPDATE SET x.c9_lotectl = y.LOTEC6, x.c9_dtvalid = y.c6_dtvalid;

--update SC9010 set C9_LOTECTL='0039-17-1180  ',C9_DTVALID='20190731' where C9_FILIAL='&Filial' and C9_PEDIDO in ('&Pedido') and C9_COD='500100014' and C9_ITEM='01' and C9_LOCAL='42' and D_E_L_E_T_ = ' ';

--=================================================================================

select d2.D2_DFABRIC,d2.D2_DOC,d2.D2_LOTECTL,d2.D2_DTVALID,d2.D2_LOCALIZ,d2.D2_LOCAL,d2.* from SD2010 d2 where D2_FILIAL='&Filial' and D2_PEDIDO in ('&Pedido') and d2.D_E_L_E_T_=' ' order by d2.D2_PEDIDO;
update SD2010 set D2_DFABRIC='20180705', D2_LOTECTL='010-17-9940 ',D2_DTVALID='20190731' where D2_FILIAL='&Filial' and D2_PEDIDO in ('&Pedido') and D2_COD='500100013' and D2_ITEM='02' and D2_LOCAL='31' and D_E_L_E_T_ = ' ';
update SD2010 set D2_DFABRIC='20170101', D2_LOTECTL='001-17-10040',D2_DTVALID='20190930' where D2_FILIAL='&Filial' and D2_PEDIDO in ('&Pedido') and D2_COD='500100013' and D2_ITEM='03' and D2_LOCAL='51' and D_E_L_E_T_ = ' ';
update SD2010 set D2_DFABRIC='20170701', D2_LOTECTL='0024-17-4413',D2_DTVALID='20190831' where D2_FILIAL='&Filial' and D2_PEDIDO in ('&Pedido') and D2_COD='500100015' and D2_ITEM='04' and D2_LOCAL='51' and D_E_L_E_T_ = ' ';
update SD2010 set D2_DFABRIC='20171201', D2_LOTECTL='0091-17-8338',D2_DTVALID='20190831' where D2_FILIAL='&Filial' and D2_PEDIDO in ('&Pedido') and D2_COD='500100014' and D2_ITEM='08' and D2_LOCAL='51' and D_E_L_E_T_ = ' ';

--=================================================================================

select * from F0A010 where F0A_FILIAL='&Filial' and F0A_DOC='&Nota';
update F0A010 set F0A_VALID='20190731' where F0A_FILIAL='&Filial' and F0A_DOC='&Nota' and F0A_COD='500100013' and F0A_ITEM='02';
update F0A010 set F0A_VALID='20190930' where F0A_FILIAL='&Filial' and F0A_DOC='&Nota' and F0A_COD='500100013' and F0A_ITEM='03';
update F0A010 set F0A_VALID='20190831' where F0A_FILIAL='&Filial' and F0A_DOC='&Nota' and F0A_COD='500100015' and F0A_ITEM='04';
update F0A010 set F0A_VALID='20190831' where F0A_FILIAL='&Filial' and F0A_DOC='&Nota' and F0A_COD='500100014' and F0A_ITEM='08';

--=================================================================================

--carga
select * from DAK010 where DAK_CAMINH='AHN1851';

--=================================================================================

select * from SPED.SPED050 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
update SPED.SPED050 set D_E_L_E_T_=' ',R_E_C_D_E_L_=0 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
select * from SPED.SPED054 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
select * from SPED.SPED150;

--=================================================================================

/*

C9_BLCRED:
"" – Liberado
01 – Bloqueio de Credito por Valor
02 – Por Estoque – MV_BLQCRED = T
04 – Vencto do Limite de Credito
05 – Bloqueio de Credito por Estorno
06 – Bloqueio de Credito por Risco
09 – Rejeicao de Credito
10 – Faturado

C9_BLEST:
"" – Liberado
02 – Bloqueio de Estoque
03 – Bloqueio Manual de Estoque
10 – Faturado

C9_BLWMS:
01 – Bloqueio de Enderecamento do WMS/Somente SB2
02 – Bloqueio de Enderecamento do WMS
03 – Bloqueio de WMS – Externo
05 – Liberacao para Bloqueio 01
06 – Liberacao para Bloqueio 02
07 – Liberacao para Bloqueio 03
*/