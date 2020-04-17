define filial='0402';
define pedido='013670';
define nota='026755';
define serie='1'
define peso=5130;

--select D2_PEDIDO from SD2010 where d2_doc='026755';
select B1_TIPCONV,B1_CONV,b1_pesbru, b1_peso from sb1010 where b1_cod in ('120100001','120100002');

select C5.C5_PESOL,C5.C5_PBRUTO,C5.* from SC5010 C5 where C5_FILIAL='&filial' and C5_NUM in ('&pedido') and C5.D_E_L_E_T_=' ' order by C5.C5_NUM;
update SC5010 set C5_PESOL=&peso,C5_PBRUTO=&peso where C5_FILIAL='&filial' and C5_NUM in ('&pedido') and D_E_L_E_T_=' ';

select c6.C6_PESOL, c6.C6_PBRUTO,c6.* from SC6010 c6 where C6_FILIAL='&filial' and C6_NUM in ('&pedido') and c6.D_E_L_E_T_=' ' order by c6.C6_NUM;
--update SC6010 set C6_PESOL=1570, C6_PBRUTO=&peso where C6_FILIAL='&filial' and C6_NUM in ('&pedido') and D_E_L_E_T_=' ';

--select c9.* from SC9010 c9 where C9_FILIAL='&filial' and C9_PEDIDO in ('&pedido') and c9.D_E_L_E_T_ = ' ' order by c9.C9_PEDIDO;
--update SC9010 set C9_BLCRED=' ' where C9_FILIAL='&filial' and C9_PEDIDO in ('&pedido') and D_E_L_E_T_ = ' ';

select f2.F2_PLIQUI,f2.F2_PBRUTO,f2.* from SF2010 f2 where F2_FILIAL='&filial' and F2_DOC='&nota';
update SF2010 set F2_PLIQUI=&peso,F2_PBRUTO=&peso where F2_FILIAL='&filial' and F2_DOC='&nota';

select d2.D2_PESO,d2.* from SD2010 d2 where D2_FILIAL='&filial' and D2_PEDIDO in ('&pedido') and d2.D_E_L_E_T_=' ' order by d2.D2_PEDIDO;
update SD2010 set D2_PESO=&peso where D2_FILIAL='&filial' and D2_PEDIDO in ('&pedido') and D_E_L_E_T_=' ';

COMMIT;

--select * from F0A010 where F0A_FILIAL='&filial' and F0A_DOC='&nota';

--select * from SPED.SPED050 where NFE_ID like '&serie%&nota%';

--select * from SPED.SPED054 where NFE_ID like '&serie%&nota%';

--define chavenfe= nvl((select to_char(trim(NFE_CHV)) as NFE_CHV from SPED.SPED054 where NFE_ID like '&serie%&nota%'),' ');
--select &chavenfe from dual;

--select * from SPED.SPED150 where NFE_CHV like &chavenfe;