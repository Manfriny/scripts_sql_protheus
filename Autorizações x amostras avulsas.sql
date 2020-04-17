select * from (
select njf_filial,njf_codctr,sum(NJF_QTDAUT)QTD_AMOSTRA,sum(NJP.NJP_QTDAUT)qtd_autorizacao from NJF010 NJF 
inner join NJP010 NJP
on njp.njp_filial=njf.njf_filial and  NJP.NJP_CODCTR=NJF.NJF_CODCTR
where NJF.njf_filial='0301' 
--and NJF.NJF_CODCTR='001934' 
and NJF.NJF_DATA>='20180101'
and NJF.njf_status='3' and njp.njp_status<>'E' and NJF.D_E_L_E_T_=' ' and NJP.D_E_L_E_T_=' '
group by njf_filial,njf_codctr)
where QTD_AUTORIZACAO > QTD_AMOSTRA;