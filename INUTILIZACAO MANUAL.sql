define Filial='0301';
define Nota='099972';
define Serie='3';

select a.d_e_l_e_t_,a.f1_doc,f1_serie,a.f1_filial,a.f1_emissao,a.f1_chvnfe,a.* from sf1010 a where a.f1_filial='0301' and a.f1_doc in ('078231') order by a.f1_doc;

--ENTRADA
select a.d_e_l_e_t_,a.* from SF1010 a where F1_FILIAL=&Filial and F1_DOC='&Nota' and F1_SERIE='&Serie';
select a.d_e_l_e_t_,a.* from SD1010 a where D1_FILIAL='&Filial' and D1_DOC='&Nota' and D1_SERIE='&Serie';
select a.d_e_l_e_t_,a.* from SFT010 a where FT_FILIAL='&Filial' and FT_NFISCAL='&Nota' and FT_SERIE='&Serie';
update SFT010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where FT_FILIAL='&Filial' and FT_NFISCAL='&Nota' and FT_SERIE='&Serie';
select a.d_e_l_e_t_,a.f3_codrsef,a.* from SF3010 a where F3_FILIAL='&Filial' and F3_NFISCAL='&Nota' and F3_SERIE='&Serie';
update SF3010 set d_e_l_e_t_='*' where F3_FILIAL='&Filial' and F3_NFISCAL='&Nota' and F3_SERIE='&Serie';
select a.d_e_l_e_t_,a.* from SPED.SPED050 a where NFE_ID like '%&Serie%&Nota%';

select * from SPED.SPED050 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
update SPED.SPED050 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';

select * from SPED.SPED054 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
update SPED.SPED054 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';



--SAIDA
select F2_FIMP,F2_STATUS,f2.D_E_L_E_T_,f2.F2_FILIAL,f2.F2_DOC,f2.f2_chvnfe,f2.* from SF2010 f2 where F2_FILIAL='&Filial' and F2_DOC='&Nota' and F2_SERIE=&Serie;
--update sf2010 set f2_fimp=' ' where F2_FILIAL='&Filial' and F2_DOC='&Nota' and F2_SERIE='&Serie';
select d2.D_E_L_E_T_,d2.D2_FILIAL,d2.D2_DOC,d2.* from SD2010 d2 where D2_FILIAL='&Filial' and D2_DOC='&Nota' and D2_SERIE=&Serie;

select ft.D_E_L_E_T_,ft.FT_NFISCAL,ft.* from SFT010 ft where FT_FILIAL='&Filial' and FT_NFISCAL='&Nota' and FT_SERIE='&Serie';
--update sft010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where FT_FILIAL='&Filial' and FT_NFISCAL='&Nota' and FT_SERIE='&Serie';
select f3.D_E_L_E_T_,f3.F3_FILIAL,f3.F3_NFISCAL,f3.F3_CODRSEF,f3.* from SF3010 f3 where F3_FILIAL='&Filial' and F3_NFISCAL='&Nota' and F3_SERIE='&Serie';
--update sf3010 set d_e_l_e_t_='*' where F3_FILIAL='&Filial' and F3_NFISCAL='&Nota' and F3_SERIE='&Serie';


select sped.D_E_L_E_T_,sped.* from SPED.SPED050 sped where NFE_ID like '%&Serie%&Nota%' and D_E_L_E_T_=' ';
--update SPED.SPED050 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
--update SPED.SPED050 set d_e_l_e_t_=' ',r_e_c_d_e_l_=0 where r_e_c_n_o_=222152;


select d_e_l_e_t_,sped.* from SPED.SPED054 sped where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
--update SPED.SPED054 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
--update SPED.SPED054 set D_E_L_E_T_=' ',R_E_C_D_E_L_=0 where r_e_c_n_o_=286671;

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






