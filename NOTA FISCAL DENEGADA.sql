--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402
--==================== CNPJS ========================
--0301 - 03482332000148 (03.482.332/0001-48)
--0302 - 03482332000229 (03.482.332/0002-29)
--0303 - 03482332000300 (03.482.332/0003-00)
--0401 - 02745323000130 (02.745.323/0001-30)
--0402 - 02745323000210 (02.745.323/0002-10)
--===================================================

define filial='0301';
define nota='113634';
define serie='3';
define entidade='000001';
define datacanc='20210409';
define protocolo='152213961701559';


select d_e_l_e_t_,f1.* from sf1010 f1 where f1.f1_filial='&filial' and f1.f1_doc='&nota' and f1.f1_serie='&serie';
select d_e_l_e_t_,d1.* from sd1010 d1 where d1.d1_filial='&filial' and d1.d1_doc='&nota' and d1.d1_serie='&serie';

select d_e_l_e_t_,f2.f2_fimp,f2.f2_status,f2.* from sf2010 f2 where f2.f2_filial='&filial' and f2.f2_doc='&nota' and f2.f2_serie='&serie';
update sf2010 f2 set f2.f2_fimp='D',f2.f2_status=' ',f2.d_e_l_e_t_='*',f2.r_e_c_d_e_l_=f2.r_e_c_n_o_ where f2.f2_filial='&filial' and f2.f2_doc='&nota' and f2.f2_serie='&serie';
select d_e_l_e_t_,d2.* from sd2010 d2 where d2.d2_filial='&filial' and d2.d2_doc='&nota' and d2.d2_serie='&serie';
update sd2010 d2 set d2.d_e_l_e_t_='*',d2.r_e_c_d_e_l_=d2.r_e_c_n_o_ where d2.d2_filial='&filial' and d2.d2_doc='&nota' and d2.d2_serie='&serie';

select ft.d_e_l_e_t_,ft.ft_nfiscal,ft.ft_dtcanc,ft.ft_observ,ft.ft_tipomov,ft.* from sft010 ft where ft.ft_filial='&filial' and ft.ft_nfiscal='&nota' and ft.ft_serie='&serie' and ft.d_e_l_e_t_=' ';
update sft010 ft set ft.ft_dtcanc='&datacanc',ft.ft_observ='NF DENEGADA' where ft.ft_filial='&filial' and ft.ft_nfiscal='&nota' and ft.ft_serie='&serie' and ft.d_e_l_e_t_=' ';
select f3.d_e_l_e_t_,f3.f3_nfiscal,f3.f3_codrsef,f3.f3_codret,f3.f3_dtcanc,f3.f3_observ,f3.* from sf3010 f3 where f3.f3_filial='&filial' and f3.f3_nfiscal='&nota' and f3.f3_serie='&serie' and f3.d_e_l_e_t_=' ';
UPDATE sf3010 f3 SET f3.f3_codrsef='302',f3.f3_dtcanc='&datacanc',f3.f3_observ='NF DENEGADA' where f3.f3_filial='&filial' and f3.f3_nfiscal='&nota' and f3.f3_serie='&serie' and f3.d_e_l_e_t_=' ';

--XML DA NOTA
select * from SPED.SPED050 spd where spd.id_ent='&entidade' and spd.nfe_id like '%'||'&serie'||'%'||'&nota'||'%' and spd.d_e_l_e_t_=' ';
update SPED.SPED050 spd set status=5,statuscanc=0,spd.nfe_prot='&protocolo' where spd.id_ent='&entidade' and spd.nfe_id like '%'||'&serie'||'%'||'&nota'||'%' and spd.d_e_l_e_t_=' ';

--MENSAGEN RETORNO SEFAZ
select * from SPED.SPED054 spd where spd.id_ent='&entidade' and spd.nfe_id like '%'||'&serie'||'%'||'&nota'||'%' and spd.d_e_l_e_t_=' ';
update SPED.SPED054 spd set CSTAT_SEFR='302',XMOT_SEFR='Uso Denegado : Irregularidade fiscal do destinatário' where spd.id_ent='&entidade' and spd.nfe_id like '%'||'&serie'||'%'||'&nota'||'%' and spd.d_e_l_e_t_=' ';
update SPED.SPED054 spd set spd.d_e_l_e_t_='*',spd.r_e_c_d_e_l_=spd.r_e_c_n_o_ where spd.id_ent='&entidade' and spd.nfe_id like '%'||'&serie'||'%'||'&nota'||'%' and spd.d_e_l_e_t_=' ' and CSTAT_SEFR <> '302';


--LOTE
select * from SPED.SPED052 spd where spd.id_ent='&entidade' and spd.lote='aaaaaa' and spd.d_e_l_e_t_=' ';

--EVENTOS NFE (ex:Lote de envio; Cancelamento)
select * from SPED.SPED150 where NFE_CHV='52200302745323000210550010000389781246668937';

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


