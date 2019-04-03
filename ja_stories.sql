CREATE TEMPORARY TABLE IF NOT EXISTS
tmp0003 AS (
SELECT
  jo.ident
FROM catalyst c
  INNER JOIN reaction r
    ON c.ident = r.catalyst_ident
  INNER JOIN status_message sm
    ON r.ident = sm.reaction_ident
  INNER JOIN jira_object jo
    ON c.xref_id = jo.xref_id
WHERE r.status = 3
  AND c.source_system_ident <> 1
  AND c.source_action = 'INSERT'
  AND sm.message_text LIKE '%reason Project%'
  AND r.target_object_type = 'HierarchicalRequirement'
  );
