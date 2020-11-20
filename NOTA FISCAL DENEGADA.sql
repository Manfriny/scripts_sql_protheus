--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402

select d_e_l_e_t_,f1.* from sf1010 f1 where f1.f1_filial='0301' and f1.f1_doc='095737' and f1.f1_serie='3';
select d_e_l_e_t_,d1.* from sd1010 d1 where d1.d1_filial='0301' and d1.d1_doc='095737' and d1.d1_serie='3';

select d_e_l_e_t_,f2.* from sf2010 f2 where f2.f2_filial='0301' and f2.f2_doc='095737' and f2.f2_serie='3';
select d_e_l_e_t_,d2.* from sd2010 d2 where d2.d2_filial='0301' and d2.d2_doc='095737' and d2.d2_serie='3';

select ft.d_e_l_e_t_,ft.ft_nfiscal,ft.ft_dtcanc,ft.ft_observ,ft.ft_tipomov,ft.* from sft010 ft where ft.ft_filial='0301' and ft.ft_nfiscal='095737' and ft.ft_serie='3' and ft.d_e_l_e_t_=' ';
update sft010 ft set ft.ft_dtcanc='20201006',ft.ft_observ='NF CANCELADA' where ft.ft_filial='0301' and ft.ft_nfiscal='095737' and ft.ft_serie='3' and ft.d_e_l_e_t_=' ';
select f3.d_e_l_e_t_,f3.f3_nfiscal,f3.f3_codrsef,f3.f3_codret,f3.f3_dtcanc,f3.f3_observ,f3.* from sf3010 f3 where f3.f3_filial='0301' and f3.f3_nfiscal='095737' and f3.f3_serie='3' and f3.d_e_l_e_t_=' ';
UPDATE sf3010 f3 SET f3.f3_codrsef='302',f3.f3_dtcanc='20201006',f3.f3_observ='NF DENEGADA' where f3.f3_filial='0301' and f3.f3_nfiscal='095737' and f3.f3_serie='3' and f3.d_e_l_e_t_=' ';

--XML DA NOTA
select * from SPED.SPED050 spd where spd.id_ent='000001' and spd.nfe_id like '%3%095737%' and D_E_L_E_T_=' ';
UPDATE SPED.SPED050 spd set spd.ambiente=1,spd.modalidade=1,status=5,statuscanc=0 where spd.id_ent='000001' and spd.nfe_id like '%3%095737%' and D_E_L_E_T_=' ';

--MENSAGEN RETORNO SEFAZ
select * from SPED.SPED054 where id_ent='000004' and NFE_ID like '%1%038983%' and D_E_L_E_T_=' ';
--UPDATE SPED.SPED054 set CSTAT_SEFR='302',XMOT_SEFR='Uso Denegado : Irregularidade fiscal do destinatário' where id_ent='000004' and NFE_ID like '%1%038983%' and D_E_L_E_T_=' ';
update SPED.SPED054 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where id_ent='000004' and NFE_ID like '%1%038983%' and D_E_L_E_T_=' ' and CSTAT_SEFR <> '302';


--LOTE
select * from SPED.SPED052 where id_ent='000004' and LOTE='000000000044402';

--EVENTOS NFE (ex:Lote de envio; Cancelamento)
select * from SPED.SPED150 where NFE_CHV='52200302745323000210550010000389781246668937';


