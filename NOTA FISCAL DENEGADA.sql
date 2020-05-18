--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402

select d_e_l_e_t_,a.* from sf1010 a where f1_filial='0402' and f1_doc='038983';
select d_e_l_e_t_,a.* from sd1010 a where d1_filial='0402' and d1_doc='038983';

select d_e_l_e_t_,a.* from sf2010 a where f2_filial='0402' and f2_doc='038983';
select d_e_l_e_t_,a.* from sd2010 a where d2_filial='0402' and d2_doc='038983';

select d_e_l_e_t_,ft_nfiscal,ft_dtcanc,ft_observ,FT_TIPOMOV,a.* from sft010 a where ft_filial='0402' and ft_nfiscal='038983' and ft_serie='1';
update sft010 set ft_dtcanc='20200304',ft_observ='NF CANCELADA' where ft_filial='0402' and ft_nfiscal='038983' and ft_serie='1';
select d_e_l_e_t_,f3_nfiscal,f3_codrsef,f3_codret,f3_dtcanc,f3_observ,a.* from sf3010 a where f3_filial='0402' and f3_nfiscal='038983' and f3_serie='1';
UPDATE sf3010 SET F3_CODRSEF='302',f3_dtcanc='20200304',f3_observ='NF DENEGADA' where f3_filial='0402' and f3_nfiscal='038983' and f3_serie='1';

--XML DA NOTA
select * from SPED.SPED050 where id_ent='000004' and NFE_ID like '%1%038983%' and D_E_L_E_T_=' ';
--UPDATE SPED.SPED050 set ambiente=1,modalidade=1,status=5,statuscanc=0 where id_ent='000004' and NFE_ID like '%1%038983%' and D_E_L_E_T_=' ';

--MENSAGEN RETORNO SEFAZ
select * from SPED.SPED054 where id_ent='000004' and NFE_ID like '%1%038983%' and D_E_L_E_T_=' ';
--UPDATE SPED.SPED054 set CSTAT_SEFR='302',XMOT_SEFR='Uso Denegado : Irregularidade fiscal do destinatário' where id_ent='000004' and NFE_ID like '%1%038983%' and D_E_L_E_T_=' ';
update SPED.SPED054 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where id_ent='000004' and NFE_ID like '%1%038983%' and D_E_L_E_T_=' ' and CSTAT_SEFR <> '302';


--LOTE
select * from SPED.SPED052 where id_ent='000004' and LOTE='000000000044402';

--EVENTOS NFE (ex:Lote de envio; Cancelamento)
select * from SPED.SPED150 where NFE_CHV='52200302745323000210550010000389781246668937';


