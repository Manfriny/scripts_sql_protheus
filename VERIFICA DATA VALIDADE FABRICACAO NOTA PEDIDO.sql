define filial = '0401';
define nota = '096295';
define pedido = '041124';

select c6.c6_dtvalid,c6.* from sc6010 c6 where c6_filial='0401' and c6_num='041124' and c6.d_e_l_e_t_=' '; --numeero pedido
update sc6010 c6 set c6.c6_dtvalid='20211030' where c6_filial='0401' and c6_num='041124' and c6.d_e_l_e_t_=' ';
select c9.c9_dtvalid,c9.* from sc9010 c9 where c9_filial='0401' and c9_pedido='041124' and c9.d_e_l_e_t_=' '; --numero pedido
update sc9010 c9 set c9.c9_dtvalid='20211030' where c9_filial='0401' and c9_pedido='041124' and c9.d_e_l_e_t_=' '; 
select d2.d2_dtvalid,d2.d2_dfabric,d2.d2_pedido,d2.* from sd2010 d2 where d2_filial='0401' and d2_doc='096295' and d2.d_e_l_e_t_=' '; --numero da nota
update sd2010 d2 set d2.d2_dtvalid='20211030' where d2_filial='0401' and d2_doc='096295' and d2.d_e_l_e_t_=' ';
select f0a.f0a_valid,f0a.f0a_fabric,f0a.* from f0a010 f0a where f0a_filial='0401' and f0a.f0a_doc='096295' and f0a.d_e_l_e_t_=' '; --numero da nota
update f0a010 f0a set f0a.f0a_valid='20211030' where f0a_filial='0401' and f0a.f0a_doc='096295' and f0a.d_e_l_e_t_=' ';

--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402
select * from sped.sped050 spd where spd.id_ent='000002' and spd.nfe_id like '%2%096295%' and spd.d_e_l_e_t_=' '; --numero da serie e da nota fiscal
update sped.sped050 spd set spd.d_e_l_e_t_='*',spd.r_e_c_d_e_l_=spd.r_e_c_n_o_ where spd.id_ent='000002' and spd.nfe_id like '%2%096295%' and spd.d_e_l_e_t_=' ';
select * from sped.sped054 spd where spd.id_ent='000002' and spd.nfe_id like '%2%096295%' and spd.d_e_l_e_t_=' '; --numero da serie e da nota fiscal
update sped.sped054 spd set spd.d_e_l_e_t_='*',spd.r_e_c_d_e_l_=spd.r_e_c_d_e_l_ where spd.id_ent='000002' and spd.nfe_id like '%2%096295%' and spd.d_e_l_e_t_=' ';

-- Depois de ajustar a data de validade e fabricação, ir no modulo 5-fat e retransmitir a nota..