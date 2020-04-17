	select                                                             	
	 F3_NFISCAL,F3_SERIE,F3_FILIAL,F3_CHVNFE,sp50.STATUS,sp50.STATUSCANC,F3_XLEMAIL 
	from sf3010 sf3                                                    
	inner join sped.sped050 sp50 on sp50.DOC_CHV=F3_CHVNFE  and sp50.D_E_L_E_T_=' '       
	where sf3.D_E_L_E_T_=' ' and sf3.F3_FILIAL='0301' and sf3.F3_NFISCAL BETWEEN '"+MV_PAR01+"' and '"+MV_PAR02+"'  and sf3.F3_SERIE='"+MV_PAR03+"' 
--	If MV_PAR04==1
--	and SUBSTR(SF3.F3_CFO,1,1) < '5' AND SF3.F3_FORMUL='S'
--	ElseIf MV_PAR04==2
	and SUBSTR(SF3.F3_CFO,1,1) >= '5';