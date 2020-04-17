SELECT
    *
FROM
    (
        SELECT DISTINCT
            c9_ok         ok,
            c9_filial     filped,
            c9_carga      codcarga,
            c9_seqcar     seqcar,
            c9_pedido     pedido,
            c9_item       item,
            c9_sequen     sequencia,
            c9_produto    produto,
            c6_um         um,
            c9_qtdlib     qtde,
            c6_local      local,
            c6_cultra     cultra,
            c6_ctvar      cultvar,
            c6_categ      categ,
            c6_pene       pene,
--            b1_desc       dsproduto,
            sc9.d_e_l_e_t_,
            sc9.r_e_c_n_o_,
            sc9.r_e_c_d_e_l_,
            ( c9_qtdlib - (
                SELECT
                    nvl((
                        SELECT
                            SUM(nj6s.nj6_qtde) nj6_qtds
                        FROM
                            nj6010 nj6s
                        WHERE
                            nj6s.nj6_filial = c9_filial
                            AND nj6s.nj6_numpv = c9_pedido
                            AND nj6s.nj6_item = c9_item
                            AND nj6s.nj6_sequen = c9_sequen
                            AND NJ6S.nj6_produt = c9_produto
                            AND nj6s.d_e_l_e_t_ <> '*'
                    ), 0)
                FROM
                    dual
            ) ) saldo,
            CASE
                WHEN c5_xmdven = '1'   THEN
                    'Venda Agr.'
                WHEN c5_xmdven = '2'   THEN
                    'Venda Dist.'
                WHEN c5_xmdven = '3'   THEN
                    'Venda Coop.'
                ELSE
                    '  '
            END AS xmod,
            substr(sa1.a1_nome, 1, 60) AS nomcli,
            sa1.a1_cod    AS codcli,
            sa1.a1_loja   AS lojcli
        FROM
            sc9010   sc9
            INNER JOIN sc6010   sc6 ON c9_filial = c6_filial
                                     AND c9_pedido = c6_num
                                     AND c9_item = c6_item
                                     AND c9_produto = c6_produto
            LEFT JOIN nj5010   nj5 ON c9_filial = nj5_filial
                                    AND c9_pedido = nj5_numpv
                                    AND c9_item = nj5_item
                                    AND c9_sequen = nj5_sequen
                                    AND c9_produto = nj5_produt  LEFT JOIN nj6010   nj6 ON c9_filial = nj6_filial
                                    AND  C9_PEDIDO = nj6_numpv
                                    AND c9_item = nj6_item
                                    AND c9_sequen = nj6_sequen
                                    AND c9_produto = nj6_produt
            LEFT JOIN sb1010   sb1 ON b1_filial = '    '
                                    AND c9_produto = b1_cod
                                    AND sb1.d_e_l_e_t_ = ' '
            INNER JOIN sc5010   sc5 ON sc5.d_e_l_e_t_ <> '*'
                                     AND c5_filial = c9_filial
                                     AND c5_num = c9_pedido
            INNER JOIN sa1010   sa1 ON sa1.d_e_l_e_t_ <> '*'
                                     AND sa1.a1_cod = sc5.c5_cliente
                                     AND sa1.a1_loja = sc5.c5_lojacli
        WHERE
            1 = 1
            AND sc9.c9_blcred = ' '
            AND nj5.nj5_status IN (
                '2',
                '3'
            )
            AND sc9.c9_qtdlib > (
                SELECT
                    nvl((
                        SELECT
                            SUM(nj6s.nj6_qtde) nj6_qtds
                        FROM
                            nj6010 nj6s
                        WHERE
                            nj6s.nj6_filial = c9_filial
                            AND nj6s.nj6_numpv = c9_pedido
                            AND nj6s.nj6_item = c9_item
                            AND nj6s.nj6_sequen = c9_sequen
                            AND nj6s.nj6_produt = c9_produto
                            AND nj6s.d_e_l_e_t_ <> '*'
                    ), 0)
                FROM
                    dual
            )
            AND sc9.d_e_l_e_t_ <> '*'
            AND ( ( sc6.d_e_l_e_t_ = ' '
                    AND sc9.d_e_l_e_t_ = ' '
                    AND nj5.d_e_l_e_t_ = ' ' )
                  OR ( sc6.d_e_l_e_t_ = ' '
                       AND sc9.d_e_l_e_t_ = ' '
                       AND nj5.d_e_l_e_t_ IS NULL )
                  OR ( sc6.d_e_l_e_t_ IS NULL
                       AND sc9.d_e_l_e_t_ IS NULL
                       AND nj5.d_e_l_e_t_ IS NULL )
                  OR ( sc6.d_e_l_e_t_ = ' '
                       AND sc9.d_e_l_e_t_ = ' '
                       AND nj5.d_e_l_e_t_ = '*' )
                  OR ( sc6.d_e_l_e_t_ = ' '
                       AND sc9.d_e_l_e_t_ = '*'
                       AND nj5.d_e_l_e_t_ = '*' )
                  OR ( sc6.d_e_l_e_t_ = ' '
                       AND sc9.d_e_l_e_t_ = '*'
                       AND nj5.d_e_l_e_t_ IS NULL ) )
            AND c9_carga = '009733'
            AND c9_seqcar = '01'
    ) x1
WHERE
    x1.codcarga = '009733'
    AND x1.seqcar = '01';