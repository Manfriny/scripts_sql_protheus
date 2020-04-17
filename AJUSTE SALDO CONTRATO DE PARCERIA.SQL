SET SERVEROUTPUT ON
DECLARE CURSOR cur IS SELECT ADB_DESPRO,ADB_ITEM,ADB_NUMCTR,ADA_XPEDBL,ADB_QUANT,ADA_NUMCTR,ADA_STATUS,ADA_TPFRET,
                             adb.ADB_QUANT as ADB_VOL,
                             ADB.R_E_C_N_O_ AS RECNO,
                             (select NVL(sum(nph.nph_quant),0)
                                from nph010 nph
                                inner JOIN  SB1010 SB1  ON SB1.D_E_L_E_T_=' ' AND SB1.B1_COD=nph.NPH_CODPRO  
                                inner JOIN  npg010 npg  ON npg.D_E_L_E_T_=' ' AND NPG.NPG_FILIAL=NPH.NPH_FILIAL and NPG.NPG_CODIGO=NPH.NPH_CODAC
                                where nph.D_E_L_E_T_=' ' and nph.NPH_FILIAL=adb.ADB_FILIAL and nph.NPH_NUMCP=adb.adb_numctr  and npg.NPG_STATUS <> '3' and nph.NPH_ITEMCP=ADB.ADB_ITEM
                             ) AS TOTAL_AUT,
                             ADB.ADB_QTDEMP
                      FROM ADB010 ADB
                      INNER JOIN ADA010 ADA ON ADA.D_E_L_E_T_ = ' ' AND ADA.ADA_NUMCTR = ADB.ADB_NUMCTR AND ADB.ADB_FILIAL=ADA.ADA_FILIAL
                      WHERE ADB.D_E_L_E_T_ = ' ' AND ADB.ADB_FILIAL = '0301' AND ADA.ADA_CODSAF='2016'  and ADB_NUMCTR='004427';

BEGIN
  FOR R1 IN CUR LOOP
      UPDATE ADB010 SET ADB_QTDEMP=(R1.TOTAL_AUT) WHERE R_E_C_N_O_ = R1.RECNO;  
  END LOOP;
END;