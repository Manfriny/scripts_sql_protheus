select D_E_L_E_T_,a.r_e_c_n_o_,a.* from sdb010 a where db_filial='0301' and db_produto='010300029' and db_numseq='99F1TL';
update sdb010 set DB_ESTORNO=' ' where r_e_c_n_o_=301698;
update sdb010 set D_E_L_E_T_='*' where r_e_c_n_o_=305450;


select d_e_l_e_t_,a.r_e_c_n_o_,a.d5_estorno,a.* from sd5010 a where d5_filial='0301' and d5_produto='010300029' and d5_numseq='99F1TL';
update sd5010 set D5_ESTORNO=' ' where r_e_c_n_o_='337789';
update sd5010 set d_e_l_e_t_='*' where r_e_c_n_o_='341678';


select d3_estorno,a.* from sd3010 a where d3_filial='0301' and d3_numseq in ('99F1TL') and D3_CF='ER0'; and a.d_e_l_e_t_=' ';
update sd3010 set d3_estorno=' ' where d3_filial='0301' and d3_numseq in ('99F1TL') and D3_CF='DE4';

update sd3010 set D_E_L_E_T_='*', r_e_c_d_e_l_=r_e_c_n_o_ where d3_filial='0301' and d3_numseq in ('99F1TL') and D3_CF='ER0';