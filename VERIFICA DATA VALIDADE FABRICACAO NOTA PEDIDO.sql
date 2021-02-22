define filial = '0401';
define nota = '096884';
define serie = '2';
define pedido = '041685';

select c6.r_e_c_n_o_,c6.c6_dtvalid,c6.* from sc6010 c6 where c6_filial='&filial' and c6_num='&pedido' and c6.d_e_l_e_t_=' '; --numeero pedido
update sc6010 c6 set c6.c6_dtvalid='20211030' where c6.r_e_c_n_o_=202916;
select c9.r_e_c_n_o_,c9.c9_dtvalid,c9.* from sc9010 c9 where c9_filial='&filial' and c9_pedido='&pedido' and c9.d_e_l_e_t_=' '; --numero pedido
update sc9010 c9 set c9.c9_dtvalid='20211030' where c9.r_e_c_n_o_=321385; 
select d2.r_e_c_n_o_,d2.d2_dtvalid,d2.d2_dfabric,d2.d2_pedido,d2.* from sd2010 d2 where d2_filial='&filial' and d2_doc='&nota' and d2.d_e_l_e_t_=' '; --numero da nota
update sd2010 d2 set d2.d2_dtvalid='20211030' where d2.r_e_c_n_o_=213711;
select f0a.r_e_c_n_o_,f0a.f0a_valid,f0a.f0a_fabric,f0a.* from f0a010 f0a where f0a_filial='&filial' and f0a.f0a_doc='&nota' and f0a.d_e_l_e_t_=' '; --numero da nota
update f0a010 f0a set f0a.f0a_valid='20211030' where f0a.r_e_c_n_o_=60156;

--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402
select * from sped.sped050 spd where spd.id_ent='000002' and spd.nfe_id like '%&serie%&nota%' and spd.d_e_l_e_t_=' '; --numero da serie e da nota fiscal
update sped.sped050 spd set spd.d_e_l_e_t_='*',spd.r_e_c_d_e_l_=spd.r_e_c_n_o_ where spd.id_ent='000002' and spd.nfe_id like '%&serie%&nota%' and spd.d_e_l_e_t_=' ';
select * from sped.sped054 spd where spd.id_ent='000002' and spd.nfe_id like '%&serie%&nota%' and spd.d_e_l_e_t_=' '; --numero da serie e da nota fiscal
update sped.sped054 spd set spd.d_e_l_e_t_='*',spd.r_e_c_d_e_l_=spd.r_e_c_d_e_l_ where spd.id_ent='000002' and spd.nfe_id like '%&serie%&nota%' and spd.d_e_l_e_t_=' ';

-- Depois de ajustar a data de validade e fabricação, ir no modulo 5-fat e retransmitir a nota..