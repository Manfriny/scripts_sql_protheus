
SET SERVEROUTPUT ON
DECLARE CURSOR CUR IS SELECT
  sf1.R_E_C_N_O_ as recno_sf1,
  sd1.R_E_C_N_O_ as recno_sd1,
  sf3.R_E_C_N_O_ as recno_sf3,
  sft.R_E_C_N_O_ as recno_sft,
  sf1.F1_FILIAL,
  sf1.F1_FORNECE,
  sf1.F1_LOJA,
  sf1.F1_DOC,
  sf1.F1_SERIE,
  sd1.D1_SERIE,
  sf3.F3_SERIE,
  sft.FT_SERIE
FROM
  sf1010 sf1
  inner join sd1010 sd1 on sd1.D_E_L_E_T_<>'*' and sd1.D1_FILIAL=sf1.F1_FILIAL and sd1.D1_FORNECE=sf1.F1_FORNECE and sd1.D1_DOC=sf1.F1_DOC and sd1.D1_SERIE=sf1.F1_SERIE
  inner join sf3010 sf3 on sf3.D_E_L_E_T_<>'*' and sf3.f3_FILIAL=sf1.F1_FILIAL and sf3.F3_CLIEFOR=sf1.F1_FORNECE and sf3.F3_NFISCAL=sf1.F1_DOC and sf3.F3_SERIE=sf1.F1_SERIE
  inner join sfT010 sft on sft.D_E_L_E_T_<>'*' and sft.ft_FILIAL=sf1.F1_FILIAL and sft.Ft_CLIEFOR=sf1.F1_FORNECE and sft.Ft_NFISCAL=sf1.F1_DOC and sft.Ft_SERIE=sf1.F1_SERIE and sft.FT_ITEM=sd1.D1_ITEM
WHERE
  f1_doc='000061416' and sf1.D_E_L_E_T_<>'*';
  
  C_NSER VARCHAR(3) := '0  '; -- INSERIR AQUI O CÓDIGO DA SERIE

BEGIN
  
  FOR R1 IN CUR LOOP
	/*DOC DE ENTRADA*/
	UPDATE SF1010 SET F1_SERIE=C_NSER where R_E_C_N_O_ = R1.recno_sf1;
      DBMS_OUTPUT.PUT_LINE('        DOC DE ENTRADA:');
      DBMS_OUTPUT.PUT_LINE('                '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
    UPDATE Sd1010 SET D1_SERIE=C_NSER where R_E_C_N_O_ = R1.recno_sd1;
      DBMS_OUTPUT.PUT_LINE('        ITENS:');
      DBMS_OUTPUT.PUT_LINE('                '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
	
    /*LIVROS*/
    UPDATE SF3010 SET F3_SERIE=C_NSER where R_E_C_N_O_ = R1.recno_sf3;
      DBMS_OUTPUT.PUT_LINE('        LIVROS:');
      DBMS_OUTPUT.PUT_LINE('                '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
    UPDATE SFT010 SET Ft_SERIE=C_NSER where R_E_C_N_O_ = R1.recno_sft;
      DBMS_OUTPUT.PUT_LINE('        ITENS:');
      DBMS_OUTPUT.PUT_LINE('                '||TO_Char(SQL%ROWCOUNT)||' linha(s) atualizada(s).');
  END LOOP;
END;