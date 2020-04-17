select distinct d1_filial,d1_cc,d1_fornece,d1_loja, (select a2_nome from sa2010 where a2_cod=d1_fornece and a2_loja=d1_loja and d_e_l_e_t_=' ') nome,
d1_cod,D1_XDESCRI,d1_total from sd1010 where D1_CC BETWEEN '104' AND '10404999' and d1_emissao>='20170101' and D_E_L_E_T_=' ' 
AND D1_XDESCRI like '%SERVICO%' order by nome;


--NF'S Sênior
select d1_filial,d1_cc,d1_fornece,d1_loja,d1_cod,D1_XDESCRI,d1_total
from sd1010 
where d1_fornece='80680093' and d1_emissao>='20170101' and D_E_L_E_T_=' ' AND D1_XDESCRI like '%SERVICO%' 
order by d1_total,d1_emissao;






