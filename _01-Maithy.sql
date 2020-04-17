select a.d1_local,a.d1_ender,a.d1_lotectl,a.* from sd1010 a where d1_doc='000012895' and d1_serie='1';

select * from sb2010 where b2_filial='0301' and b2_local='51' and b2_cod='060400038';
select * from sbf010 where bf_filial='0301' and bf_local='51' and bf_produto='060400038';

select * from sd3010 where d3_filial='0301' and d3_cod='060400038';

select * from SDA010 where da_produto='980200043';
update SDA010 set d_e_l_e_t_='*' where da_produto='060400038' and r_e_c_n_o_ in (39489,39490);

select * from sd2010 where d2_doc='000661';

--MAITHY
select f1_status,a.f1_tpfrete,f1_doc,a.d_e_l_e_t_,a.f1_fornece,f1_emissao,a.* from sf1010 a where f1_filial='0301' and f1_doc='000000728' and f1_dtdigit='20190510';
--update sf1010 set f1_tpfrete='C' where f1_filial='0301' and f1_doc='000000728' and f1_dtdigit='20190510';
select d1_tes,d1_doc,a.d_e_l_e_t_,a.d1_fornece,a.* from sd1010 a where d1_filial='0301' and d1_doc='000000728' and d1_dtdigit='20190510';
--update sd1010 set d1_tes=' ' where d1_filial='0301' and d1_doc='000000728' and d1_dtdigit='20190510';

select * from se2010 where e2_num='000000728' and e2_fornece='09390124'; and d_e_l_e_t_=' ';
update se2010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where e2_num='000000728' and e2_fornece='09390124' and d_e_l_e_t_=' ';
select * from se5010 where e5_numero='000000728' and e5_fornece='09390124' and d_e_l_e_t_=' ';

select d_e_l_e_t_,a.* from sft010 a where ft_filial='0301' and ft_nfiscal='000000728' and ft_emissao='20190503' and d_e_l_e_t_=' ';
select d_e_l_e_t_,a.* from sf3010 a where f3_filial='0301' and f3_nfiscal='000000728' and f3_emissao='20190503' and d_e_l_e_t_=' ';