/*map CODI_ROT=integer;CODI_REG=integer;VDCODI_TRA=integer*/ 
select PE.CODI_EMP, 
       PE.PEDI_PED, 
       PE.SERI_PED, 
       PE.CODI_TRA, 
       TR.RAZA_TRA, 
       PE.DEMI_PED, 
       PE.DATA_VLR, 
       PE.VCTO_PED, 
       PE.COD1_PES, 
	   (select PES.NOME_PES from PESSOAL PES where (PES.CODI_PES = PE.COD1_PES)) as NOME_PES, 
       PE.CCFO_CFO, 
       PE.COND_CON, 
       CO.DESC_CON, 
       PE.DPON_PED, 
       IPE.CODI_PSV, 
       PD.DESC_PSV, 
       IPE.CODI_PSV ||' - '|| PD.DESC_PSV as DESC_PSV2, 
       IPE.CODI_PSV ||' - '|| PD.COMP_PSV as COMP_PSV2, 
       PD.UNID_PSV, 
       PD.COMP_PSV, 
       IPE.TABE_CTA, 
       IPE.VLIQ_IPE, 
       PE.SASS_PED, 
       PE.CODI_TOP, 
       NEG.NUME_NEG, 
       PE.PEDO_PED, 
       PE.OBSE_PED, 
       PE.COBC_OBS, 
       (select OB.DESC_OBS from OBSERVAC OB where (OB.CODI_OBS = PE.CODI_OBS)) as DESC_OBS, 
       (select OB1.DESC_OBS from OBSERVAC OB1 where  (OB1.CODI_OBS = PE.COBC_OBS)) as OBCO_OBS, 
       PE.OCOM_PED, 
       PE.CODI_OBS, 
       PE.CODI_CIC, 
       PE.CODI_ZON, 
       IPE.DTPR_IPE, 
       (COALESCE(IPE.QTDE_IPE, 0)   - (case when (select count(*) from OCORRENCIAS O where O.CODI_EMP = PE.CODI_EMP and O.PEDI_PED = PE.PEDI_PED and O.SERI_PED = PE.SERI_PED and O.CODI_PSV = IPE.CODI_PSV) > 0 then                     coalesce((  select O.QTDE_OCO                                            from(select * from  OCORRENCIAS O                                                 order by O.DATA_OCO desc  ) O                                                where O.CODI_EMP = PE.CODI_EMP                                               and O.PEDI_PED = PE.PEDI_PED                                               and O.SERI_PED = PE.SERI_PED                                               and O.CODI_PSV = IPE.CODI_PSV                                                                                                         and rownum <= 1 ), 0)     else        coalesce(IPE.QPER_IPE,0)     end)) as QPED_IPE, 
       PE.PROP_PRO, 
       PRO.DESC_PRO, 
       PE.CODI_EMP || '.' || PE.PEDI_PED || '.' || PE.SERI_PED GRUPO_PEDIDO, 
       COALESCE(IPE.QTDE_IPE, 0) - 
       (select QENT 
          from  table( QTDE_ENTR_PED_VEN(IPE.CODI_EMP, 
               IPE.PEDI_PED, 
               IPE.SERI_PED, 
               IPE.CODI_PSV 
               ) ) 
        ) - coalesce(IPE.QPER_IPE,0) as QFAT_IPE, 
       (select QENT 
          from  table( QTDE_ENTR_PED_VEN(IPE.CODI_EMP, 
               IPE.PEDI_PED, 
               IPE.SERI_PED, 
               IPE.CODI_PSV 
               ) ) 
        ) QENT_IPE, 
       (select QDEV 
          from  table( QTDE_ENTR_PED_VEN(IPE.CODI_EMP, 
               IPE.PEDI_PED, 
               IPE.SERI_PED, 
               IPE.CODI_PSV 
               ) ) 
        ) QDEV_IPE, 
       I.ABRE_IND, 
       PE.CODI_IND, 
       coalesce(TRVD.CODI_TRA, PE.CODI_TRA) as VDCODI_TRA, 
       coalesce(TRVD.RAZA_TRA, TR.RAZA_TRA) as VDRAZA_TRA, 
       EM.CODI_EMB, 
       EM.DESC_EMB, 
	   (select PSU.NOME_PES from PESSOAL PSU where (PSU.CODI_PES = CDU.CODI_PES)) as NOME_USU, 
	   (select MNP.DESC_MUN from MUNICIPIO MNP where (MNP.CODI_MUN = PRO.CODI_MUN)) as MUNIPRO, 
       PRO.ISNE_PRO, 
       PRO.LOC1_PRO as LOCALPRO, 
       PRO.FONE_PRO as FONEPRO, 
       TR.CGC_TRA, 
	    PR.CEST_PRO, 
	    PR.QTE1_PRO, 
	    PR.QTE2_PRO, 
       MUN.DESC_MUN as MUNCLI,MUN.ESTA_MUN as UFCLI, 
       TBL.BASI_TAB, TBL.DESC_TAB, TBL.ACRE_TAB,IPE.VLOR_IPE,  
       case when (select count(*)  
                  from OCORRENCIAS O  
                  where O.CODI_EMP = PE.CODI_EMP  
                     and O.PEDI_PED = PE.PEDI_PED  
                     and O.SERI_PED = PE.SERI_PED  
                     and O.CODI_PSV = IPE.CODI_PSV) > 0  
            then  
               coalesce((  
                        select O.QTDE_OCO 
                        from(select * from  OCORRENCIAS O                                                  
                         order by O.DATA_OCO desc 
						) O                                                  
                        where O.CODI_EMP = PE.CODI_EMP                                                
                        and O.PEDI_PED = PE.PEDI_PED                                               
                        and O.SERI_PED = PE.SERI_PED                                              
                        and O.CODI_PSV = IPE.CODI_PSV                                             
                                         
                         and rownum <= 1 
                        ), 0)  
            else  
            coalesce(IPE.QPER_IPE,0)  
        end as  QPER_IPE,	    
       case when (PE.PROP_PRO > 0) and (PE.PROP_PRO is not null) then REG2.DESC_REG else  REG.DESC_REG end as DESC_REG, 
       case when (PE.PROP_PRO > 0) and (PE.PROP_PRO is not null) then ROT2.CODI_ROT else  ROT.CODI_ROT end as CODI_ROT,  
       case when (PE.PROP_PRO > 0) and (PE.PROP_PRO is not null) then REG2.CODI_REG else  REG.CODI_REG end as CODI_REG,  
       case when (PE.PROP_PRO > 0) and (PE.PROP_PRO is not null) then ROT2.DESC_ROT else  ROT.DESC_ROT end as DESC_ROT, 
       coalesce (PR.PBRU_PRO * IPE.QTDE_IPE,0)  as PBRU_PRO ,  coalesce(PR.PLIQ_PRO * IPE.QTDE_IPE,0) as PLIQ_PRO, 
       IPE.DSOF_IPE, IPE.VDOF_IPE, PE.VCTO_PED, PE.ORIG_PED, 
       case when PE.ORIG_PED = '1' then 
          (select   CAD2.CODI_USU  from NEGOCESP NCE  
                inner join CADUSU CAD2 on (NCE.CODI_USU = CAD2.CODI_USU) 
              where (NCE.CTRL_NEG = NEG.CTRL_NEG  
                 AND NCE.CODI_EMP = NEG.CODI_EMP 
                 AND NCE.CODI_PES = NEG.CODI_PES)  )  
       else '' end AS NOME_LANCOU_NEGOCIACAO, 
       case when PE.ORIG_PED = '1' then  
          (select  CAD1.CODI_USU  from CADUSU CAD1 
              where (CAD1.CODI_USU = NEG.CODI_USU)) 
       else '' end  AS NOME_ULTIMO_ALTERAR_NEGOCIACAO, 
       case when PE.ORIG_PED = '1' then 
          (select  CAD3.CODI_USU from CADUSU CAD3 
            where (NEG.USLF_NEG =CAD3.CODI_USU)) 
       else '' end  AS NOME_ULTIMO_LIBERAR_NEGOCIACAO 
, ((IPE.VLIQ_IPE)  * (IPE.QTDE_IPE - IPE.QPER_IPE)  * case when ((coalesce(PGF.DSOF_PGF, '0') in ('1', '2')) and (PE.VCTO_PED <= IPE.VDOF_IPE)) then                           1 - (IPE.DSOF_IPE / 100)                  else                          1                 end) - (IPE.CTAB_IPE  * (IPE.QTDE_IPE - IPE.QPER_IPE)) as VR_LUCRO, case when (((IPE.VLIQ_IPE - case when coalesce(PGF.DIPM_PGF,'N') = 'S' then (IPE.ICMS_IPE /IPE.QTDE_IPE) else 0 end) * (IPE.QTDE_IPE - IPE.QPER_IPE) * case when ((coalesce(PGF.DSOF_PGF, '0') in ('1', '2')) and (PE.VCTO_PED <= IPE.VDOF_IPE)) then 1 - (IPE.DSOF_IPE / 100)       else 1 end) <> 0) then           (((IPE.VLIQ_IPE - case when coalesce(PGF.DIPM_PGF,'N') = 'S' then (IPE.ICMS_IPE /IPE.QTDE_IPE) else 0 end) * (IPE.QTDE_IPE - IPE.QPER_IPE)          * case when ((coalesce(PGF.DSOF_PGF, '0') in ('1', '2')) and (PE.VCTO_PED <= IPE.VDOF_IPE)) then 1 - (IPE.DSOF_IPE / 100)           else 1           end) - ((IPE.CTAB_IPE)  * (IPE.QTDE_IPE - IPE.QPER_IPE))) * 100      / ((IPE.VLIQ_IPE - case when coalesce(PGF.DIPM_PGF,'N') = 'S' then (IPE.ICMS_IPE /IPE.QTDE_IPE) else 0 end) * (IPE.QTDE_IPE - IPE.QPER_IPE)        * case when ((coalesce(PGF.DSOF_PGF, '0') in ('1', '2')) and (PE.VCTO_PED <= IPE.VDOF_IPE)) then 1 - (IPE.DSOF_IPE / 100)      else 1         end)       else 0 end as MGR_LUCRO 
  from PEDIDO PE 
  /*bjoin*/ 
  inner join TRANSAC TR on (TR.CODI_TRA = PE.CODI_TRA) 
  inner join CLIENTE CL on (CL.CODI_TRA = PE.CODI_TRA) 
  inner join IPEDIDO IPE on (IPE.CODI_EMP = PE.CODI_EMP) 
                       and (IPE.PEDI_PED = PE.PEDI_PED) 
                       and (IPE.SERI_PED = PE.SERI_PED) 
  inner join PRODSERV PD on (PD.CODI_PSV = IPE.CODI_PSV) 
  inner join PRODUTO PR on (PR.CODI_PSV = IPE.CODI_PSV)  
  left join EMBALA EM on (EM.CODI_EMB = PR.CODI_EMB) 
  left join TABELA TBL on (IPE.TABE_CTA = TBL.TABE_CTA and IPE.CODI_PSV = TBL.CODI_PSV) 
  left join MUNICIPIO MUN on (MUN.CODI_MUN = TR.CODI_MUN) 
  left join TRANSAC TRVD on (TRVD.CODI_TRA = PE.CFOR_TRA) 
   
  left join CONDICAO CO on (CO.COND_CON = PE.COND_CON)   
  left join FORNEC FO on (FO.CODI_TRA = PE.CFOR_TRA)   
  left join FORNEC FA on (PR.CODI_TRA = FA.CODI_TRA)     
  left join PROPRIED PRO on (PRO.PROP_PRO = PE.PROP_PRO and PRO.CODI_TRA = PE.CODI_TRA) 
  left outer join INDEXADOR I on (I.CODI_IND = PE.CODI_IND)   
  left outer join CADUSU CDU on (CDU.CODI_USU = PE.CODI_USU) 
  left join ENDERENTR ET on (ET.CODI_END = PE.CODI_END) 
  left join REGIAO REG on (CL.CODI_REG = REG.CODI_REG) 
  left join ROTA ROT on (CL.CODI_ROT = ROT.CODI_ROT) 
  left join REGIAO REG2 on (PRO.CODI_REG = REG2.CODI_REG) 
  left join ROTA ROT2 on (PRO.CODI_ROT = ROT2.CODI_ROT)   
  left join NEGOCIACAO NEG on (NEG.CTRL_NEG = PE.CTRL_NEG and  
                               NEG.CODI_PES = PE.COD1_PES and  
                               NEG.CODI_EMP = PE.CODI_EMP) 
  left join PARAMGERFATU PGF on (PE.CODI_EMP = PGF.CODI_EMP) 
/*ejoin*/ 
where 
    (PE.DEMI_PED between to_date('11/01/2018','MM/DD/YYYY') and to_date('11/05/2019','MM/DD/YYYY')) 
and (PE.VCTO_PED between to_date('01/01/1900','MM/DD/YYYY') and to_date('12/31/2099','MM/DD/YYYY')) 
and (PE.CODI_EMP in ('3','10','1','51','52','65','21','2','4','12','5','31','30','11','6','7','8','9')) 
and (IPE.LRET_IPE in ('3','10','1','51','52','65','21','2','4','12','5','31','30','11','6','7','8','9') or IPE.LRET_IPE is null)   
and (PE.CODI_CIC in ('11000029')) 
and (PE.SITU_PED <> '9')  
and (PE.TFAT_PED = '1') 

and ((COALESCE(IPE.QTDE_IPE, 0) - (select 
                                        QENT 
                                   from  table( QTDE_ENTR_PED_VEN(IPE.CODI_EMP
                                                                 ,IPE.PEDI_PED
                                                                 ,IPE.SERI_PED
                                                                 ,IPE.CODI_PSV))) 
                                - (case when (select 
                                                    count(*) 
                                              from OCORRENCIAS O 
                                              where O.CODI_EMP = PE.CODI_EMP 
                                                and O.PEDI_PED = PE.PEDI_PED 
                                                and O.SERI_PED = PE.SERI_PED 
                                                and O.CODI_PSV = IPE.CODI_PSV) > 0 
                                        then coalesce((  select 
                                                            O.QTDE_OCO 
                                                         from(select * from  OCORRENCIAS O order by O.DATA_OCO desc ) O 
                                                         where O.CODI_EMP = PE.CODI_EMP and O.PEDI_PED = PE.PEDI_PED and O.SERI_PED = PE.SERI_PED and O.CODI_PSV = IPE.CODI_PSV and rownum <= 1 ), 0)         
                                        else coalesce(IPE.QPER_IPE,0) 
                                        end)) > 0.01)
and PE.PEDI_PED='19530113'
order by TR.RAZA_TRA, PE.CODI_TRA, PE.CODI_EMP,  PE.DEMI_PED, PE.PEDI_PED, PE.SERI_PED
;