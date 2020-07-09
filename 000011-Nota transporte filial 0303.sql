--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402

define f1filial='0302';
define f1doc= '018841';
define f1serie='1';
define f1ent = '000013';

define f2filial='0302';
define f2doc= '018841';
define f2serie='1';
define f2ent = '000013';
--000011/0 entrada

select * from sa2010 where a2_cod='813008671' and a2_loja='02';
--==================== ENTRADA ====================
select f1.d_e_l_e_t_,f1.f1_doc,f1.f1_chvnfe,f1.f1_especie,f1.f1_fornece,f1_loja,f1.* from sf1010 f1 where f1.f1_filial='&f1filial' and f1.f1_doc='&f1doc' and f1.f1_serie='&f1serie';
update sf1010 f1 set F1_CHVNFE='52200703482332000229550010000188411147556037' where f1.f1_filial='&f1filial' and f1.f1_doc='&f1doc' and f1.f1_serie='&f1serie';
update sf1010 f1 set f1.d_e_l_e_t_=' ',f1.r_e_c_d_e_l_=0 where f1.f1_filial='&f1filial' and f1.f1_doc='&f1doc' and f1.f1_serie='&f1serie';
select d1.d_e_l_e_t_,d1.d1_doc,d1.* from sd1010 d1 where d1.d1_filial='&f1filial' and d1.d1_doc='&f1doc' and d1.d1_serie='&f1serie';
update sd1010 d1 set d1.d_e_l_e_t_=' ',d1.r_e_c_d_e_l_=0 where d1.d1_filial='&f1filial' and d1.d1_doc='&f1doc' and d1.d1_serie='&f1serie';

select ft.d_e_l_e_t_,ft.ft_nfiscal,ft.ft_chvnfe,ft.ft_especie,FT_OBSERV,ft_dtcanc,ft.* from sft010 ft where ft.ft_filial='&f1filial' and ft.ft_nfiscal='&f1doc' and ft.ft_serie='&f1serie' and ft.ft_tipomov='E';
update sft010 ft set FT_OBSERV=' ',ft_dtcanc=' ' where ft.ft_filial='&f1filial' and ft.ft_nfiscal='&f1doc' and ft.ft_serie='&f1serie' and ft.ft_tipomov='E';
update sft010 ft set ft.d_e_l_e_t_=' ',ft.r_e_c_d_e_l_=0 where ft.ft_filial='&f1filial' and ft.ft_nfiscal='&f1doc' and ft.ft_serie='&f1serie' and ft.ft_tipomov='E';
update sft010 ft set ft.ft_chvnfe='52200703482332000229550010000188411147556037',ft.ft_especie='SPED' where ft.ft_filial='&f1filial' and ft.ft_nfiscal='&f1doc' and ft.ft_serie='&f1serie' and ft.ft_tipomov='E';
select f3.d_e_l_e_t_,f3.f3_nfiscal,f3.f3_chvnfe,f3.f3_especie,f3_observ,f3_dtcanc,f3.* from sf3010 f3 where f3.f3_filial='&f1filial' and f3.f3_nfiscal='&f1doc' and f3.f3_serie='&f1serie' and f3.f3_cfo between '1000' and '3000';
update sf3010 f3 set f3_observ=' ',f3_dtcanc=' ' where f3.f3_filial='&f1filial' and f3.f3_nfiscal='&f1doc' and f3.f3_serie='&f1serie' and f3.f3_cfo between '1000' and '3000';
update sf3010 f3 set f3.d_e_l_e_t_=' ' where f3.f3_filial='&f1filial' and f3.f3_nfiscal='&f1doc' and f3.f3_serie='&f1serie' and f3.f3_cfo between '1000' and '3000';
update sf3010 f3 set f3.f3_chvnfe='52200703482332000229550010000188411147556037',f3.f3_especie='SPED' where f3.f3_filial='&f1filial' and f3.f3_nfiscal='&f1doc' and f3.f3_serie='&f1serie' and f3.f3_cfo between '1000' and '3000';

select spd.doc_id,spd.doc_chv,spd.* from SPED.sped050 spd where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
--update SPED.sped050 spd set spd.doc_chv='52200703482332000229550010000188411147556037',NFE_PROT='152203243442982',CNPJDEST='81300867191',spd.tipo_canc='0',VERSAO='4.00',DATE_ENFE='20200705',TIME_ENFE='09:31:09' where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
update SPED.sped050 set STATUS='6',STATUSCANC='0' where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
select * from SPED.sped054 where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
update SPED.sped054 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and CSTAT_SEFR <> '100' and D_E_L_E_T_=' '; 

--==================== SAIDA ====================
select d_e_l_e_t_,f2_doc,f2.f2_chvnfe,f2.f2_especie,f2.* from sf2010 f2 where f2_filial='&f2filial' and f2_doc='&f2doc' and f2.f2_serie='&f2serie';
--update sf2010 f2 set f2.d_e_l_e_t_=' ',f2.r_e_c_d_e_l_=0 where f2_filial='&f2filial' and f2_doc='&f2doc' and f2.f2_serie='&f2serie';
update sf2010 f2 set f2.f2_chvnfe='52200502745323000210550010000408581919523493' where f2_filial='&f2filial' and f2_doc='&f2doc' and f2.f2_serie='&f2serie';
select d_e_l_e_t_,d2_doc,d2.d2_pedido,d2.d2_especie,d2.* from sd2010 d2 where d2_filial='&f2filial' and d2_doc='&f2doc' and d2.d2_serie='&f2serie';
update sd2010 d2 set D2_ESPECIE='SPED' where d2_filial='&f2filial' and d2_doc='&f2doc' and d2.d2_serie='&f2serie';

select d_e_l_e_t_,f3_nfiscal,f3.f3_chvnfe,f3.f3_especie,f3.f3_codrsef,f3.f3_observ,f3.f3_dtcanc,f3.* from sf3010 f3 where f3_filial='&f2filial' and f3_nfiscal='&f2doc' and f3.f3_serie='&f2serie' and f3.f3_cfo between '5000' and '7000';
update sf3010 f3 set f3.f3_codrsef='100',F3_CHVNFE='52200502745323000210550010000408581919523493' where f3_filial='&f2filial' and f3_nfiscal='&f2doc' and f3.f3_serie='&f2serie' and f3.f3_cfo between '5000' and '7000';
select d_e_l_e_t_,ft_nfiscal,ft.ft_chvnfe,ft.ft_especie,ft.ft_observ,ft.ft_dtcanc,ft.* from sft010 ft where ft_filial='&f2filial' and ft_nfiscal='&f2doc' and ft.ft_serie='&f2serie' and ft.ft_tipomov='S';
update sft010 ft set ft.ft_chvnfe='52200502745323000210550010000408541814103932' where ft_filial='&f2filial' and ft_nfiscal='&f2doc' and ft.ft_serie='&f2serie' and ft.ft_tipomov='S';


select * from SPED.sped050 where ID_ENT='&f2ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
update SPED.sped050 set STATUS='6',STATUSCANC='0',nfe_prot='152203130441167',DOC_CHV='52200502745323000210550010000408581919523493' where ID_ENT='&f2ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';

select * from SPED.sped054 where ID_ENT='&f2ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
--UPDATE SPED.sped054 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where ID_ENT='&f2ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
UPDATE SPED.sped054 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where ID_ENT='&f2ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ' and NFE_CHV <> '52200502745323000210550010000408581919523493';
UPDATE SPED.sped054 set CSTAT_SEFR='100',XMOT_SEFR='Autorizado o uso da NF-e',NFE_PROT='152203130441167' where ID_ENT='&f2ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ' and NFE_CHV = '52200502745323000210550010000408581919523493';

--================================================


select * from SPED.sped000 where ID_ENT in ('000001') order by PARAMETRO;
select * from SPED.sped000 where ID_ENT in ('000040') AND PARAMETRO='MV_MDAMB' order by PARAMETRO;
UPDATE SPED.sped000 SET CONTEUDO='1' where ID_ENT in ('000040') AND PARAMETRO='MV_MDAMB';

select a.d1_emissao,a.* from sd1010 a where a.d1_cod='020200001' order by a.d1_emissao desc;