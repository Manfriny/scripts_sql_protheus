select F1_FILIAL, F1_DOC, F1_SERIE, F1_FORNECE, F1_LOJA, F1_FORMUL, R_E_C_D_E_L_,a.* from sf1010 a where F1_FILIAL='0301' and F1_DOC='000029581' and F1_SERIE='3' and F1_FORNECE='36854495' and F1_LOJA='01' and F1_FORMUL=' ' and d_e_l_e_t_=' ';
select D1_FILIAL, D1_DOC, D1_SERIE, D1_FORNECE, D1_LOJA, D1_ITEM, D1_FORMUL, D1_ITEMGRD, R_E_C_D_E_L_,a.* from sD1010 a where D1_FILIAL='0301' and D1_DOC='000400' and D1_SERIE='3' and D1_FORNECE='36854495' and D1_LOJA='01' and D1_FORMUL=' ' and a.d_e_l_e_t_=' ';

select FT_FILIAL, FT_NFISCAL, FT_SERIE, FT_LOJA, FT_FORMUL, R_E_C_D_E_L_,a.* from sFT010 a where FT_FILIAL='0301' and FT_NFISCAL='000400' and FT_SERIE='3' and FT_LOJA='01' and FT_FORMUL=' ' and d_e_l_e_t_=' ';
select F3_FILIAL, F3_NFISCAL, F3_SERIE, F3_LOJA, F3_FORMUL, a.* from sF3010 a where F3_FILIAL='0301' and F3_NFISCAL='000400' and F3_SERIE='3' and F3_LOJA='01' and F3_FORMUL=' ' and a.d_e_l_e_t_=' ';

update sf1010 set d_e_l_e_t_='*',r_e_c_d_e_l_=R_E_C_N_O_ where F1_FILIAL='0301' and F1_DOC='000400' and F1_SERIE='3' and F1_FORNECE='36854495' and F1_LOJA='01' and F1_FORMUL=' ' and d_e_l_e_t_=' ';
update sD1010 set d_e_l_e_t_='*',r_e_c_d_e_l_=R_E_C_N_O_ where D1_FILIAL='0301' and D1_DOC='000400' and D1_SERIE='3' and D1_FORNECE='36854495' and D1_LOJA='01' and D1_FORMUL=' ' and d_e_l_e_t_=' ';

select * from sf1010 where f1_chvnfe='52190936854495000597550030000004001960555122';
select C7_QTDACLA,c7_quje,a.* from sc7010 a where c7_filial='0301' and c7_num='441276';
update sc7010 set C7_QTDACLA=0,c7_quje=0 where c7_filial='0301' and c7_num='441276';

select * from se1010 where e1_num='PV172051';
select * from FIE010 where fie_filial='0301' and FIE_PEDIDO='172051' and D_E_L_E_T_=' ';
update FIE010 set D_E_L_E_T_='*' where fie_filial='0301' and FIE_PEDIDO='172051';

select NJJ_DOCNUM,nj.* from njj010 nj where njj_codrom='0000027809';

/*

F1_FILIAL: 0301
F1_DOC: 000088236
F1_SERIE: 3
F1_FORNECE: 36854495
F1_LOJA: 01
F1_FORMUL: ' '
R_E_C_D_E_L_: 145733
*/

--                         D1_FILIAL,           D1_DOC,                D1_SERIE,        D1_ITEM                                                      D1_FORNECE,            D1_LOJA, D1_FORMUL, D1_ITEMGRD, R_E_C_D_E_L_
select * from SD1010 where D1_FILIAL='0301' and D1_DOC='088236   ' and D1_SERIE='3' and D1_ITEM='0001' and D1_SERIE = '3  ' and D_E_L_E_T_ = ' ' and D1_FORNECE = '36854495 '
/*
#1 [C] [0301]
#2 [C] [0001]
#3 [C] [050800037      ]
#4 [C] [L ]
#5 [N] [155.000000]
#6 [N] [111.867500]
#7 [N] [17339.460000]
#8 [N] [17.000000]
#9 [C] [11410101003         ]
#10 [C] [12401001         ]
#11 [C] [             ]
#12 [C] [441202]
#13 [C] [0001]
#14 [C] [01]
#15 [C] [51]
#16 [D] [20190909]
#17 [D] [20190926]
#18 [C] [0508]
#19 [C] [N]
#20 [C] [3  ]
#21 [C] [OI]
#22 [N] [2947.710000]
#23 [D] [20190926]
#24 [C] [0  ]
#25 [C] [2]
#26 [C] [      ]
#27 [C] [ ]
#28 [C] [BIOZYME IMP2  5LT             ]
#29 [C] [088236   ]
#30 [C] [36854495 ]
#31 [C] [2019  ]
#32 [C] [3  ]
#33 [N] [0.000000]
#34 [N] [201822.000000]
*/