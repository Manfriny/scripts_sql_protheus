SELECT c6_reserva,c6_item,a.* FROM sc6010 a where c6_num='180140';

select c9_reserva,c9_sequen,c9_local,c9_lotectl,a.* from sc9010 a where c9_filial='0301' and c9_pedido='180140';

select d_e_l_e_t_,a.* from sc0010 a where c0_num in ('006869','006870','006871','006872','006873','006874','006875');
update sc0010 set d_e_l_e_t_=' ',r_e_c_d_e_l_=0 where c0_num in ('006869','006870','006871','006872','006873','006874','006875');


/*
180140
182195

/*
ramal
4541