select * from (
SELECT
    sb6.b6_doc as DOC,
    sb6.*,
    sb6.r_e_c_n_o_ AS recno,
    sf4.f4_poder3
FROM
    sb6010 sb6
    JOIN sf4010 sf4 ON sf4.f4_filial = '0401'
                       AND sf4.f4_codigo = sb6.b6_tes
                       AND sf4.f4_poder3 <> 'D'
                       AND sf4.d_e_l_e_t_ = ' '
WHERE
    sb6.b6_filial = '0401'
    AND (
        (
            sb6.b6_tpcf = 'C'
            AND b6_clifor >= '         '
            AND b6_clifor <= 'zzzzzzzzz'
        )
        OR (
            sb6.b6_tpcf = 'F'
            AND b6_clifor >= '         '
            AND b6_clifor <= 'ZZZZZZ   '
        )
    )
    AND sb6.b6_produto >= '               '
    AND sb6.b6_produto <= 'ZZZZZZZZZZZZZZZ'
    AND sb6.b6_dtdigit >= '20170101'
    AND sb6.b6_dtdigit <= '20191231'
    AND sb6.b6_tipo = 'D'
    AND sb6.b6_quant <> 0
    AND sb6.d_e_l_e_t_ = ' '
ORDER BY
    b6_filial,
    b6_produto,
    b6_local
    
) where DOC='068674';

select sb6.B6_DOC,sf4.f4_codigo,sf4.f4_poder3,sb6.* from sb6010 sb6 
inner JOIN sf4010 sf4 ON sf4.f4_filial = '0401'
                       AND sf4.f4_codigo = sb6.b6_tes                       
                       AND sf4.d_e_l_e_t_ = ' '
--where sf4.f4_codigo='621' and sf4.f4_poder3 <> 'D'
where b6_doc in ('063392','068668','068674') 
order by sb6.B6_DOC;
    
/*where B6_IDENT in (
'616233',
'643661',
'650537',
'651030'
);*/
    
    
    
--==========================================================================================
--063392 - nota com problema
--064394 - nota anulação
--071382 - 

select F2_DTDIGIT from sf2010 where f2_filial='0401' and f2_doc='063392' and D_E_L_E_T_=' ';
select d2_doc,a.D2_IDENTB6,a.D2_NFORI,a.D2_EMISSAO,a.D2_DTDIGIT,d2_tes,a.* from sd2010 a where d2_filial='0401' and d2_doc='063392' and a.D_E_L_E_T_=' ';

/*
616233 = 012500057      
643661 = 012500082      
650537 = 012500158      
651030 = 012500077      
*/
select * from sd1010 where d1_filial='0401' and D1_IDENTB6 in (
'730473',
'730474',
'730475',
'730476');

select * from sd2010 where d2_filial='0401' and D2_IDENTB6 in (
'730473',
'730474',
'730475',
'730476');
select * from sf4010 where f4_filial='0401' and f4_codigo in ('261','621') and D_E_L_E_T_=' ';
select * from sf1010 where f1_filial='0401' and f1_doc in ('057241   ','057982   ','058346   ','058602   ') and D_E_L_E_T_=' ';
SELECT * FROM (
select d1_doc,a.D1_IDENTB6,a.D1_DTDIGIT,d1_tes,a.* from sd1010 a where D1_FILIAL='0401' and d1_doc in ('057241   ','057982   ','058346   ','058602   ') and D_E_L_E_T_=' ' order by a.D1_IDENTB6)
WHERE D1_IDENTB6;

/*
616233 = 012500057      
643661 = 012500082      
650537 = 012500158      
651030 = 012500077  
*/

select * from sf1010 where f1_filial='0401' and f1_doc in ('064394') and D_E_L_E_T_=' ';
select d1_doc,a.D1_IDENTB6,a.D1_NFORI,a.D1_DTDIGIT,a.* from sd1010 a where D1_FILIAL='0401' and d1_doc in ('064394') and D_E_L_E_T_=' ' order by a.D1_IDENTB6;
update SD1010 set D1_IDENTB6='730473' where D1_FILIAL='0401' and d1_doc='064394' and D1_COD='012500057' and D_E_L_E_T_=' ';
update SD1010 set D1_IDENTB6='730474' where D1_FILIAL='0401' and d1_doc='064394' and D1_COD='012500082' and D_E_L_E_T_=' ';
update SD1010 set D1_IDENTB6='730475' where D1_FILIAL='0401' and d1_doc='064394' and D1_COD='012500158' and D_E_L_E_T_=' ';
update SD1010 set D1_IDENTB6='730476' where D1_FILIAL='0401' and d1_doc='064394' and D1_COD='012500077' and D_E_L_E_T_=' ';
/*
730473 - 012500057      
730474 - 012500082      
730475 - 012500158      
730476 - 012500077      
*/

select a.F3_NFISCAL,a.F3_CODRSEF,a.F3_OBSERV,a.* from sf3010 a where f3_filial='0401' and f3_nfiscal='064394' and D_E_L_E_T_=' ';
select a.ft_nfiscal,a.FT_OBSERV,a.* from sft010 a where ft_filial='0401' and ft_nfiscal='064394' and D_E_L_E_T_=' ';
update sft010 set FT_OBSERV=' ' where ft_filial='0401' and ft_nfiscal='063392' and D_E_L_E_T_=' ';