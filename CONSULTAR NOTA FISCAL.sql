--===== NOTA FISCAL =============
select d_e_l_e_t_,a.* from sf2010 a where f2_filial='0301' and f2_doc='079567' and f2_serie='3';
--update sf2010 set d_e_l_e_t_=' ',r_e_c_d_e_l_=0 where f2_filial='0301' and f2_doc='079567' and f2_serie='3';
select d_e_l_e_t_,a.d2_pedido,a.* from sd2010 a where d2_filial='0301' and d2_doc='079567' and d2_serie='3';
--update sd2010 set d_e_l_e_t_=' ',r_e_c_d_e_l_=0 where d2_filial='0301' and d2_doc='079567' and d2_serie='3';
--====== LIVRO FISCAL ===========
select d_e_l_e_t_,f3_filial,f3_nfiscal,f3_serie,a.f3_codrsef,F3_TIPO,a.f3_observ,a.* from sf3010 a where f3_filial='0301' and f3_nfiscal='079567' and f3_serie='3';
--update sf3010 set F3_TIPO='D' where f3_filial='0301' and f3_nfiscal='079567' and f3_serie='3';
update sf3010 set d_e_l_e_t_='*' where f3_filial='0301' and f3_nfiscal='079567' and f3_serie='3';
select d_e_l_e_t_,a.ft_chvnfe,a.ft_tipo,a.ft_observ,a.* from sft010 a where ft_filial='0301' and ft_nfiscal='079567' and ft_serie='3';
--update sft010 set FT_TIPO='D' where ft_filial='0301' and ft_nfiscal='079567' and ft_serie='3';
update sft010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where ft_filial='0301' and ft_nfiscal='079567' and ft_serie='3';

--====== RETORNO SEFAZ ============
define Filial = '0301';
define Nota   = '079567';
define Serie  = '3';

select * from SPED.SPED050 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
--select * from SPED.SPED050 where R_E_C_N_O_=7540;
update SPED.SPED050 set D_E_L_E_T_='*',R_E_C_D_E_L_=r_e_c_n_o_ where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
select * from SPED.SPED054 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
update SPED.SPED054 set D_E_L_E_T_='*',R_E_C_D_E_L_=r_e_c_n_o_ where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';

select * from sped.sped054 where nfe_id like '%3%079567%';

select * from sped.sped052;
select * from sped.sped150;

--===== MOTIVO DA DESONERAÇÃO =====
SELECT f4_moticms FROM SF4010 WHERE F4_CODIGO='938';
/* MOTIVOS DE DESONERAÇÃO => F4_MOTICMS
Conforme erro do sefaz o motivo permitido para desoneracao de icms deveria ser um da lista
{'1', '3', '4', '5', '6', '7', '8', '9', '10', '11', '16', '90'}
*/
--============================
select * from sc6010 where c6_filial='0301' and c6_num='183440' and d_e_l_e_t_=' ';

select b1_cod,b1_codbar,b1_codgtin,b1_desc from SB1010 where b1_cod in (
'980800296'
);

update sb1010 set b1_codgtin='000000000000000',b1_desc='MORSA TORNO 6 POLEGADAS' where b1_cod='980800296';
/*
123456789012345
000000000000000
 