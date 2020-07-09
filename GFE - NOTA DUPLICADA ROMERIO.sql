select d_e_l_e_t_, F1_FILIAL, F1_DOC, F1_SERIE, F1_FORNECE, F1_LOJA, F1_FORMUL,a.* from sf1010 a where f1_filial='0301' and f1_doc like '%92143' and f1_fornece='02745323';
update sf1010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where f1_filial='0301' and f1_doc like '%92143' and f1_fornece='02745323';

select d_e_l_e_t_  ,D1_FILIAL, D1_DOC, D1_SERIE, D1_FORNECE, D1_LOJA, D1_ITEM, D1_FORMUL, D1_ITEMGRD,d1_tes,a.* from sd1010 a where d1_filial='0301' and d1_doc like '%92143%' and d1_fornece='02745323';
update sd1010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where d1_filial='0301' and d1_doc like '%92143%' and d1_fornece='02745323';