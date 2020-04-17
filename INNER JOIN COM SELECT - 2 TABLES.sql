select a.b1_localiz,a.* from sb1010 a where b1_cod='980800055';
select * from sb2010 where b2_cod='980800055';
select * from sbf010 where bf_produto='980800055';
select * from sb8010 where b8_produto='980800055';

select d1_cod,sum(d1_quant) d1_quant from sd1010 where d1_filial='0301' and d1_doc='000497244' group by d1_cod order by d1_cod;

select totvslg_user(x.c5_userlgi),c5_emissao,x.* from sc5010 x where c5_num='172246';
select * from sc6010 where c6_num='172246';
SELECT
    sb2.b2_cod as codigo,
    sb2.b2_qatu as Saldo_Estoque,
    sd1.d1_quant as qtd_NF,    
    sb2.b2_qatu - sd1.d1_quant as saldo_final
FROM
    sb2010 sb2
    INNER JOIN (
        SELECT
            d1_cod,
            SUM(d1_quant) d1_quant
        FROM
            sd1010
        WHERE
            d1_filial = '0301'
            AND d1_doc = '000497244'
            AND d_e_l_e_t_ = ' '
        GROUP BY
            d1_cod
        ORDER BY
            d1_cod
    ) sd1 ON sd1.d1_cod = sb2.b2_cod
WHERE
    sb2.b2_filial = '0301'
    AND sb2.b2_local = '51'
    AND sb2.d_e_l_e_t_ = ' '
    AND sb2.b2_cod IN (
        '980300022',
        '980300156',
        '980300207',
        '980300228',
        '980300653',
        '980600033',
        '980800055',
        '980800055',
        '980800116',
        '980800117',
        '980800474'
    )
ORDER BY
    sb2.b2_cod;