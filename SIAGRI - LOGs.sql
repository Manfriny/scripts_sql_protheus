SELECT
    'LOG'        as tabela,
    COUNT(1)     as registros
FROM
    log
UNION ALL
SELECT
    'iLOG'       as tabela,
    COUNT(1)     as registros
FROM
    ilog
UNION ALL
SELECT
    'LOGSESSION' as tabela,
    COUNT(1)     as registros
FROM
    logsession;