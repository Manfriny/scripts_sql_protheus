select * from (
SELECT f.nomfun, f.numcpf, f.datadm, f.datafa, f.sitafa,f.* FROM SENIORPRD.R034FUN f ORDER BY f.nomfun, f.numcpf
) where nomfun like '%LUCIANO%TEIX%';


SELECT f.nomfun, f.numcpf, f.datadm, f.datafa, f.sitafa,f.* FROM SENIORPRD.R034FUN f where nomfun like '%MANFRINY%';