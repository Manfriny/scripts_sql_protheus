--  retornar NF para o Protheus.sql

--nf saída        
SET SERVEROUTPUT ON
DECLARE CURSOR CUR IS	SELECT 
						  SD2.D2_FILIAL,
						  SD2.D2_DOC,
						  SD2.D2_SERIE,
						  SPD.DATE_NFE,
						  SC5.C5_NUM,
						  SC6.C6_CONTRAT,
						  SPD.STATUS,
						  SPD.STATUSCANC,
						  SF3.F3_DTCANC,
						  SPD.R_E_C_N_O_ as recno_spd,
						  sc5.R_E_C_N_O_ as recno_sc5,
						  sf2.R_E_C_N_O_ as recno_sf2,
						  sf3.R_E_C_N_O_ as recno_sf3,
						  sc6.R_E_C_N_O_ as recno_sc6,
						  sd2.R_E_C_N_O_ as recno_sd2,
						  sft.R_E_C_N_O_ as recno_sft,
						  SC5.D_E_L_E_T_ AS DEL_PV,
						  SC6.D_E_L_E_T_ AS DEL_PVITEN,
						  SF2.D_E_L_E_T_ AS DEL_NF,
						  SD2.D_E_L_E_T_ AS DEL_NFITEN
						FROM SPED.SPED050 SPD
						INNER JOIN SD2010 SD2 ON TRIM(SD2.D2_DOC)=SUBSTR(SPD.NFE_ID,4,6) AND TRIM(SD2.D2_SERIE)=SUBSTR(SPD.NFE_ID,1,1)
						INNER JOIN SF2010 SF2 ON SD2.D2_FILIAL = SF2.F2_FILIAL AND SD2.D2_DOC = SF2.F2_DOC AND SD2.D2_SERIE = SF2.F2_SERIE AND SF2.F2_CLIENT = SD2.D2_CLIENTE 
						INNER JOIN SF3010 SF3 ON sf3.D_E_L_E_T_<>'*' and sf3.f3_FILIAL=SD2.D2_FILIAL and sf3.F3_CLIEFOR=SD2.D2_CLIENTE and sf3.F3_NFISCAL=SD2.D2_DOC and sf3.F3_SERIE=SD2.D2_SERIE
						INNER JOIN sfT010 sft on sft.D_E_L_E_T_<>'*' and sft.ft_FILIAL=sf3.f3_FILIAL and sft.Ft_CLIEFOR=sf3.F3_CLIEFOR and sft.Ft_NFISCAL=sf3.F3_NFISCAL and sft.Ft_SERIE=sf3.F3_SERIE and sft.FT_PRODUTO=SD2.D2_COD and SD2.D2_ITEM=sft.FT_ITEM
						INNER JOIN SC6010 SC6 ON  SC6.C6_FILIAL=SD2.D2_FILIAL AND SC6.C6_NUM=SD2.D2_PEDIDO AND C6_ITEM=SD2.D2_ITEMPV AND SC6.C6_PRODUTO=SD2.D2_COD and SD2.D2_QUANT=SC6.C6_QTDVEN
						INNER JOIN SC5010 SC5 ON  SC5.C5_FILIAL=SD2.D2_FILIAL AND SC5.C5_NUM=SD2.D2_PEDIDO

						WHERE 
						(Sf2.D_E_L_E_T_='*'--somente as deletadas
						or Sc5.D_E_L_E_T_='*')
						AND SPD.STATUSCANC<>'2'--status do spednfe diferente de 2
						and SPD.STATUS='7'
						--and SC6.C6_CONTRAT<>' '
						and SD2.D2_DOC = '005362'
            GROUP BY 
						  SD2.D2_FILIAL,
						  SD2.D2_DOC,
						  SD2.D2_SERIE,
						  SPD.DATE_NFE,
						  SC5.C5_NUM,
						  SC6.C6_CONTRAT,
						  SPD.STATUS,
						  SPD.STATUSCANC,
						  SF3.F3_DTCANC,
						  SPD.R_E_C_N_O_,
						  sd2.R_E_C_N_O_,
						  sf2.R_E_C_N_O_,
						  sft.R_E_C_N_O_,
						  sc6.R_E_C_N_O_,
						  sf3.R_E_C_N_O_,
						  sc5.R_E_C_N_O_,
						  SC5.D_E_L_E_T_,
						  SC6.D_E_L_E_T_ ,
						  SF2.D_E_L_E_T_,
						  SD2.D_E_L_E_T_ 
						  ORDER BY SD2.D2_DOC;

BEGIN
  FOR R1 IN CUR LOOP
	UPDATE SF2010 SET D_E_L_E_T_=' ', R_E_C_D_E_L_=0 WHERE R_E_C_N_O_=R1.recno_sf2;
	UPDATE SD2010 SET D_E_L_E_T_=' ', R_E_C_D_E_L_=0 WHERE R_E_C_N_O_=R1.recno_sd2;
	UPDATE SC6010 SET D_E_L_E_T_=' ', R_E_C_D_E_L_=0 WHERE R_E_C_N_O_=R1.recno_sc6;
    UPDATE SC5010 SET D_E_L_E_T_=' ', R_E_C_D_E_L_=0 WHERE R_E_C_N_O_=R1.recno_sc5;
	UPDATE SF3010 SET F3_OBSERV='                                        ',F3_DTCANC='        ', F3_CODRSEF='   ' WHERE R_E_C_N_O_=R1.recno_sf3;
	UPDATE SFT010 SET /*FT_OBSERV='FT_DTCANC',*/ FT_DTCANC='        ' WHERE R_E_C_N_O_=R1.recno_sfT;
	UPDATE SPED.SPED050 SET STATUSCANC=0,STATUS=6 WHERE R_E_C_N_O_=R1.recno_spd;
  END LOOP;
END;

--
--NF entrada

         
SET SERVEROUTPUT ON
DECLARE CURSOR CUR IS	SELECT 
						  SD1.D1_FILIAL,
						  SD1.D1_DOC,
						  SD1.D1_SERIE,
						  SPD.DATE_NFE,
						  SPD.STATUS,
						  SPD.STATUSCANC,
						  SF3.F3_DTCANC,
						  SPD.R_E_C_N_O_ as recno_spd,
						  sf1.R_E_C_N_O_ as recno_sf1,
						  sf3.R_E_C_N_O_ as recno_sf3,
						  sd1.R_E_C_N_O_ as recno_sd1,
						  sft.R_E_C_N_O_ as recno_sft,
						  SF1.D_E_L_E_T_ AS DEL_NF,
						  SD1.D_E_L_E_T_ AS DEL_NFITEN
						FROM SPED.SPED050 SPD
						INNER JOIN SD1010 SD1 ON TRIM(SD1.D1_DOC)=trim(SUBSTR(SPD.NFE_ID,4,6)) AND TRIM(SD1.D1_SERIE)=trim(SUBSTR(SPD.NFE_ID,1,2))
						INNER JOIN SF1010 SF1 ON SD1.D1_FILIAL = SF1.F1_FILIAL AND SD1.D1_DOC = SF1.F1_DOC AND SD1.D1_SERIE = SF1.F1_SERIE AND SF1.F1_FORNECE = SD1.D1_FORNECE
						INNER JOIN SF3010 SF3 ON sf3.D_E_L_E_T_<>'*' and sf3.f3_FILIAL=SD1.D1_FILIAL and sf3.F3_CLIEFOR=SD1.D1_FORNECE and sf3.F3_NFISCAL=SD1.D1_DOC and sf3.F3_SERIE=SD1.D1_SERIE
						INNER JOIN sfT010 sft on sft.D_E_L_E_T_<>'*' and sft.ft_FILIAL=sf3.f3_FILIAL and sft.Ft_CLIEFOR=sf3.F3_CLIEFOR and sft.Ft_NFISCAL=sf3.F3_NFISCAL and sft.Ft_SERIE=sf3.F3_SERIE and sft.FT_PRODUTO=SD1.D1_COD and SD1.D1_ITEM=sft.FT_ITEM

						WHERE 
						(Sf1.D_E_L_E_T_='*'--somente as deletadas or Sc5.D_E_L_E_T_='*'
						and sf1.f1_doc='074783')
						--AND SPD.STATUSCANC<>'3'--status do spednfe diferente de 2
						--and SPD.STATUS='7'
						;

BEGIN
  FOR R1 IN CUR LOOP
	UPDATE SF1010 set D_E_L_E_T_=' ', R_E_C_D_E_L_=0 WHERE R_E_C_N_O_=R1.recno_sf1;
	UPDATE SD1010 SET D_E_L_E_T_=' ', R_E_C_D_E_L_=0 WHERE R_E_C_N_O_=R1.recno_sd1;
	UPDATE SF3010 SET F3_OBSERV='                                        ',F3_DTCANC='        ', F3_CODRSEF='   ' WHERE R_E_C_N_O_=R1.recno_sf3;
	UPDATE SFT010 SET FT_OBSERV='FT_DTCANC', FT_DTCANC='        ' WHERE R_E_C_N_O_=R1.recno_sfT;
	UPDATE SPED.SPED050 SET STATUSCANC=0,STATUS=6 WHERE R_E_C_N_O_=R1.recno_spd;
  END LOOP;
END;
