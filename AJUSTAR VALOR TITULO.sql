select * from SF1010 where F1_FILIAL='0401' and (F1_DOC='000116329' and D_E_L_E_T_='*' or F1_DOC='000116301' and D_E_L_E_T_=' ');
select * from SD1010 where D1_FILIAL='0401' and (D1_DOC='000116329' and D_E_L_E_T_='*' or D1_DOC='000116301' and D_E_L_E_T_=' ') order by D1_DOC;


select B1_LOCALIZ from SB1010 where B1_COD in ('012500173','012500179') and D_E_L_E_T_=' ';
update SB1010 set B1_LOCALIZ='N' where B1_COD in ('012500173','012500179') and D_E_L_E_T_=' ';

select e1.E1_VALOR,e1.E1_VLCRUZ,e1.E1_VALLIQ,e1.E1_SALDO,e1.E1_BAIXA,e1.* from SE1010 e1 where E1_FILIAL='0301' and E1_PREFIXO='PRI' and E1_NUM='027';
update SE1010 set e1_vlcruz=e1_valor, e1_valliq=0, e1_saldo=e1_valor,e1_baixa=' ',e1_movimen=' ' where E1_FILIAL='0301' and E1_PREFIXO='PRI' and E1_NUM='027';

select e1.E1_VALOR,e1.E1_VLCRUZ,e1.E1_VALLIQ,e1.E1_SALDO,e1.E1_BAIXA,e1.* from SE1010 e1 where E1_FILIAL='0301' and E1_PREFIXO='JUR' and E1_NUM='027';
update SE1010 set e1_vlcruz=e1_valor, e1_valliq=0, e1_saldo=e1_valor,e1_baixa=' ',e1_movimen=' ' where E1_FILIAL='0301' and E1_PREFIXO='JUR' and E1_NUM='027';

select * from SE5010 where E5_FILIAL='0301' and E5_PREFIXO='PRI' and E5_NUMERO='027' and E5_VALOR=3982463.71;
update SE5010 set D_E_L_E_T_='*' where E5_FILIAL='0301' and E5_PREFIXO='PRI' and E5_NUMERO='027' and E5_VALOR=3982463.71; --valor liquidado parcialmente

select * from SE5010 where E5_FILIAL='0301' and E5_PREFIXO='JUR' and E5_NUMERO='027' and E5_VALOR=22627.47;
update SE5010 set D_E_L_E_T_='*' where E5_FILIAL='0301' and E5_PREFIXO='JUR' and E5_NUMERO='027' and E5_VALOR=22627.47; --valor liquidado parcialmente


select e1.E1_VALOR,e1.E1_VLCRUZ,e1.E1_VALLIQ,e1.E1_SALDO,e1.E1_BAIXA,e1.* from SE1010 e1 where e1.E1_VALOR = e1.E1_VLCRUZ and e1.E1_VALOR=e1.E1_SALDO;