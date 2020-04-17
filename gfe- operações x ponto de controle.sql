-- busca operações x pontos de controle
SELECT gvj_cdoper cod_operacao,
  gvj_seq seq_operacao,
  (SELECT gvi_dsconf
  FROM gvi010 gvi
  WHERE gvi.GVI_CDOPER=gvj_cdoper
  AND gvi.gvi_seq     =gvj_seq
  AND gvi.D_E_L_E_T_  =' '
  )descricao_operacao,
  GVJ_CDPTCT cod_ponto,
  gvj_ordem ordem,
  (SELECT gvf_dsptct
  FROM gvf010 gvf
  WHERE gvf.gvf_cdptct=gvj_cdptct
  AND gvf.D_E_L_E_T_  =' '
  )descricao_ponto
FROM gvj010 gvj
WHERE gvj.D_E_L_E_T_=' '
AND gvj_cdoper
  ||gvj_seq NOT IN
  (SELECT gvi_cdoper||gvi_seq FROM gvi010 gvi WHERE gvi.D_E_L_E_T_='*'
  )
ORDER BY gvj_cdoper,
  gvj_seq,
  gvj_ordem;
