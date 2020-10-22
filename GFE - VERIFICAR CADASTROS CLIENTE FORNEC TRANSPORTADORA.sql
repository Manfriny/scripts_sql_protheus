--PESQUISAR O CODIGO DO CLIENTE PELO NUMERO DO PEDIDO
select c5.c5_cliente,c5.c5_lojaent,c5.* from sc5010 c5 where c5.c5_filial='0301' and c5.c5_num='207432';

--VERIFICAR CADASTROS DE CLIENTE/FORNECEDO
select decode(a1.a1_msblql,'1','SIM','NAO') as bloqueado,a1.a1_cgc,a1.a1_inscr,a1.* from sa1010 a1 where a1.a1_cod='21079708';
select decode(a2.a2_msblql,'1','SIM','NAO') as bloqueado,a2.a2_cgc,a2.a2_inscr,a2.* from sa2010 a2 where a2.a2_cod='21079708';

--CADASTRO DA TRANSPORTADORA ASSOCIADA NA CARGA
select a4.a4_msblql,a4.a4_cgc,a4.a4_insest,a4.* from sa4010 a4 where 
a4.a4_cgc='21079708000230'; --pesqueisar pelo CPG/CNPJ completo
--a4_cod='008655';

--21079708000230	352/0004820       

--CADASTRO DE EMITENTE
select decode(gu3.d_e_l_e_t_,'*','SIM','NAO') as deletado,gu3.r_e_c_n_o_, gu3.gu3_idfed as CPF_CNPJ,gu3.gu3_ie as Inscr_Est, gu3.gu3_cderp as cod_A1_A2,
gu3.gu3_cdcerp as loja_cad,gu3.gu3_cdterp as cod_transp,decode(GU3_ORIGEM,'1','GFE','ERP') as Origem,decode(GU3_SIT,'1','SIM','NAO') as ativo,
decode(GU3_EMFIL,'1','SIM','NAO') as eh_filial,decode(GU3_TRANSP,'1','SIM','NAO') as Transp,decode(GU3_CLIEN,'1','SIM','NAO') as cliente,
decode(GU3_FORN,'1','SIM','NAO') as fornece,decode(GU3_AUTON,'1','SIM','NAO') as autonomo, gu3.gu3_cdemit as cod_emitente,trim(gu3.gu3_nmemit) as nome_emitente
from gu3010 gu3 where gu3.gu3_idfed='21079708000230' and gu3.d_e_l_e_t_=' ' order by gu3.gu3_cdcerp;

--update gu3010 gu3 set gu3.d_e_l_e_t_='*',gu3.r_e_c_d_e_l_=gu3.r_e_c_n_o_ where gu3.r_e_c_n_o_ in (14753,14754);

--CADASTRO DE EMITENTE SEM FIRULA
select gu3.d_e_l_e_t_, gu3.r_e_c_n_o_, gu3.gu3_idfed, gu3.gu3_ie, gu3.gu3_cderp, gu3.gu3_cdcerp, gu3.gu3_cdterp,
GU3_ORIGEM, GU3_SIT, GU3_EMFIL, GU3_TRANSP, GU3_CLIEN, GU3_FORN, GU3_AUTON,
gu3.gu3_cdemit, trim(gu3.gu3_nmemit) as gu3_nmemit
from gu3010 gu3 where gu3.gu3_idfed='21079708000230' and gu3.d_e_l_e_t_=' ' order by gu3.gu3_cdcerp;



