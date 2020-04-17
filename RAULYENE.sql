select a.r_e_c_n_o_,a.d_e_l_e_t_,a.f1_status,a.* from sf1010 a where f1_filial='0301' and f1_doc='30823';
update SF1010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where f1_filial='0301' and f1_doc='30823';

select a.r_e_c_n_o_,a.d_e_l_e_t_,d1_tes,a.* from sd1010 a where d1_filial='0301' and d1_doc='000030823';
update sd1010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where d1_filial='0301' and d1_doc='000030823';