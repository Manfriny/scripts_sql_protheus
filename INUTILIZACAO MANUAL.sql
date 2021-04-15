--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402
--==================== CNPJS ========================
--0301 - 03482332000148 (03.482.332/0001-48)
--0302 - 03482332000229 (03.482.332/0002-29)
--0303 - 03482332000300 (03.482.332/0003-00)
--0401 - 02745323000130 (02.745.323/0001-30)
--0402 - 02745323000210 (02.745.323/0002-10)
--===================================================

define f1filial='0302';
define f1doc= '029282';
define f1serie='1';
define f1ent = '000013';

define f2filial='0302';
define f2doc= '029282';
define f2serie='1';
define f2ent = '000013';

SELECT f1.d_e_l_e_t_,f1.f1_doc,f1.f1_chvnfe,f1.f1_especie,f1.f1_fornece,f1_loja,f1.* from sf1010 f1 where f1.f1_filial='&f1filial' and f1.f1_doc='&f1doc' and f1.f1_serie='&f1serie';
update sf1010 f1 set f1.d_e_l_e_t_='*',f1.r_e_c_d_e_l_=f1.r_e_c_n_o_,f1.f1_chvnfe=' ' where f1.f1_filial='&f1filial' and f1.f1_doc='&f1doc' and f1.f1_serie='&f1serie';

SELECT d1.d_e_l_e_t_,d1.d1_doc,d1.* from sd1010 d1 where d1.d1_filial='&f1filial' and d1.d1_doc='&f1doc' and d1.d1_serie='&f1serie';
update sd1010 d1 set d1.d_e_l_e_t_='*',d1.r_e_c_d_e_l_=d1.r_e_c_n_o_ where d1.d1_filial='&f1filial' and d1.d1_doc='&f1doc' and d1.d1_serie='&f1serie';

SELECT ft.d_e_l_e_t_,ft.ft_nfiscal,ft.ft_chvnfe,ft.ft_especie,FT_OBSERV,ft_dtcanc,ft.* from sft010 ft where ft.ft_filial='&f1filial' and ft.ft_nfiscal='&f1doc' and ft.ft_serie='&f1serie' and ft.ft_tipomov='E';
update sft010 ft set ft.ft_chvnfe=' ',ft.ft_observ='NF CANCELADA',ft.ft_dtcanc='20210319' where ft.ft_filial='&f1filial' and ft.ft_nfiscal='&f1doc' and ft.ft_serie='&f1serie' and ft.ft_tipomov='E';

SELECT f3.d_e_l_e_t_,f3.f3_nfiscal,f3.f3_codrsef,f3.f3_chvnfe,f3.f3_especie,f3_observ,f3_dtcanc,f3.* from sf3010 f3 where f3.f3_filial='&f1filial' and f3.f3_nfiscal='&f1doc' and f3.f3_serie='&f1serie' and f3.f3_cfo between '1000' and '3000';
update sf3010 f3 set f3.f3_codrsef='102',f3.f3_chvnfe=' ',f3.f3_observ='NF CANCELADA',f3.f3_dtcanc='20210319' where f3.f3_filial='&f1filial' and f3.f3_nfiscal='&f1doc' and f3.f3_serie='&f1serie' and f3.f3_cfo between '1000' and '3000';

SELECT spd.nfe_prot,spd.status,spd.statuscanc,spd.tipo_canc,spd.date_enfe,spd.time_enfe,spd.* from SPED.sped050 spd where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
--aqui nao vai precisar mexer, pois gera quando inutiliza
--update SPED.sped050 spd set spd.nfe_prot='152213775163670',spd.tipo_canc='2',spd.status=7,spd.statuscanc=2,spd.date_enfe='20210126',spd.time_enfe='14:40:08' where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';

SELECT * from SPED.sped054 spd where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';
--aqui nao vai precisar mexer, pois gera quando inutiliza (fica o erro da rejeição e a inutilização
update SPED.sped054 spd 
set spd.cstat_sefr='102',spd.xmot_sefr='Inutilização de número homologado',spd.dtrec_sefr='20210126',
spd.hrrec_sefr='15:55:31',spd.nfe_prot='152213775163670',spd.dtver_lotp=' ',spd.hrver_lotp=' '
where id_ent='&f1ent' and NFE_ID like '%'||'&f1serie'||'%'||'&f1doc'||'%' and D_E_L_E_T_=' ';

--=================================================
--SAIDA
--=================================================
SELECT f2.d_e_l_e_t_,f2.f2_doc,f2.f2_chvnfe,f2.f2_especie,f2.f2_cliente,f2_loja,f2.* from sf2010 f2 where f2.f2_filial='&f2filial' and f2.f2_doc='&f2doc' and f2.f2_serie='&f2serie';
update sf2010 f2 set f2.d_e_l_e_t_='*',f2.r_e_c_d_e_l_=f2.r_e_c_n_o_,f2.f2_chvnfe=' ' where f2.f2_filial='&f2filial' and f2.f2_doc='&f2doc' and f2.f2_serie='&f2serie';
update sf2010 f2 set f2.d_e_l_e_t_='*',f2.r_e_c_d_e_l_=f2.r_e_c_n_o_ where f2.f2_filial='&f2filial' and f2.f2_doc='&f2doc' and f2.f2_serie='&f2serie';

SELECT d2.d_e_l_e_t_,d2.d2_doc,d2.* from sd2010 d2 where d2.d2_filial='&f1filial' and d2.d2_doc='&f1doc' and d2.d2_serie='&f1serie';
update sd2010 d2 set d2.d_e_l_e_t_='*',d2.r_e_c_d_e_l_=d2.r_e_c_n_o_ where d2.d2_filial='&f1filial' and d2.d2_doc='&f1doc' and d2.d2_serie='&f1serie';

SELECT ft.d_e_l_e_t_,ft.ft_nfiscal,ft.ft_chvnfe,ft.ft_especie,FT_OBSERV,ft_dtcanc,ft.* from sft010 ft where ft.ft_filial='&f2filial' and ft.ft_nfiscal='&f2doc' and ft.ft_serie='&f2serie' and ft.ft_tipomov='S';
update sft010 ft set ft.ft_chvnfe=' ',ft.ft_observ='NF CANCELADA',ft.ft_dtcanc='20210319' where ft.ft_filial='&f2filial' and ft.ft_nfiscal='&f2doc' and ft.ft_serie='&f2serie' and ft.ft_tipomov='S';
update sft010 ft set ft.d_e_l_e_t_='*',ft.r_e_c_d_e_l_=ft.r_e_c_n_o_ where ft.ft_filial='&f2filial' and ft.ft_nfiscal='&f2doc' and ft.ft_serie='&f2serie' and ft.ft_tipomov='S';

SELECT f3.d_e_l_e_t_,f3.f3_nfiscal,f3.f3_codrsef,f3.f3_chvnfe,f3.f3_especie,f3_observ,f3_dtcanc,f3.* from sf3010 f3 where f3.f3_filial='&f2filial' and f3.f3_nfiscal='&f2doc' and f3.f3_serie='&f2serie' and f3.f3_cfo between '5000' and '7999';
update sf3010 f3 set f3.f3_codrsef='102',f3.f3_chvnfe=' ',f3.f3_observ='NF CANCELADA',f3.f3_dtcanc='20210319' where f3.f3_filial='&f2filial' and f3.f3_nfiscal='&f2doc' and f3.f3_serie='&f2serie' and f3.f3_cfo between '5000' and '7999';
update sf3010 f3 set f3.d_e_l_e_t_='*' where f3.f3_filial='&f2filial' and f3.f3_nfiscal='&f2doc' and f3.f3_serie='&f2serie' and f3.f3_cfo between '5000' and '7999';

SELECT spd.nfe_prot,spd.status,spd.statuscanc,spd.tipo_canc,spd.date_enfe,spd.time_enfe,spd.* from SPED.sped050 spd where id_ent='&f2ent' and NFE_ID like '%'||'&f2serie'||'%'||'&f2doc'||'%' and D_E_L_E_T_=' ';
--aqui nao vai precisar mexer, pois gera quando inutiliza
--update SPED.sped050 spd set spd.nfe_prot='152213775163670',spd.tipo_canc='2',spd.status=7,spd.statuscanc=2,spd.date_enfe='20210126',spd.time_enfe='14:40:08' where id_ent='&f2ent' and NFE_ID like '%'||'&f2serie'||'%'||'&f2doc'||'%' and D_E_L_E_T_=' ';
update SPED.sped050 spd set spd.d_e_l_e_t_='*',spd.r_e_c_d_e_l_=spd.r_e_c_n_o_ where id_ent='&f2ent' and NFE_ID like '%'||'&f2serie'||'%'||'&f2doc'||'%' and D_E_L_E_T_=' ';

SELECT * from SPED.sped054 spd where id_ent='&f2ent' and NFE_ID like '%'||'&f2serie'||'%'||'&f2doc'||'%' and D_E_L_E_T_=' ';
--aqui nao vai precisar mexer, pois gera quando inutiliza (fica o erro da rejeição e a inutilização
update SPED.sped054 spd 
set spd.cstat_sefr='102',spd.xmot_sefr='Inutilização de número homologado',spd.dtrec_sefr='20210126',
spd.hrrec_sefr='15:55:31',spd.nfe_prot='152213775163670',spd.dtver_lotp=' ',spd.hrver_lotp=' '
where id_ent='&f2ent' and NFE_ID like '%'||'&f2serie'||'%'||'&f2doc'||'%' and D_E_L_E_T_=' ';

update SPED.sped054 spd set spd.d_e_l_e_t_='*',spd.r_e_c_d_e_l_=spd.r_e_c_n_o_ where id_ent='&f2ent' and NFE_ID like '%'||'&f2serie'||'%'||'&f2doc'||'%' and D_E_L_E_T_=' ';
--=================================================
/*
Campo F2_FIMP – Flag de impressão (http://tdn.totvs.com/pages/viewpage.action?pageId=189317260)
“  ” - Não transmitida
S - Autorizada
T - Transmitida
D - Uso Denegado
N - Não autorizada

Campo F2_STATUS – Status Canc. NFe (registrado apenas quando se faz uso do FATJOBNFE)
“  ” - Não houve tentativa de cancelamento com uso do FATJOBNFE
015 - Cancelamento Autorizado
025 - Cancelamento não transmitido (Aguardando retorno do SEFAZ)
026 - Cancelamento não autorizado
030 - Inutilização de numeração autorizada
036 - Cancelamento autorizado fora do prazo

--=================================================
http://tdn.totvs.com/pages/releaseview.action?pageId=272154294
