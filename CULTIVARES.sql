select codigo from (
select 
    length(trim(NP4_CODIGO)) as Tam,
    np4.NP4_FILIAL as Filial,
    np4.NP4_CODIGO as Codigo,
    trim(np4.NP4_DESCRI) as Descri,
    np4.NP4_CULTRA as Cultura,
    case when np4.NP4_MSBLQL=2 then 'NAO' else 'SIM' end as Bloqueado
from NP4010 np4 
where length(trim(NP4_CODIGO))<>10 and D_E_L_E_T_=' ' order by NP4_CODIGO desc);

update NP4010 set NP4_MSBLQL=1 where length(trim(NP4_CODIGO))<>10 and D_E_L_E_T_=' ';


select * from SB1010 where B1_COD='010300027';

select 
    B5_FILIAL as filial,
    B5_COD as codigo,
    trim(B5_CEME) as descr,
    B5_CTVAR as cultivar,
    trim(B5_MARCA) as marca,
    B5_PENE as pene
from SB5010 where B5_CTVAR in (
select codigo from (
select 
    length(trim(NP4_CODIGO)) as Tam,
    np4.NP4_FILIAL as Filial,
    np4.NP4_CODIGO as Codigo,
    trim(np4.NP4_DESCRI) as Descri,
    np4.NP4_CULTRA as Cultura,
    case when np4.NP4_MSBLQL=2 then 'NAO' else 'SIM' end as Bloqueado
from NP4010 np4 
where length(trim(NP4_CODIGO))<>10 and D_E_L_E_T_=' ' order by NP4_CODIGO desc)
);