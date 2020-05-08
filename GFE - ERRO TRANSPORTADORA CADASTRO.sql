select A4_INSEST,a.* from sa4010 a where a4_cod='006216';
--update sa4010 set A4_INSEST='10.447.368-1   ' where a4_cod='006216';
--104473681      
    
select GU3_IE,a.* from gu3010 a where gu3_nmemit like '%2P%'; where GU3_CDEMIT='000001180';

select a2_inscr,a2_nome,a.* from sa2010 a where A2_NOME like '%2P%';

select d_e_l_e_t_,a.* from nj6010 a where NJ6_NUMPV in ('197487','197489','197666','197668');
update nj6010 set d_e_l_e_t_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NJ6_NUMPV in ('197487','197489','197666','197668');

select NJS_FILIAL, NJS_NRMOV, NJS_SEQ, NJS_CDPTCT, NJS_CDPERG, NJS_CODPRO, R_E_C_D_E_L_,a.* from NJS010 a where NJS_FILIAL='0301' and NJS_NRMOV='00023583' and NJS_SEQ='002' and a.d_e_l_e_t_=' ';
update NJS010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where NJS_FILIAL='0301' and NJS_NRMOV='00023583' and NJS_SEQ='002';

select a.njs_filial, a.NJS_NRMOV, a.NJS_SEQ, a.NJS_CDPTCT, a.NJS_CDPERG, a.NJS_CODPRO, a.R_E_C_D_E_L_,a.* from NJS010 a 
where NJS_FILIAL='0301' and NJS_NRMOV='00023583' and NJS_SEQ='002' and trim(NJS_CDPTCT)=trim('ARM.SEL.LOTES') and NJS_CDPERG='000100' and D_E_L_E_T_=' ';