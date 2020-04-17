--REJEICAO - 855 - GAS AGRANEL.sql
define Doc     = '082872';
define Serie   = '3';
define Produto = '920400001';
define CodANP  = '210203001';

select CD6_VPART,CD6_PGLP,CD6_PGNN,CD6_PGNI,a.* from CD6010 a where cd6_cod='&Produto' and CD6_CODANP='&CodANP' and CD6_DOC='&Doc' and D_E_L_E_T_=' ';
update CD6010 set CD6_PGLP=80.5837,CD6_PGNN=9.0827,CD6_PGNI=10.3336,CD6_VPART=4.36 where cd6_cod='&Produto' and CD6_CODANP='&CodANP' and CD6_DOC='&Doc' and D_E_L_E_T_=' ';

select * from sped.sped050 where NFE_ID like '%'||'&Serie'||'%'||'&Doc'||'%' and D_E_L_E_T_=' ';
update sped.sped050 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'&Serie'||'%'||'&Doc'||'%' and D_E_L_E_T_=' ';
select * from sped.sped054 where NFE_ID like '%'||'&Serie'||'%'||'&Doc'||'%' and D_E_L_E_T_=' ';
update sped.sped054 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'&Serie'||'%'||'&Doc'||'%' and D_E_L_E_T_=' ';

select * from sb1010 where b1_cod='920400001';

select d2_pedido, a.* from sd2010 a where d2_filial='0301' and d2_doc='080077';
select * from sc6010 where c6_num='184056';

select b1_codbar,b1_codgtin,a.* from sb1010 a where b1_cod='920400001';
update sb1010 set b1_codgtin='000000000000000' where b1_cod='920400001';
select b5_2codbar,a.* from sb5010 a where b5_cod='920400001';


/*
123456789012345
000000000000000