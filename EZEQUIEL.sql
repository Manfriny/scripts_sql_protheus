select * from SC7010 where C7_FORNECE='00219708';

select * from SC5010 where C5_NUM='160705';
select C6_NUMOP,C6_ITEMOP from SC6010 where C6_NUM in ('160445','160624','160705','160878');
update SC6010 set C6_NUMOP=' ',C6_ITEMOP=' ' where C6_NUM in ('160445','160624','160705','160878');

select * from SC2010 where C2_PEDIDO in ('160445','160624','160705','160878') and D_E_L_E_T_=' ';
select * from SGJ010 where GJ_NUMPV in ('160445','160624','160705','160878') and D_E_L_E_T_=' ';
update SGJ010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where GJ_NUMPV in ('160445','160624','160705','160878');