SELECT
  c.source_object_id,
  c.xref_id,
  c.source_action,
  r.status,
  SUBSTRING(message_text
	FROM INSTR(message_text,'reason Project')
	FOR (LOCATE('.',message_text,INSTR(message_text,'reason Project')) - INSTR(message_text,'reason Project')) + 1) as reason_str
FROM catalyst c
  INNER JOIN reaction r
    ON c.ident = r.catalyst_ident
  INNER JOIN status_message sm
    ON r.ident = sm.reaction_ident
WHERE c.last_updated > '2019-02-14T00:00:00Z'
  AND r.status = 3
  AND c.source_system_ident <> 1
  AND c.source_action = 'INSERT'
  AND sm.message_text LIKE '%reason Project%'
  AND r.target_object_type = 'PortfolioItem/Feature'
  ;
