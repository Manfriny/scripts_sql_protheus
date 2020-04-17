select * from sc9010 where c9_filial='0301' and c9_pedido='011477';	--liberação de pedido
select * from nj5010 where nj5_filial='0301' and nj5_numpv='011477' ;--programação de entrega
select * from dak010 where dak_filial='0301' and dak_cod='000141'; --carga
select * from dai010 where dai_filial='0301' and dai_cod='000141';--itens da carga
select * from gwn010 where gwn_filial='0301' and gwn_nrrom like '%000141%'; --documento de carga
select * from nj6010 where nj6_filial='0301' and nj6_numpv='011474';--seleção de lotes