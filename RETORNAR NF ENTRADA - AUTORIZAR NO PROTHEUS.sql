--========== ENTRADA SF1 ==========
select d_e_l_e_t_,f1_doc,a.* from sf1010 a
--update sf1010 set d_e_l_e_t_=' ',r_e_c_d_e_l_=0 
where f1_filial='0303' and f1_doc in (
'000121'
) and f1_serie='3';
--========== ENTRADA SD1 ==========
select d_e_l_e_t_,d1_doc,a.* from sd1010 a
--update sd1010 set d_e_l_e_t_=' ',r_e_c_d_e_l_=0 
where d1_filial='0303' and d1_doc in (
'000121'
) and d1_serie='3';
--========== SFT FISCAL ==========
select d_e_l_e_t_,a.ft_nfiscal,a.* from sft010 a where ft_filial='0303' and a.ft_nfiscal in (
'000121'
) and ft_serie='3';
--========== SF3 FISCAL ==========
select d_e_l_e_t_,a.f3_nfiscal,a.* from sf3010 a where f3_filial='0303' and a.f3_nfiscal in (
'000121'
) and f3_serie='3';

--========== SPED050 ==========
select doc_id,DOC_CHV,a.* from SPED.sped050 a
--update SPED.sped050 set STATUS='6',STATUSCANC='0' 
where id_ent='000040' and substr(nfe_id,0,1) = '3' and trim(doc_id) in (
'121'
); 
--========== SPED054 ==========
select * from SPED.sped054
--update SPED.sped054 set d_e_l_e_t_=' ',r_e_c_d_e_l_=r_e_c_n_o_ 
where id_ent='000040' and substr(nfe_id,0,1) = '3' and trim(NFE_CHV) in (
'52200203482332000300550030000001211478729964'
) and CSTAT_SEFR <> '100' ; 