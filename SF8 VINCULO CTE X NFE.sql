select D1_DTVALID,D1_LOTECTL, R_E_C_N_O_,x.* from SD1010 x where D1_FILIAL='0301' and D1_DOC='000024190';
update SD1010 set D1_DTVALID='20200531' where R_E_C_N_O_=137171;

select * from sped.sped150;


select F8_NFORIG,F8_NFDIFRE,a.* from SF8010 a where F8_FILIAL='0302' and F8_NFORIG like '%187507%' and D_E_L_E_T_=' ';
update sf8010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where F8_FILIAL='0302' and F8_NFORIG like '%187507%' and D_E_L_E_T_=' ';

select * from SF8010 where F8_FILIAL='0301' and F8_NFDIFRE like '%266663' and D_E_L_E_T_=' ';


select * from SE4010 where E4_FILIAL in ('0301','0302','0401','0402') and e4_codigo='011';


--0401
select F8_NFORIG,F8_NFDIFRE,a.* from SF8010 a where f8_filial='0301' order by F8_DTDIGIT desc;