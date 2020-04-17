-- PROGRAMAÇÂO DE ENTREGA - Agendamento ExpedSG
--dados identicos na NJ5+SC9 -> pedido+item+seq

SELECT
    *
FROM
    nj5010 nj5
    LEFT JOIN sc9010 sc9 ON nj5.nj5_numpv = sc9.c9_pedido
                            AND nj5.nj5_item = sc9.c9_item
                            AND nj5.nj5_sequen = sc9.c9_sequen
                            AND sc9.d_e_l_e_t_ = nj5.d_e_l_e_t_
WHERE
    nj5.nj5_numpv = '162882'
    and nj5.D_E_L_E_T_=' ';
    

-- DIVERGÊNCIA
SELECT
    *
FROM
    nj5010 nj5
    LEFT JOIN sc9010 sc9 ON nj5.nj5_numpv = sc9.c9_pedido
                            AND nj5.nj5_item = sc9.c9_item
                            AND nj5.nj5_sequen = sc9.c9_sequen
                            AND sc9.d_e_l_e_t_ <> nj5.d_e_l_e_t_
WHERE
    nj5.nj5_numpv = '162882'
    and nj5.D_E_L_E_T_=' ';
    
    
update NJ5010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NJ5_NUMPV = '162882' and D_E_L_E_T_=' ';