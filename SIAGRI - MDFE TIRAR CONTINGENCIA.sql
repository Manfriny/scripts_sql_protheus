--MDFe
SELECT cont_mfe, xenv_mfe, chav_mfe,a.situ_mfe,a.* FROM SYSDBA.mdfe a where nume_mfe = 391 and codi_emp =9;
update SYSDBA.mdfe set cont_mfe = 'N', xenv_mfe = null, chav_mfe = null, situ_mfe=0 where nume_mfe = 391 and codi_emp = 9;


--NOTA FISCAL
select SITU_NFE,XENV_NOT,CHAV_NOT,RECI_NOT,n.* from NOTA n WHERE NOTA_NOT = 99538 AND seri_not = 3 AND CODI_EMP = 1;
UPDATE NOTA n SET SITU_NFE = 0, XENV_NOT = NULL, CHAV_NOT = NULL, RECI_NOT = NULL WHERE NOTA_NOT = 99538 AND seri_not = 3 AND CODI_EMP = 1;