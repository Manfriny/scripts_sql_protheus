
select B1_GRUPO,a.* from sb1010 a where b1_cod='920400001';

select a.CD6_CODANP,CD6_PGLP,CD6_PGNN,a.* from CD6010 a where cd6_cod='920400001' and a.D_E_L_E_T_=' ';
update CD6010 set CD6_PGLP=80.5837,CD6_PGNN=19.4163,CD6_VPART=4.36 where cd6_cod='920400001' and D_E_L_E_T_=' ';

select * from SPED.SPED050 where NFE_ID like '%'||'3'||'%'||'070260'||'%' and D_E_L_E_T_=' ';
update SPED.SPED050 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'3'||'%'||'070260'||'%' and D_E_L_E_T_=' ';
select * from SPED.SPED054 where NFE_ID like '%'||'3'||'%'||'070260'||'%' and D_E_L_E_T_=' ';
update SPED.SPED054 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'3'||'%'||'070260'||'%' and D_E_L_E_T_=' ';
select * from SPED.SPED150;