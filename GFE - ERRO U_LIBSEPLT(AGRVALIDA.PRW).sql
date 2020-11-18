select * from sc6010 c6 where c6.c6_filial='0301' and c6.c6_num='206332' and c6.d_e_l_e_t_=' ';
select * from sc9010 c9 where c9.c9_filial='0301' and c9.c9_pedido='206332' and c9.d_e_l_e_t_=' ';

select * from nj5010 nj5 where nj5.nj5_filial='0301' and nj5.nj5_numpv='206332' and nj5.d_e_l_e_t_=' ';
update nj5010 nj5 set nj5.d_e_l_e_t_='*',nj5.r_e_c_d_e_l_=nj5.r_e_c_n_o_ where nj5.r_e_c_n_o_=70227;
update nj5010 nj5 set nj5.d_e_l_e_t_=' ',nj5.r_e_c_d_e_l_=0 where nj5.r_e_c_n_o_=70228;

select * from nj6010 nj6 where nj6.nj6_filial='0301' and nj6.nj6_numpv='206332' and nj6.nj6_codcar='012466' and nj6.d_e_l_e_t_=' ';

--KDP9800
select * from dak010 dak where dak.dak_filial='0301' and dak.dak_cod='012466' and dak.d_e_l_e_t_=' ';
select * from dai010 dai where dai.dai_filial='0301' and dai.dai_cod='012466' and dai.d_e_l_e_t_=' ';
