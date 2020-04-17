--AGR - CONFIRMAR ROMANEIO VINCULADO A NF
define datNFE = '20180108';

SELECT
    njj_filial,
    njj_codrom,
    njj_status,
    njj_stafis,
    njj_docnum,
    njj_docemi,
    njj_docesp,
    njj_docser,
    NJJ_DTRANS,
    NJJ_LIBQLD,
    a.*
FROM
    njj010 a
WHERE
    (njj_filial ='0401' and njj_codrom = '0000023313') or 
    (njj_filial ='0302' and njj_codrom in ('0000000748','0000000749','0000000750','0000000751','0000000752','0000000753','0000000754','0000000755','0000000756','0000000757','0000000758','0000000759','0000000760','0000000761','0000000762'));
    
UPDATE njj010
SET
    njj_status = 3,
    njj_stafis = 2,
    NJJ_DTRANS='&datNFE',
    NJJ_LIBQLD=0
WHERE
    (njj_filial ='0302' and njj_codrom in ('0000000748','0000000749','0000000750','0000000751','0000000752','0000000753','0000000754','0000000755','0000000756','0000000757','0000000758','0000000759','0000000760','0000000761','0000000762'));
    
SELECT
    njm_filial,
    njm_codrom,
    njm_pedido,
    njm_docnum,
    njm_docser,
    njm_docemi,
    njm_docesp,
    njm_chvnfe,
    njm_stafis,
    njm_dtrans,
    NJM_ITVDAP,
    a.*
FROM
    njm010 a
WHERE
    (njm_filial ='0401' and njm_codrom = '0000023313') or 
    (njm_filial ='0302' and njm_codrom in ('0000000748','0000000749','0000000750','0000000751','0000000752','0000000753','0000000754','0000000755','0000000756','0000000757','0000000758','0000000759','0000000760','0000000761','0000000762'));
    
UPDATE njm010
SET
    njm_stafis = 2,
    njm_dtrans = '&datNFE',
    NJM_ITVDAP=2
WHERE
    (njm_filial ='0302' and njm_codrom in ('0000000748','0000000749','0000000750','0000000751','0000000752','0000000753','0000000754','0000000755','0000000756','0000000757','0000000758','0000000759','0000000760','0000000761','0000000762'));
    
    
    
    
    
    
    
select * from GVI010 where gvi_seq='009';
update GVI010 set GVI_MSBLQL=2 where gvi_seq='009';
select * from gvj010 where GVJ_SEQ='009';