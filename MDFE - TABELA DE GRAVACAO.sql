SELECT
    cc0_filial,
    cc0_dtemis,
    cc0_sermdf,
    cc0_nummdf,
    cc0_protoc
FROM
    cc0010 cc0 
WHERE
    cc0.cc0_filial = '0402'
    AND cc0_sermdf = '4  '
    AND cc0_nummdf >= '000028'
    AND cc0_nummdf <= '000030'
    AND cc0_status = '3'
    AND cc0.d_e_l_e_t_ = ' '
;

select * from CC0010 where CC0_FILIAL='0402' and CC0_NUMMDF in ('000028','000029','000030');
select * from cc0010 where CC0_PROTOC like '%952180005395422%';
/*
NLA6298 
NIY9018 
NGO9575 */

select * from CC0010 where CC0_VEICUL='NLA6298' and D_E_L_E_T_=' ';
select * from SPED.SPED054 where NFE_ID like '%4%000096%' and D_E_L_E_T_=' ';