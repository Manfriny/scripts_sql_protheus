SELECT
    b6_filial,
    b6_doc,
    b6_serie,
    b6_clifor,
    b6_tpcf,
    b6_produto,
    b6_quant,
    b6_prunit,
    b6_emissao,
    b6_tipo,
    b6_tes,
    b6_poder3
FROM
    sb6010 sb6
WHERE
    b6_filial = '0401'
    AND b6_doc >= '         '
    AND b6_doc <= 'ZZZZZZ   '
    AND b6_serie >= '   '
    AND b6_serie <= 'ZZZ'
    AND b6_emissao >= '20180217'
    AND b6_emissao <= '20180217'
    AND b6_produto >= '               '
    AND b6_produto <= 'ZZZZZZZZZZZZZZZ'
    AND b6_clifor >= '         '
    AND b6_clifor <= 'ZZZZZZ   '
    AND sb6.d_e_l_e_t_ = ' '
    AND b6_tpcf IN (
        'C',
        'F'
    )
ORDER BY
    b6_filial,
    b6_doc,
    b6_serie,
    b6_tipo,
    b6_clifor,
    b6_tpcf