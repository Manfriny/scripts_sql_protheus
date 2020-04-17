SELECT
    p.codi_emp    AS filial,
    p.demi_ped    AS data_ped,
    p.pedi_ped    AS pedido,
    p.seri_ped    AS serie_ped,
    i.codi_psv    AS produto,
    pd.desc_psv   AS descri,
    i.tabe_cta    AS tabela,
    c.desc_cta    AS descri_tab
FROM
    pedido     p
    INNER JOIN ipedido    i ON i.pedi_ped = p.pedi_ped
                            AND i.seri_ped = p.seri_ped
                            AND i.codi_emp = p.codi_emp
    INNER JOIN prodserv   pd ON i.codi_psv = pd.codi_psv
    INNER JOIN cabtab     c ON c.tabe_cta = i.tabe_cta
WHERE
    p.demi_ped BETWEEN :data_inicial AND :data_final
    AND p.codi_emp = :loja
    AND p.codi_cic = :ciclo
ORDER BY
    data_ped,
    pedido,
    descri;
    
/* ... 