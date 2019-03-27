SELECT DISTINCT
  COUNT(*)
FROM catalyst c
  INNER JOIN reaction r
    ON c.ident = r.catalyst_ident
  INNER JOIN status_message sm
    ON r.ident = sm.reaction_ident
  INNER JOIN ac_object aco
    ON c.xref_id = aco.xref_id
WHERE c.last_updated > '2019-02-14T00:00:00Z'
  AND r.status = 3
  AND c.source_system_ident <> 1
  AND c.source_action = 'INSERT'
  AND sm.message_text LIKE '%project is required%'
  AND c.source_object_type = 'PortfolioItem/Feature'
  ;

SELECT DISTINCT
  c.source_object_id,
  aco.object_key,
  c.xref_id,
  c.source_action,
  r.status,
  SUBSTRING(r.target_data 
    FROM INSTR(r.target_data, '"Feature Name":"F') 
    FOR  (LOCATE('"Solution Epic":', r.target_data, INSTR(r.target_data,'"Feature Name":')) - INSTR(r.target_data, '"Feature Name":"F')) + 1) AS Reference
FROM catalyst c
  INNER JOIN reaction r
    ON c.ident = r.catalyst_ident
  INNER JOIN status_message sm
    ON r.ident = sm.reaction_ident
  INNER JOIN ac_object aco
    ON c.xref_id = aco.xref_id
WHERE c.last_updated > '2019-02-14T00:00:00Z'
  AND r.status = 3
  AND c.source_system_ident <> 1
  AND c.source_action = 'INSERT'
  AND sm.message_text LIKE '%project is required%'
  AND c.source_object_type = 'PortfolioItem/Feature'
  ;
