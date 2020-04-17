--11.429.434-8      
define Cod = '493578591';
define Loj = '06';

--select * from(
SELECT
    'SA1'     AS tabela,
    'Cliente' AS cadastro,
    a1_filial AS filial,
    a1_cod    AS codigo,
    a1_loja   AS loja,
    a1_inscr  AS inscricao,
    a1_cgc    AS cfp,
    decode(A1_MSBLQL,1,'SIM','NAO') as Bloqueio
FROM
    sa1010
WHERE
    a1_cod = '&Cod'
    AND a1_loja = '&Loj'
UNION ALL
SELECT
    'SA2'        AS tabela,
    'Fornecedor' AS cadastro,
    a2_filial    AS filial,
    a2_cod       AS codigo,
    a2_loja      AS loja,
    a2_inscr     AS inscricao,
    a2_cgc       AS cpf,
    decode(A2_MSBLQL,1,'SIM','NAO') as Bloqueio
FROM
    sa2010
WHERE
    a2_cod = '&Cod'
    AND a2_loja = '&Loj'
UNION ALL
SELECT
    'NJ0'      AS tabela,
    'Entidade' AS cadastro,
    nj0_filial AS filial,
    nj0_codent AS codigo,
    nj0_lojent AS loja,
    nj0_inscr  AS inscricao,
    nj0_cgc    AS cpf,
    decode(NJ0_ATIVO,2,'SIM','NAO') as Bloqueio
FROM
    nj0010
WHERE
    nj0_codent = '&Cod'
    AND nj0_lojent = '&Loj'
--) order by loja
;

update SA1010 set A1_INSCR='ISENTO' where a1_cod='&Cod' and A1_LOJA='&Loj';
update Sa2010 set a2_INSCR='ISENTO',A2_XINSCR='ISENTO' where a2_cod='&Cod' and a2_LOJA='&Loj';
update NJ0010 set NJ0_INSCR='ISENTO' where NJ0_CODENT='&Cod' and NJ0_LOJENT='&Loj';

select * from SA1010 where a1_cod='&Cod' and A1_LOJA='&Loj';
select * from Sa2010 where a2_cod='&Cod' and a2_LOJA='&Loj';
select * from NJ0010 where NJ0_CODENT='&Cod' and NJ0_LOJENT='&Loj';
