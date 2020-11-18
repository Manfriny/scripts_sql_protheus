SELECT
    totvslg_user(zs5_usergi) AS usu_inclusao,
    totvslg_data(zs5_usergi) AS dat_inclusao,
    z5.zs5_filial   AS filail,
    TO_DATE(z5.zs5_data, 'YYYYMMDD') AS dat_sistema,
    z5.zs5_hora     AS hora,
    z5.zs5_cod      AS produto,
    z5.zs5_lote     AS lote,
    z5.zs5_seq,
    z5.zs5_leitur,
    z5.zs5_recnp9   AS r_e_c_np9,
    DECODE(z5.d_e_l_e_t_, '*', 'SIM', ' ') AS excluido
FROM
    zs5010 z5
WHERE
    --z5.zs5_lote = 'BA208644P160647'
    --AND z5.zs5_cod = '010400284'
    --AND 
    z5.zs5_data = '20201104'
ORDER BY
    z5.zs5_hora,
    z5.zs5_lote