select b.* from SB1010 b where B1_DESC like'%TEC%' order by b1_desc;
select b.B1_CONTA,b.* from SB1010 b where B1_cod='100200006' order by b1_desc;
-- Solicitação de COMPRAS - Lançamentos de NF
--select * from (
SELECT * FROM SC1010 sc1 WHERE C1_SOLICIT LIKE '%joao.neto%' ORDER BY R_E_C_N_O_ desc
;
--)where c1_obs like '%%DESPE%';
select * from SC1010 where c1_num='015177';
select * from SB1010 where B1_COD='100100103';
select * from sb1010 where B1_DESC like '%7.02%';

-- Requisição de Materiais - Almoxarifado
--select * from (
SELECT scp.CP_FILIAL,scp.CP_EMISSAO,scp.CP_NUM,scp.CP_ITEM,scp.CP_PRODUTO,scp.CP_DESCRI,scp.CP_UM,scp.CP_QUANT,scp.CP_QTSEGUM,scp.CP_SEGUM,scp.CP_LOCAL,scp.CP_CC,scp.CP_CONTA,scp.CP_OBS,scp.* 
FROM SCP010 scp WHERE CP_SOLICIT LIKE '%layne.batista%' ORDER BY R_E_C_N_O_ desc
;
--)where cp_obs like '%%PONTO%';


--PEDIDOS
select sc7.C7_FILIAL,to_date(sc7.C7_EMISSAO,'YYYYMMDD') as C7_EMISSAO,sc7.C7_NUM,sc7.C7_PRODUTO,
NVL((select sb1010.B1_DESC from sb1010 where b1_cod = sc7.c7_produto),' ') b1_desc,
sc7.C7_UM,sc7.C7_QUANT,sc7.C7_PRECO,sc7.C7_TOTAL,sc7.C7_FORNECE,sc7.C7_LOCAL,trim(sc7.C7_OBS) obs,sc7.C7_CC,sc7.C7_CONTA from SC7010 sc7 
where 
C7_FORNECE='80680093'
and c7_emissao > '20190101'
--and sc7.C7_PRECO=2642.56
--and sc7.C7_OBS like '%741301%'
order by sc7.C7_EMISSAO desc;

select CTT_BLOQ,a.* from CTT010 a where ctt_filial='03' and ctt_custo='10920999';
select * from CT1010 where ct1_conta='51110102054';
select * from cta010 where cta_custo='10402999' and d_e_l_e_t_=' ';


--Fornecedores
select * from SA2010 where A2_COD='18712750';
select * from SA2010 where A2_NOME like '%SENIOR%' order by A2_NOME;

select * from SB1010 where B1_DESC like '%JIRA%' order by B1_DESC;
select * from SB1010 where B1_COD in ('100100017','100100079','991400005','991400006','991400008') order by B1_DESC;