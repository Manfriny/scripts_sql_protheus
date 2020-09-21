select gw1_sit,a.* from gw1010 a where gw1_filial='0401' and GW1_NRDC in ('000005577'); --numero da nota fiscal
update gw1010 set gw1_sit='4' where gw1_filial='0401' and GW1_NRDC in ('000005577');