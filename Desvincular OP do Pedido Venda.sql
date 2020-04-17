--Desvincular OP do Pedido de Venda
--162599, 163053,163055.162238
define Filial='0301';
define NumPedido = '161255';

select * from SC5010 where C5_FILIAL='&Filial' and C5_NUM='&NumPedido' and D_E_L_E_T_=' ';
select C6_OP,C6_TPOP,C6_ITEMOP,C6_NUMOP,D_E_L_E_T_,C6_FILIAL,C6_PRODUTO,C6_DESCRI,C6_QTDVEN,C6_UM from SC6010 where C6_FILIAL='&Filial' and C6_NUM='&NumPedido' and D_E_L_E_T_=' ';
select * from SC2010 where C2_FILIAL='&Filial' and C2_PEDIDO='&NumPedido';
select * from SGJ010 where GJ_FILIAL='&Filial' and GJ_NUMPV='&NumPedido';

update SC6010 set C6_ITEMOP=' ',C6_TPOP=' ',C6_NUMOP=' ', C6_OP=' ' where C6_FILIAL='&Filial' and C6_NUM='&NumPedido' and D_E_L_E_T_=' ';
update SGJ010 set D_E_L_E_T_='*', R_E_C_D_E_L_=R_E_C_N_O_ where GJ_FILIAL='&Filial' and GJ_NUMPV='&NumPedido';

-- Foi ajustado, conforme solicitado... ---> TI: Script > Desvincular OP do Pedido de Venda.sql