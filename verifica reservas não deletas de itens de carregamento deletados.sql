SELECT 
sc0.C0_NUM,
npn.NPN_ORDEMC
FROM NPN010 npn
inner join sc0010 sc0 on sc0.C0_FILIAL=npn.NPN_FILIAL and sc0.C0_NUM=npn.NPN_RESERV and sc0.D_E_L_E_T_=' '
where npn.D_E_L_E_T_='*';

select * from npn010 where NPN_ORDEMC='009196';