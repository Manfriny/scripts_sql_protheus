delete from lancamen l where l.CODI_CON=11000043 and l.DATA_LAN='25/09/2018' and l.SEQU_LAN=2;
delete FROM CRCBAIXA B WHERE B.CTRL_LAN=21127751;
SELECT * FROM CRCBAIPR P WHERE P.SEQU_BAI=20115810;
SELECT * FROM CABREC C where not exists (select * from notacrc nt where nt.CTRL_CBR=C.CTRL_CBR) and
  C.CODI_TDO=1000016 and C.DATA_CBR >= '23/09/2018' and C.SITU_CBR='A';


REM INSERTING into LANCAMEN
SET DEFINE OFF;
Insert into LANCAMEN (CODI_EMP,CTRL_LAN,DATA_LAN,SEQU_LAN,VLOR_LAN,DCOM_LAN,TDOC_LAN,CONC_LAN,CODI_CON,HIST_HIS,CODI_TPG,SITU_LAN,CEST_LAN,CREL_LAN,DCRE_LAN,DUMANUT,DCCO_LAN,ACOM_LAN,TROC_LAN,NUME_CCP,NAUT_LAN,DINSERT) 
values ('1','21127776',to_date('25/09/18','DD/MM/RR'),'11','62710',null,'BC','N','11000043','1000005','3','C',null,null,null,to_timestamp('25/09/18 13:00:39,079206000','DD/MM/RR HH24:MI:SSXFF'),null,null,null,null,null,to_timestamp('25/09/18 13:00:39,079182000','DD/MM/RR HH24:MI:SSXFF'));

REM INSERTING into CRCBAIXA
SET DEFINE OFF;
Insert into CRCBAIXA (CTRL_REC,SEQU_BAI,CODI_TPG,DPAG_BAI,VLOR_BAI,MULT_BAI,JURO_BAI,DESC_BAI,ACRE_BAI,ORIG_BAI,CONT_BAI,SITU_BAI,DTES_BAI,TPPG_BAI,CODI_IND,CODI_EMP,DATA_VLR,DTPC_BAI,CTRL_LAN,CODI_REC,DUMANUT,DINSERT,DTSYNCAPI,VVCA_BAI) values ('21100455','20115832','3',to_date('25/09/18','DD/MM/RR'),'62710','0','0','0','0','M','N','N',null,null,null,'1',null,null,'21127776',null,to_timestamp('25/09/18 13:00:39,138941000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('25/09/18 13:00:39,138917000','DD/MM/RR HH24:MI:SSXFF'),null,'0');


-----
REM INSERTING into LANCAMEN
SET DEFINE OFF;
Insert into LANCAMEN (CODI_EMP,CTRL_LAN,DATA_LAN,SEQU_LAN,VLOR_LAN,DCOM_LAN,TDOC_LAN,CONC_LAN,CODI_CON,HIST_HIS,CODI_TPG,SITU_LAN,CEST_LAN,CREL_LAN,DCRE_LAN,DUMANUT,DCCO_LAN,ACOM_LAN,TROC_LAN,NUME_CCP,NAUT_LAN,DINSERT) values ('1','21127751',to_date('25/09/18','DD/MM/RR'),'2','17500',null,'BC','N','11000043','1000005','3','C',null,null,null,to_timestamp('25/09/18 07:50:47,290821000','DD/MM/RR HH24:MI:SSXFF'),null,null,null,null,null,to_timestamp('25/09/18 07:50:47,290793000','DD/MM/RR HH24:MI:SSXFF'));


REM INSERTING into CRCBAIXA
SET DEFINE OFF;
Insert into CRCBAIXA (CTRL_REC,SEQU_BAI,CODI_TPG,DPAG_BAI,VLOR_BAI,MULT_BAI,JURO_BAI,DESC_BAI,ACRE_BAI,ORIG_BAI,CONT_BAI,SITU_BAI,DTES_BAI,TPPG_BAI,CODI_IND,CODI_EMP,DATA_VLR,DTPC_BAI,CTRL_LAN,CODI_REC,DUMANUT,DINSERT,DTSYNCAPI,VVCA_BAI) values ('21100401','20115810','3',to_date('25/09/18','DD/MM/RR'),'17500','0','0','0','0','M','N','N',null,null,null,'1',null,null,'21127751',null,to_timestamp('25/09/18 07:50:47,462441000','DD/MM/RR HH24:MI:SSXFF'),to_timestamp('25/09/18 07:50:47,462424000','DD/MM/RR HH24:MI:SSXFF'),null,'0');
