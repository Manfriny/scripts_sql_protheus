select a.C5_NATUREZ,a.* from sc5010 a where c5_num in ('025170','025169','025168');
select a.C6_TES,a.* from sc6010 a where c6_num in ('025170','025169','025168');

select D2_DOC,D2_PEDIDO,a.* from sd2010 a where d2_filial='0401' and d2_doc='000620';



--167926 --069501
select * from sc9010 where c9_pedido='167926';
update sc9010 set C9_BLCRED=' ' where c9_pedido='167926';

SELECT * from sb2010 where b2_filial='0301' and B2_COD='012500145';
update sb2010 set b2_qatu=0 where b2_filial='0301' and B2_COD='012500145';

--=====================================================================================================

select a.C5_NATUREZ,a.* from sc5010 a where c5_num in ('025521');
select a.C6_TES,a.* from sc6010 a where c6_num in ('025521');

select * from sc9010 where c9_pedido='025521';

select * from sf2010 where f2_filial='0401' and f2_doc='070489';
select D2_DOC,D2_PEDIDO,d2_SERIE,a.* from sd2010 a where d2_filial='0401' and d2_doc in ('070489');

select * from SF3010 a where f3_filial='0401' and f3_nfiscal='070489';
select ft_item,a.* from sft010 a where ft_filial='0401' and ft_nfiscal='070489';





