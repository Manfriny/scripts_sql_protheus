/*select * from sc9010 sc9
left join nj5010 nj5 
on c9_filial=nj5_filial and c9_pedido=nj5_numpv and c9_item=nj5_item and c9_produto=nj5_produt and C9_SEQUEN=NJ5_SEQUEN
where sc9.c9_filial='0301' 
and sc9.C9_NFISCAL<>' '  
and sc9.D_E_L_E_T_=' ';
desc nj5010;

select c9_filial,c9_pedido,c9_item,c9_produto,c9_qtdlib,
(select nj5_qtde from  nj5010 where  c9_filial=nj5_filial and c9_pedido=nj5_numpv and c9_item=nj5_item and C9_SEQUEN=NJ5_SEQUEN and c9_produto=nj5_produt)qtdnj5
from sc9010 sc9
where sc9.c9_filial='0301' 
and sc9.C9_NFISCAL<>' '  
and sc9.D_E_L_E_T_=' ';*/


select * from sc9010
where c9_filial='0301' 
and C9_NFISCAL<>' '  
and D_E_L_E_T_=' '
and C9_DATent>='20170801'
and C9_PRODUTO in (select b5_cod from sb5010 where b5_semente='1' and D_E_L_E_T_=' ')
and c9_filial||c9_pedido||c9_item||c9_sequen||c9_produto not in 
(select nj5_filial||nj5_numpv||nj5_item||nj5_sequen||nj5_produt from  nj5010 where nj5_codsaf='2017')
and c9_carga<>' ';

select * from sc9010 where c9_filial='0301' and c9_pedido='014390';
select * from nj5010 where nj5_filial='0301' and nj5_numpv='014390';




