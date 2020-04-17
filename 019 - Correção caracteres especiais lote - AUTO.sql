DECLARE

  V_SOMENTE_VERIFICAR CONSTANT BOOLEAN := FALSE;

  V_TABELAS CONSTANT VARCHAR2(912)     := 'SB7010/B7_LOTECTL;SB8010/B8_LOTECTL;SBC010/BC_LOTECTL;SBF010/BF_LOTECTL;SBJ010/BJ_LOTECTL;SBK010/BK_LOTECTL;SC0010/C0_LOTECTL;SC6010/C6_LOTECTL;SC9010/C9_LOTECTL;SD1010/D1_LOTECTL;SD2010/D2_LOTECTL;SD3010/D3_LOTECTL;SD4010/D4_LOTECTL;SD5010/D5_LOTECTL;SD7010/D7_LOTECTL;SDA010/DA_LOTECTL;SDB010/DB_LOTECTL;SDC010/DC_LOTECTL;SDD010/DD_LOTECTL;SH6010/H6_LOTECTL;SL2010/L2_LOTECTL;SLR010/LR_LOTECTL;STL010/TL_LOTECTL;STT010/TT_LOTECTL;SWN010/WN_LOTECTL;TBA010/TBA_LOTECT;TNF010/TNF_LOTECT;ZD1010/ZD1_LOTECT';
  V_DATA_EXECUCAO CONSTANT VARCHAR2(6) := TO_CHAR(SYSDATE, 'DDMMYY');
  V_SCHEMA CONSTANT VARCHAR2(16)       := 'TOTVS12PRD';
  V_SCHEMA_BKP CONSTANT VARCHAR2(16)       := 'TAWS';
    
  V_TABELA_BACKUP VARCHAR2(32);

  V_SQL_VERIFI CLOB := '';
  V_SQL_BACKUP CLOB := '';
  V_SQL_ATUALI CLOB := '';
  V_CURSOR SYS_REFCURSOR;
  V_RECNO NUMBER;
  
  V_QUANTIDADE NUMBER := 0;
  
  V_SUCESSO BOOLEAN;
  
  PROCEDURE LOG_DEBUG(P_MENSAGEM VARCHAR2) AS
    PRAGMA INLINE;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('[DEBUG] ' || P_MENSAGEM);
  END;
  
BEGIN
    LOG_DEBUG('Correção lotes bugados: ' || V_DATA_EXECUCAO);  

    FOR LINHA IN ( SELECT REGEXP_SUBSTR(LINHA,'[^/]+', 1, 1) AS TABELA, REGEXP_SUBSTR(REGEXP_SUBSTR(LINHA,'[^/]+', 1, 2),'[^,]+', 1, 1) AS COL1, REGEXP_SUBSTR(REGEXP_SUBSTR(LINHA,'[^/]+', 1, 2),'[^,]+', 1, 2) AS COL2, REGEXP_SUBSTR(REGEXP_SUBSTR(LINHA,'[^/]+', 1, 2),'[^,]+', 1, 3) AS COL3 FROM ( SELECT REGEXP_SUBSTR(V_TABELAS,'[^;]+', 1, LEVEL) AS LINHA FROM DUAL CONNECT BY REGEXP_SUBSTR(V_TABELAS, '[^;]+', 1, LEVEL) IS NOT NULL ) ) LOOP
        LOG_DEBUG('[' || LINHA.TABELA || '] Iniciando processamento, coluna: ' || LINHA.COL1);
        
        V_SQL_VERIFI := ' FROM ' || V_SCHEMA || '.' || LINHA.TABELA || ' WHERE trim(regexp_replace(' || LINHA.COL1 || ', ''[[:print:]]'', '''')) IS NOT NULL AND D_E_L_E_T_ = '' ''';
        EXECUTE IMMEDIATE 'SELECT COUNT(1)' || V_SQL_VERIFI INTO V_QUANTIDADE;
        
        IF V_QUANTIDADE > 0 THEN                    
          LOG_DEBUG('[' || LINHA.TABELA || '] Existem ' || V_QUANTIDADE || ' linha(s) com caracteres especiais.');
          
          IF NOT V_SOMENTE_VERIFICAR THEN
          
            --
            -- Cria a tabela de backup
            V_TABELA_BACKUP := LINHA.TABELA || '_BKP_' || V_DATA_EXECUCAO || '_LTERR';
            BEGIN
              SELECT 
                COUNT(1) INTO V_QUANTIDADE 
              FROM 
                DBA_OBJECTS 
              WHERE 
                OWNER = V_SCHEMA 
                AND OBJECT_NAME = V_TABELA_BACKUP 
                AND OBJECT_TYPE = 'TABLE';
              
              IF V_QUANTIDADE = 0 THEN            
                V_SQL_BACKUP := 'CREATE TABLE ' || V_SCHEMA_BKP || '.' || V_TABELA_BACKUP || ' AS SELECT * ' || V_SQL_VERIFI;
                
                LOG_DEBUG('[' || LINHA.TABELA || '] Criando tabela de backup ' || V_TABELA_BACKUP || ' -> ' || V_SQL_BACKUP);        
                EXECUTE IMMEDIATE V_SQL_BACKUP;
              ELSE
                LOG_DEBUG('[' || LINHA.TABELA || '] Tabela de backup ja existe ' || V_TABELA_BACKUP || ', reutilizando');
              END IF;
            END;
            
            --
            -- Realiza as correções
            BEGIN
               V_SQL_ATUALI := 'UPDATE ' || V_SCHEMA || '.' || LINHA.TABELA || ' SET ' || LINHA.COL1 || '= rpad(regexp_replace(' || LINHA.COL1 || ', ''[^[:print:]]'', ''''),15, '' '') WHERE R_E_C_N_O_ IN (SELECT R_E_C_N_O_ FROM ' || V_SCHEMA || '.' || V_TABELA_BACKUP || ')';
               
               LOG_DEBUG('[' || LINHA.TABELA || '] Aplicando correções -> ' || V_SQL_ATUALI);                          
               EXECUTE IMMEDIATE V_SQL_ATUALI;
               
               V_QUANTIDADE := SQL%ROWCOUNT;
               V_SUCESSO := TRUE;
               LOG_DEBUG('[' || LINHA.TABELA || '][+] Foram afetadas ' || V_QUANTIDADE || ' linha(s)');
               
               
               
               EXCEPTION WHEN OTHERS THEN
                 V_SUCESSO := FALSE;
                 LOG_DEBUG('[' || LINHA.TABELA || '][-] Falha ao aplicar correções ' || SQLERRM);               
            END;
            
            --
            -- Correção linha a linha
            IF V_SUCESSO = FALSE THEN
              OPEN V_CURSOR FOR 'SELECT R_E_C_N_O_ FROM ' || V_SCHEMA_BKP || '.' || V_TABELA_BACKUP;
              LOOP
                FETCH V_CURSOR INTO V_RECNO;
                EXIT WHEN V_CURSOR%NOTFOUND;
                
                BEGIN
                    V_SQL_ATUALI := 'UPDATE ' || V_SCHEMA || '.' || LINHA.TABELA || ' SET ' || LINHA.COL1 || '= rpad(regexp_replace(' || LINHA.COL1 || ', ''[^[:print:]]'', ''''),15, '' '') WHERE R_E_C_N_O_ = ' || V_RECNO;
                  
                    -- Descomentar para corrigir automaticamente
                    -- EXECUTE IMMEDIATE V_SQL_ATUALI;
                
                    V_QUANTIDADE := SQL%ROWCOUNT;
                    LOG_DEBUG('[' || LINHA.TABELA || '][+] Sucesso ao aplicar correção ao RecNo ' || V_RECNO || ', foram afetadas ' || V_QUANTIDADE || ' linha(s)');
                  EXCEPTION WHEN OTHERS THEN
                    LOG_DEBUG('[' || LINHA.TABELA || '][-] Falha ao aplicar correção ao RecNo ' || V_RECNO || ' : ' || SQLERRM || CHR(10) || CHR(10) || V_SQL_ATUALI);   
                END;
              END LOOP;
              
              CLOSE V_CURSOR;
            END IF;
          END IF;
        END IF;        
        
    END LOOP;
END;
