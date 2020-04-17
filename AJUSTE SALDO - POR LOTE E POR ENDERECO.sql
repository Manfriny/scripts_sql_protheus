define Fili = '0401';
define Prod = '980500027';
define Arma = '99';
define Lote = 'MN953162519';

select * from sb2010 where b2_filial='&Fili' and b2_local='&Arma' and B2_COD = '&Prod';
select * from SB8010 where b8_filial='&Fili' and b8_local='&Arma' and B8_produto = '&Prod';
select * from SBF010 where bF_filial='&Fili' and bF_local='&Arma' and BF_produto = '&Prod';
--update sbf010 set bf_lotectl='&Lote' where R_E_C_N_O_ in (1479791);

select * from sbk010 where bk_filial='&Fili' and bk_local='&Arma' and bk_cod = '&Prod' and bk_lotectl='&Lote' order by r_e_c_n_o_ desc;
--update sbk010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where R_E_C_N_O_ in (1479791);

select R_E_C_N_O_,a.* from sd5010 a where d5_filial='&Fili' and d5_local='&Arma' and d5_produto = '&Prod' and d5_lotectl='&Lote' and d5_numseq in ('99DZ68') order by D5_DATA desc;
--update sd5010 set D_E_L_E_T_='*' where R_E_C_N_O_ in (314141,307722);

select R_E_C_N_O_,a.* from SDB010 a where db_filial='&Fili' and db_local='&Arma' and db_produto = '&Prod' and db_lotectl='&Lote' and db_numseq in ('99DEHE') order by db_DATA desc;
--update SDB010 set D_E_L_E_T_='*' where R_E_C_N_O_ in (277916,271139);

select * from SDA010 where DA_filial='&Fili' and DA_local='&Arma' and DA_produto = '&Prod' order by da_data desc;
--update sda010 set D_E_L_E_T_='*' where R_E_C_N_O_ in (34986,34987);



select * from NNI010 where NNI_CODIGO='000087';
--update NNI010 set NNI_CODPRO='020100003' where NNI_CODIGO='000087';


select R_E_C_N_O_,d_e_l_e_t_,d3_estorno, a.* from sd3010 a where d3_tm > 499 and d3_cod='010400031' and D3_NUMSEQ='99DZ68';
--update sd3010 set D3_ESTORNO='S' where R_E_C_N_O_=605363;

select R_E_C_N_O_,d_e_l_e_t_,d5_estorno, a.* from sd5010 a where d5_filial='&Fili' and d5_local='&Arma' and d5_produto = '&Prod' and D5_ORIGLAN > '499' and d5_lotectl='&Lote' and d5_numseq in ('99DZ68');
--update sd5010 set d5_estorno='S' where R_E_C_N_O_=316170;

select R_E_C_N_O_,d_e_l_e_t_,db_estorno, a.* from SDB010 a where db_filial='&Fili' and db_local='&Arma' and db_produto = '&Prod' and db_tm > '499' and db_lotectl='&Lote' and db_numseq in ('99DZ68') order by db_DATA desc;
--update sdb010 set DB_ESTORNO='S' where R_E_C_N_O_=280075;
--update sdb010 set d_e_l_e_t_=' ' where R_E_C_N_O_=280075;