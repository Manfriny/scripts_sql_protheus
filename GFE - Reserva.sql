--JOAO
select PKG_EXPEDICAO.F_VERIFICA_CARREGAMENTO('003883') from dual;

------------------------------------

select * from SC0010 where C0_LOTECTL='DB506560018' and D_E_L_E_T_= ' ';
select * from SC9010 where C9_LOTECTL='DB506560018' and D_E_L_E_T_= ' ';
-- 
select C9_NFISCAL, a.* from SC9010 a where C9_RESERVA='008922';

select * from SD5010 ;where d5_;

select C9_NFISCAL,c9.* from sc9010 c9 where c9_carga='002219' and D_E_L_E_T_=' ';

select * from NJ5010 where nj5_filal;

select * from DAK010 where DAK_COD='002116';
select * from DAI010 where DAI_PEDIDO='160794';

select * from SC2010 where C2_NUM='163777';
select * from NP9010 where NP9_LOTE='IN1300952518';

select * from gx5010 where GX5_NRMOV='00013911';