select * from SB2010 where B2_FILIAL='0302' and B2_COD='020500003';
update SB2010 set 
    B2_VFIM1=round(B2_VFIM1,2),
    B2_VATU1=round(B2_VATU1,2),
    B2_CM1=round(B2_CM1,2),
    B2_VFIM2=round(B2_VFIM2,2),
    B2_VATU2=round(B2_VATU2,2),
    B2_CM2=round(B2_CM2,2)
where B2_FILIAL='0302' and B2_COD='020500003';

--4951043,360197