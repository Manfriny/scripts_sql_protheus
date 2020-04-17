define Filial = '0401';
define Pedido = '034324';
define Nota   = '085820';
define Serie  = '2';

         
SET SERVEROUTPUT ON
DECLARE CURSOR CUR1 IS 
SELECT
    c6.c6_xlotecl AS c6Xlote,
    c6.c6_lotectl AS c6Lote,
    c6.c6_dtvalid AS c6Valid,
    c6.r_e_c_n_o_ AS c6Rec,
    c9.c9_lotectl AS c9Lote,
    c9.c9_dtvalid AS c9Valid,
    c9.r_e_c_n_o_ AS c9Rec,
    d2.d2_doc     AS d2Doc,
    d2.d2_lotectl AS d2Lote,
    d2.d2_dtvalid AS d2Valid,
    d2.d2_dfabric AS d2Fabric,
    d2.r_e_c_n_o_ AS d2Rec,
    fa.f0a_lote   AS faLote,
    fa.f0a_valid  AS faValid,
    fa.f0a_fabric AS faFabric,
    fa.r_e_c_n_o_ AS faRec --,
    --d1.d1_dtvalid AS d1Valid,
    --d1.r_e_c_n_o_ AS d1Rec
FROM
    sc6010 c6
    INNER JOIN sc9010 c9 ON c6.c6_filial = c9.c9_filial
                            AND c6.c6_num = c9.c9_pedido
                            AND c6.c6_produto = c9.c9_produto
                            AND c6.c6_item = c9.c9_item
                            AND c6.c6_local = c9.c9_local
                            AND c6.d_e_l_e_t_ = c9.d_e_l_e_t_
    INNER JOIN sd2010 d2 ON c6.c6_filial = d2.d2_filial
                            AND c6.c6_num = d2.d2_pedido
                            AND c6.c6_produto = d2.d2_cod
                            AND c6.c6_item = d2.d2_itempv
                            AND c6.c6_local = d2.d2_local
                            AND c6.d_e_l_e_t_ = d2.d_e_l_e_t_
    INNER JOIN f0a010 fa ON c6.c6_filial = fa.f0a_filial
                            AND d2.d2_doc = fa.f0a_doc
                            AND d2.d2_cod = fa.f0a_cod
                            AND d2.d2_item = fa.f0a_item
    --INNER JOIN sd1010 d1 ON d1.d1_filial = c6.c6_filial
                            --AND d1.d1_cod = c6.c6_produto
                            --AND d1.d1_doc = c6.c6_nfori
WHERE
    c6.c6_filial = '&Filial' AND c6.c6_num = '&Pedido' AND c6.d_e_l_e_t_ = ' ';

BEGIN
  
  FOR R1 IN CUR1 LOOP
  
      --IF r1.c6Xlote <> ' ' and  r1.c6Lote = ' ' THEN
        update SC6010 set C6_LOTECTL = r1.c6Xlote where R_E_C_N_O_= r1.c6Rec;	        
        --DBMS_OUTPUT.PUT_LINE('SC6 - '||'c6Lote: '||TO_char(trim(r1.c6Lote))||' - '||'DTValid: no exist - DTFabric: no exist - '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
      --ELSE
        --update SC6010 set C6_XLOTECL = r1.c6Lote where R_E_C_N_O_= r1.c6Rec;	        
        --DBMS_OUTPUT.PUT_LINE('SC6 - '||'c6Xlot: '||TO_char(trim(r1.c6Xlote))||' - '||'DTValid: no exist - DTFabric: no exist - '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
      --END IF;
      
      --IF r1.c6Valid = ' ' then 
        --update SC6010 set C6_DTVALID = r1.d1Valid where R_E_C_N_O_= r1.c6Rec;	        
      --END IF;
      
      update SC9010 set C9_LOTECTL=r1.c6Lote, C9_DTVALID=r1.c6Valid where R_E_C_N_O_ = r1.c9Rec;
        DBMS_OUTPUT.PUT_LINE('SC9 - '||'c9Lote: '||TO_char(trim(r1.c9Lote))||' - '||'DTValid: '||TO_char(r1.c9Valid)||' - DTFabric: no exist - '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
      update SD2010 set D2_DFABRIC=r1.faFabric, D2_LOTECTL=r1.c6Lote,D2_DTVALID=r1.c6Valid where R_E_C_N_O_ = r1.d2Rec;
        DBMS_OUTPUT.PUT_LINE('SD2 - '||'d2Lote: '||TO_char(trim(r1.d2Lote))||' - '||'DTValid: '||TO_char(r1.d2Valid)||' - '||'DTFabric: '||TO_char(r1.d2Fabric)||' - '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
      update F0A010 set F0A_VALID=r1.c6Valid where R_E_C_N_O_ = r1.faRec;
        DBMS_OUTPUT.PUT_LINE('F0A - '||'faLote: '||TO_char(trim(r1.faLote))||' - '||'DTValid: '||TO_char(r1.faValid)||' - DTFabric: no exist - '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
      
  END LOOP;
END;


--select * from SPED.SPED050 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
--update SPED.SPED050 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
--select * from SPED.SPED054 where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
--update SPED.SPED054 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where NFE_ID like '%'||'&Serie'||'%'||'&Nota'||'%' and D_E_L_E_T_=' ';
--select * from SPED.SPED150;
/*
select c6.c6_dtvalid,c6.* from sc6010 c6 where c6.c6_filial = '&Filial' AND c6.c6_num = '&Pedido' AND c6.d_e_l_e_t_ = ' ';
update sc6010 c6 set c6.c6_dtvalid='20200330' where c6.c6_filial = '&Filial' AND c6.c6_num = '&Pedido' AND c6.d_e_l_e_t_ = ' ';

select c9.c9_dtvalid,c9.* from sc9010 c9 where c9.c9_filial = '&Filial' AND c9.c9_pedido = '&Pedido' AND c9.d_e_l_e_t_ = ' ';
update sc9010 c9 set c9.c9_dtvalid='20200330' where c9.c9_filial = '&Filial' AND c9.c9_pedido = '&Pedido' AND c9.d_e_l_e_t_ = ' ';

select * from sd2010 where d2_doc='085820';
select F0A_VALID,fa.* from f0a010 fa where F0A_DOC='085820' and d_e_l_e_t_=' ';
update f0a010 fa set F0A_VALID='20200330' where F0A_DOC='085820' and d_e_l_e_t_=' ';
