-- Source_Action(s): INSERT, UPDATE
-- STATUS: 0-Pend, 1-In Progress, 2-Complete:Success, 3-Complete:Failed
-- System: 1=PnC Property

SELECT
  COUNT(*)
FROM catalyst c
  INNER JOIN reaction r
    ON c.ident = r.catalyst_ident
  INNER JOIN status_message sm
    ON r.ident = sm.reaction_ident
WHERE r.status = 3
  AND c.source_system_ident <> 1
  AND c.source_action = 'INSERT'
  AND sm.message_text LIKE '%project is required%'
  AND (r.target_object_type = 'PortfolioItem/Feature'
    OR c.source_object_type = 'PortfolioItem/Feature')
  ;

SELECT
  c.source_object_id,
  c.xref_id,
  c.source_action,
  r.status,
  c.last_updated,
  'Project is required' as reason_str
FROM catalyst c
  INNER JOIN reaction r
    ON c.ident = r.catalyst_ident
  INNER JOIN status_message sm
    ON r.ident = sm.reaction_ident
WHERE r.status = 3
  AND c.source_system_ident <> 1
  AND c.source_action = 'INSERT'
  AND sm.message_text LIKE '%project is required%'
  AND (r.target_object_type = 'PortfolioItem/Feature'
    OR c.source_object_type = 'PortfolioItem/Feature')
ORDER BY
  c.last_updated DESC
  ;
