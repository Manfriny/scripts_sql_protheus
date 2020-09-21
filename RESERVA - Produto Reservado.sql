--=========== Saldo Reservado ===========--
select d_e_l_e_t_,b2_filial,b2_cod,b2_local,b2_qatu,b2_qemp,b2_qemp2,b2_reserva,b2_reserv2,b2_qaclass,a.* from sb2010 a where b2_local='26' and b2_cod='012500542';
update sb2010 set b2_qemp=0,b2_qemp2=0,b2_reserv2=0,b2_reserva=0 where b2_local='99' and b2_cod='040100016';

select d_e_l_e_t_,a.bf_empenho,a.bf_empen2,a.* from sbf010 a where bf_produto='012500542' and bf_lotectl='03P4012966' and a.d_e_l_e_t_=' ';
update sbf010 set bf_empen2=0,bf_empenho=0 where bf_filial='0401' and bf_produto='012500542' and bf_lotectl='03P4012966' and d_e_l_e_t_=' ';

select d_e_l_e_t_,a.b8_empenho,a.b8_empenh2,a.* from sb8010 a where b8_filial='0401' and b8_local='26' and b8_produto='012500542' and b8_lotectl='03P4012966' and d_e_l_e_t_=' ';
update sb8010 set b8_empenh2=0,b8_empenho=0 where b8_local='25' and b8_produto='010400031' and b8_lotectl='MN955362519';

--=========== Saldo Reservado ===========--
select * from sc0010 where c0_produto='040100016' and c0_local='99'; and c0_lotectl='MN955362519' and d_e_l_e_t_=' ';
select d_e_l_e_t_,a.* from sc5010 a where c5_num='184043';
select d_e_l_e_t_,a.c6_lotectl,a.* from sc6010 a where c6_produto='040100004' and c6_qtdven='10';

--
select 
d_e_l_e_t_, 
totvslg_user(c6_userlgi) as usu_inclusao,
totvslg_data(c6_userlgi) as dat_inclusao,
a.c6_reserva,
a.c6_local,
a.c6_localiz,
a.c6_lotectl,
a.*
from sc6010 a where c6_num='183963';


select d_e_l_e_t_,c9_reserva,c9_local,a.* from sc9010 a where c9_pedido='183963' and a.d_e_l_e_t_=' ';
select d_e_l_e_t_,a.* from sdc010 a where dc_pedido='183962';
update sdc010  set d_e_l_e_t_='*' where dc_pedido='184043';

select a.d_e_l_e_t_,c6_num,a.c6_local,a.c6_localiz,a.c6_lotectl,a.* from sc6010 a where c6_produto='040100016' and c6_nota=' ';