SELECT
    sc5.c5_filial,
    sc5.c5_num,
    sc5.c5_cliente,
    sc5.c5_lojacli,
    sc5.c5_lojaent,
    sc5.c5_condpag,
    sc5.c5_transp,
    sc5.c5_tpfrete,
    sc5.c5_inciss,
    sc5.c5_reciss,
    sc6.c6_entreg,
    sc6.c6_sugentr,
    sc5.c5_naturez,
    sc6.c6_produto,
    sc6.c6_descri,
    sc5.c5_volume1,
    sc5.c5_volume2,
    sc5.c5_volume3,
    sc5.c5_volume4,
    sc5.c5_vend1,
    sc5.c5_vend2,
    sc5.c5_vend3,
    sc5.c5_vend4,
    sc5.c5_vend5,
    sb1.b1_retoper,
    sc9.c9_retoper,
    sc5.c5_moeda,
    sc9.c9_blcred,
    sc9.c9_blest,
    sc9.c9_bloquei
    
FROM
    sc5010   sc5
    INNER JOIN sc6010   sc6 ON sc5.c5_num = sc6.c6_num
                             AND sc6.d_e_l_e_t_ = sc5.d_e_l_e_t_
    INNER JOIN sb1010   sb1 ON sb1.b1_cod = sc6.c6_produto
                             AND sc6.d_e_l_e_t_ = sb1.d_e_l_e_t_
    INNER JOIN sc9010   sc9 ON sc9.c9_pedido = sc6.c6_num
                             AND sc9.c9_item = sc6.c6_item
                             AND sc9.d_e_l_e_t_ = sc6.d_e_l_e_t_
WHERE
    sc5.c5_num IN (
        '028950',
        '028951',
        '028952',
        '028953',
        '028954'
    )
    AND sc5.d_e_l_e_t_ = ' ';
    
    
    /*
NFPS 000661
PEDI 
'028759'
'028760'
'028761'

        '028950',
        '028951',
        '028952',
        '028953',
        '028954'
*/

select * from sed010 where ed_codigo in (
'110303',    
'110302' ,  
'110301'  ,
'110309' ,
'110301'
) and d_e_l_e_t_=' ';

