CREATE TEMPORARY TABLE IF NOT EXISTS
tmp0002 AS (
SELECT
  ao.ident
FROM catalyst c
  INNER JOIN reaction r
    ON c.ident = r.catalyst_ident
  INNER JOIN status_message sm
    ON r.ident = sm.reaction_ident
  INNER JOIN ac_object ao
    ON c.xref_id = ao.xref_id
WHERE r.status = 3
  AND c.source_system_ident <> 1
  AND c.source_action = 'INSERT'
  AND sm.message_text LIKE '%project is required%'
  AND c.source_object_type = 'PortfolioItem/Feature'
 );
