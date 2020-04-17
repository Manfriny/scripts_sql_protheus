SELECT at_name,
  AT_TIME,
  AT_DATE,
  AT_OP,
  AT_RECID,
  AT_FIELD,
  trim(AT_CONTENT) AS AT_CONTENT,
  trim(AT_NEWCONT) AS AT_NEWCONT
FROM AUDIT_TRAIL
WHERE trim(AT_TABLE)LIKE '%ZS8%'
AND AT_DATE>='20170101'
AND AT_RECID =27778
;
