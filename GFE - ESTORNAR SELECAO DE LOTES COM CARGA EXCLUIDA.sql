define filial='0301';
define pedido='208535';
define carga ='012581';

--=== Apagar reserva na SC6
select c6.d_e_l_e_t_,c6.c6_reserva,c6.* from sc6010 c6 where c6.c6_filial='0301' and c6.c6_num='208535';
--=== Verifica existencia da liberacao do pedido
select c9.d_e_l_e_t_,c9.* from sc9010 c9 where c9.c9_filial='0301' and c9.c9_pedido='208535' and c9.d_e_l_e_t_=' ';

--=== pesquisar a carga ou pedido
select dak.d_e_l_e_t_,dak.* from dak010 dak where dak.dak_filial='0301' and dak.dak_cod='012581';
select dai.d_e_l_e_t_,dai.dai_pedido,dai.* from DAI010 dai where dai.dai_filial='0301' and dai.dai_pedido='208535';

select nj6.d_e_l_e_t_,nj6.nj6_reserv,nj6.* from nj6010 nj6 where nj6.nj6_filial='0301' and nj6.nj6_numpv='208535' and nj6.d_e_l_e_t_=' ';
select nj6.d_e_l_e_t_,nj6.nj6_reserv,nj6.* from nj6010 nj6 where nj6.nj6_filial='0301' and nj6.nj6_numpv='208535' and nj6.nj6_reserv in ('017846' , '017848' , '017847') order by nj6.nj6_reserv;
select nj5.d_e_l_e_t_,nj5.* from nj5010 nj5 where nj5.nj5_filial='0301' and nj5.nj5_numpv='208535' and nj5.d_e_l_e_t_=' ';

select c0.d_e_l_e_t_,c0.c0_lotectl,c0.* from sc0010 c0 where c0.c0_filial='0301' and c0.c0_num in ('017846' , '017848' , '017847');
update sc0010 c0 set c0.d_e_l_e_t_='*',c0.r_e_c_d_e_l_=c0.r_e_c_n_o_ where c0.c0_filial='0301' and c0.c0_num in ('017846' , '017848' , '017847');

--=========== Saldo Reservado ===========--
--- para ajsutar os saldos, gera o select da NJ6 ou da SC0 e fixa o resultado, depois vai substituindo
define armazem='25';
define produto='01100036';
define lote = 'CC2600860020';

select b2.d_e_l_e_t_,b2.b2_filial,b2.b2_cod,b2.b2_local,b2.b2_qatu,b2.b2_qemp,b2.b2_qemp2,b2.b2_reserva,b2.b2_reserv2,b2.b2_qaclass,b2.* from sb2010 b2 where b2.b2_filial='&filial' and b2.b2_local='&armazem' and b2.b2_cod='&produto' and b2.d_e_l_e_t_=' ';
update sb2010 b2 set b2.b2_qemp=0,b2.b2_qemp2=0,b2.b2_reserv2=0,b2.b2_reserva=0 where b2.b2_filial='&filial' and b2.b2_local='&armazem' and b2.b2_cod='&produto' and b2.d_e_l_e_t_=' ';

select bf.d_e_l_e_t_,bf.bf_empenho,bf.bf_empen2,bf.* from sbf010 bf where bf.bf_filial='&filial' and bf.bf_local='&armazem' and bf.bf_produto='&produto' and bf.bf_lotectl='&lote' and bf.d_e_l_e_t_=' ';
update sbf010 bf set bf.bf_empen2=0,bf.bf_empenho=0 where bf.bf_filial='&filial' and bf.bf_local='&armazem' and bf.bf_produto='&produto' and bf.bf_lotectl='&lote' and bf.d_e_l_e_t_=' ';

select b8.d_e_l_e_t_,b8.b8_empenho,b8.b8_empenh2,b8.* from sb8010 b8 where b8.b8_filial='&filial' and b8.b8_local='&armazem' and b8.b8_produto='&produto' and b8.b8_lotectl='&lote' and b8.d_e_l_e_t_=' ';
update sb8010 b8 set b8.b8_empenh2=0,b8.b8_empenho=0 where b8.b8_filial='&filial' and b8.b8_local='&armazem' and b8.b8_produto='&produto' and b8.b8_lotectl='&lote' and b8.d_e_l_e_t_=' ';

