/*
pedido: 202970
carga: 011925

local: 24
produto: 010300483
ende: r-d bl23 qd05


lote: do145155020 18

chamado: 31605.
*/

select b5.b5_semente,b5.* from sb5010 b5 where b5_cod='010300483'; 

select c6.c6_blq,c6.c6_local,c6.c6_localiz,c6.c6_lotectl,c6.* from sc6010 c6 where c6.c6_filial='0301' and c6.c6_num='202970' and c6.d_e_l_e_t_=' ';
select c9.c9_local,c9.c9_lotectl,c9.c9_nfiscal,c9.c9_qtdlib,c9.c9_qtdlib2,c9.* from sc9010 c9 where c9.c9_filial='0301' and c9.c9_pedido='202970' and c9.d_e_l_e_t_=' ';
select * from sc9010 where c9_lotectl like '%DO145155020%';
select * from nj5010 nj5 where nj5.nj5_filial='0301' and nj5.nj5_numpv='202970' and nj5.d_e_l_e_t_=' ';
select nj6.d_e_l_e_t_,nj6.* from nj6010 nj6 where nj6.nj6_filial='0301' and nj6.nj6_numpv='202970' ;and nj6.d_e_l_e_t_=' ';
select * from nj6010 nj6 where nj6.nj6_lotect like '%DO145155020%' and nj6.d_e_l_e_t_=' '; 

select np9.np9_status,np9.np9_pendes,np9.* from np9010 np9 where np9.np9_lote='DO145155020' and np9.np9_prod='010300483' and np9.d_e_l_e_t_=' '; --status 2 disponivel
update np9010 np9 set np9.np9_cultra='001' where np9.np9_lote='DO145155020' and np9.np9_prod='010300483' and np9.d_e_l_e_t_=' '; --status 2 disponivel
--select np9.np9_pendes,np9.* from np9010 np9 where np9.np9_pendes like '%5,5%';


select bf.bf_local,bf.bf_localiz,bf.bf_lotectl,bf.* from sbf010 bf where bf.bf_filial='0301' and bf.bf_lotectl='DO145155020' and bf_produto='010300483';
select b8.r_e_c_n_o_,b8.d_e_l_e_t_,b8.b8_lotectl,b8.* from sb8010 b8 where b8.b8_filial='0301' and b8.b8_lotectl='DO145155020' and b8_produto='010300483';
/*
liberado qualidade
saldo disponivel b2, bf, b8
caractereisticas do lote igual pedido ( NP9 x SC6 )