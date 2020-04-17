select x.reprocesso, y.* from sped.tsstr1 x inner join sped.sped050 y on y.r_e_c_n_o_ = x.docrecno;


select D_E_L_E_T_,a.* from sd1010 a where d1_filial='0301' and d1_doc='057626';


select D_E_L_E_T_,a.f1_EMISSAO,f1_doc,a.* from sf1010 a where f1_filial='0301' and f1_doc='057626';
select D_E_L_E_T_,a.D2_EMISSAO,d2_doc,a.D2_SERIE,a.* from sd2010 a where d2_filial='0301' and d2_doc='079567';


select * from sped.sped050 where NFE_ID like '%3%079567%';
select * from sped.sped054 where NFE_ID like '%3%079567%';