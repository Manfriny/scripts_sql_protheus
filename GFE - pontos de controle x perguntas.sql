--busca pontos de controle x perguntas
select gvh_cdptct codigo_ponto,
(select gvf_dsptct from gvf010 gvf where gvf.gvf_cdptct=gvh_cdptct and gvf.D_E_L_E_T_=' ')descricao_ponto,
gvh_cdperg codigo_pergunta,
(select gvg_dsperg from gvg010 gvg where gvg.gvg_cdperg=gvh_cdperg and gvg.D_E_L_E_T_=' ')descricao_pergunta,
case gvh_idimpe 
when '1' then 'Sim'
when '2' then 'Não'
End Impeditiva 
from gvh010 
where D_E_L_E_T_=' '
order by gvh_cdptct;

