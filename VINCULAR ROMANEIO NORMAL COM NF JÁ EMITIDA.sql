DEFINE FILIAL='0402';
DEFINE NF='000002242';
DEFINE SERIENF='1';
DEFINE CHAVENFE='52160202745323000210550010000037311002528883';
DEFINE EMISSAONF='20160204';
DEFINE PEDIDO='001941';
DEFINE ROMANEIO='0000002242';
DEFINE ITEMROM='01';
DEFINE CONTRATO='000065';


UPDATE NJJ010 SET NJJ_STATUS='3',NJJ_STAFIS='2',NJJ_DOCNUM='&NF',NJJ_DOCEMI='&EMISSAONF',NJJ_DOCESP='SPED',NJJ_DOCSER='&SERIENF' WHERE NJJ_FILIAL='&FILIAL' AND NJJ_CODROM='&ROMANEIO';COMMIT;

UPDATE NJM010 SET NJM_DOCNUM='NF&',NJM_DOCSER='&SERIENF',NJM_DOCEMI='&EMISSAONF',NJM_DOCESP='SPED',NJM_CHVNFE='&CHAVENFE',NJM_STAFIS='2',NJM_DTRANS='&EMISSAONF'
WHERE NJM_FILIAL='&FILIAL' AND NJM_CODROM='&ROMANEIO' AND NJM_ITEROM='&ITEMROM';COMMIT;

UPDATE SC6010 SET C6_CODROM='&ROMANEIO',C6_ITEROM='&ITEMROM',C6_CONTRAT='&CONTRATO' WHERE C6_FILIAL='&FILIAL' AND C6_NUM='&PEDIDO';COMMIT;


