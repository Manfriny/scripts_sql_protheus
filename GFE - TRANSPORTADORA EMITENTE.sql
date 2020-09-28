-- CADASTRO DE EMITENTE
SELECT
    GU3_FILIAL                             as filial,
    trim(GU3_CDEMIT)                       as cod_emitente,    
    trim(GU3_NMEMIT)                       as nome_emit,
    GU3_CDERP                       ,
    gu3.gu3_idfed,
    gu3.gu3_cdterp,
    gu3.gu3_cdcerp,
    trim(GU3_IE)                           as insc_estadual,
    decode(GU3_NATUR,'J','JUR','FIS')      as natureza,
    decode(gu3.gu3_origem,'1','GFE','ERP') as origem,
    decode(gu3.gu3_sit,'1','SIM','NAO')    as ativo,
    decode(gu3.gu3_emfil,'1','SIM','NAO')  as eh_filial,
    decode(gu3.gu3_transp,'1','SIM','NAO') as transportadora,
    decode(gu3.gu3_clien,'1','SIM','NAO')  as cliente,
    decode(gu3.gu3_forn,'1','SIM','NAO')   as fornecedor,
    decode(gu3.gu3_auton,'1','SIM','NAO')  as autonomo
FROM
    gu3010 gu3
WHERE
    gu3.d_e_l_e_t_=' ' and
    --gu3.gu3_nmemit LIKE '%ELTON%SANDRI%';
    gu3.gu3_idfed='28439074000148' 
    --and gu3.gu3_cdcerp='03'
    order by gu3_cdcerp;
    
update gu3010 set GU3_CDTERP='008603',gu3_transp='1' where gu3_cdemit='002507884';

--================================================================    
-- CADASTRO DE TRANSPORTADORA   
SELECT
    a4.a4_filial    as filial,
    a4.a4_cod       AS codigo,
    a4.a4_nome      AS nome,
    a4.a4_cgc       AS cnpj_cpf,
    a4.a4_insest    AS insc_estadual,
    a4.a4_nreduz    AS nome_reduz,
    a4.a4_end       AS endereco,
    a4.a4_bairro    AS bairro,
    a4.a4_cep       AS cep,
    a4.a4_mun       AS municipio,
    a4.a4_cod_mun   AS cod_municipio,
    a4.a4_est       AS estado,
    a4.a4_tptrans   AS tipo_transportadora,
    DECODE(a4.a4_msblql, '2', 'NAO', 'SIM') AS bloqueado
FROM
    sa4010 a4
WHERE
    a4.a4_nome LIKE '%INSTITUTO%GOIANO%';
    
select a4_insest,a.* from sa4010 a where a4_cod='007654';
update sa4010 set a4_insest='ISENTO' where a4_cod='007654';
    
--================================================================    
-- CADASTRO DE FORNECEDOR
SELECT
    a2_filial as filial,
    A2_PAGGFE,
    a2_cod as codigo,
    a2.a2_nome as nome,
    a2_loja as loja,
    a2_tipo,
    a2_est as estado,
    a2.a2_cgc as cnpj_cpf,
    a2.a2_inscr as insc_estadual
FROM
    sa2010 a2
WHERE
    a2.a2_nome LIKE '%INSTITUTO%GOIANO%';
    
select a1_CGC,a.* from sa1010 a where a1_nome like '%ELTON%SANDRI%';
select a2_cgc,a2_msblql,a2.a2_inscr,a2.* from sa2010 a2 where a2_cgc='26103060087';

select * from sc5010 where c5_num='199236';


select a2_paggfe from sa2010 where a2_paggfe <> ' ';