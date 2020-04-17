define produto='012500033';
define filial='0401';


SELECT * FROM SD1010 d1
inner join SDA010 da on d1.D1_LOTECTL= da.DA_LOTECTL and da.DA_DOC=d1.D1_DOC and da.DA_QTDORI = d1.D1_QUANT
where da.DA_PRODUTO='&produto' and D1_QTSEGUM=0 and da.DA_FILIAL='&filial' and da.D_E_L_E_T_=' '
;

UPDATE SD1010 set D1_QTSEGUM = D1_QUANT, D1_SEGUM = D1_UM
where R_E_C_N_O in (SELECT d1.R_E_C_N_O FROM SD1010 d1
inner join SDA010 da on d1.D1_LOTECTL= da.DA_LOTECTL and da.DA_DOC=d1.D1_DOC and da.DA_QTDORI = d1.D1_QUANT
where da.DA_PRODUTO='&produto' and D1_QTSEGUM=0 and da.DA_FILIAL='&filial' and da.D_E_L_E_T_=' '
);


SELECT * FROM SDA010 da
where da.DA_PRODUTO='&produto'and DA_QTDORI2=0 and da.DA_FILIAL='&filial' and da.D_E_L_E_T_=' '
;

UPDATE SDA010 set DA_QTSEGUM = DA_QTDORI, DA_QTDORI2 = DA_QTDORI
where DA_PRODUTO='&produto' and DA_QTDORI2=0 and DA_FILIAL='&filial' and D_E_L_E_T_=' '
;


SELECT * FROM SDA010 da
where da.DA_PRODUTO='&produto'and DA_QTSEGUM=0 and da.DA_FILIAL='&filial' and da.D_E_L_E_T_=' '
;

UPDATE SDA010 set DA_QTSEGUM = DA_QTDORI, DA_QTDORI2 = DA_QTDORI
where DA_PRODUTO='&produto' and DA_QTSEGUM=0 and DA_FILIAL='&filial' and D_E_L_E_T_=' '
;