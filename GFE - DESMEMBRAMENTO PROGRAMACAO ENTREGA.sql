select c9.r_e_c_n_o_,c9.c9_qtdlib,c9.c9_qtdlib2,c9.* from sc9010 c9 where c9.c9_filial='0301' and c9.c9_pedido='209209' and c9.d_e_l_e_t_=' '; 
update sc9010 c9 set c9.c9_qtdlib2=2000 where c9.r_e_c_n_o_=308145;


select nj5.r_e_c_n_o_,nj5.nj5_qtde,nj5.nj5_qtdum2,nj5.* from nj5010 nj5 where nj5.nj5_filial='0301' and nj5.nj5_numpv='209209' and nj5.d_e_l_e_t_=' ';
update nj5010 nj5 set nj5.nj5_qtdum2=2000 where nj5.r_e_c_n_o_=66431;


--=====================================
select * from sc9010 c9 where c9.c9_filial='0301' and c9.c9_pedido='209274' and c9.d_e_l_e_t_=' ';


select nj5.r_e_c_n_o_,nj5.* from nj5010 nj5 where nj5.nj5_filial='0301' and nj5.nj5_numpv='209274' and nj5.d_e_l_e_t_=' ';
update nj5010 nj5 set nj5.d_e_l_e_t_='*',nj5.r_e_c_d_e_l_=nj5.r_e_c_n_o_ where nj5.r_e_c_n_o_=71154;