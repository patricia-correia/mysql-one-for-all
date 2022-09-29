SELECT
  cancoes.cancoes_nome AS `nome_musica`,
CASE
        WHEN cancoes_nome LIKE '%Bard%' THEN REPLACE(cancoes_nome,'Bard','QA')
        WHEN cancoes_nome LIKE '%Amar%' THEN REPLACE(cancoes_nome,'Amar','Code Review')
        WHEN cancoes_nome LIKE '%Pais%' THEN REPLACE(cancoes_nome,'Pais','Pull Requests')
        WHEN cancoes_nome LIKE '%SOUL%' THEN REPLACE(cancoes_nome,'SOUL','CODE')
        WHEN cancoes_nome LIKE '%SUPERSTAR%' THEN REPLACE(cancoes_nome,'SUPERSTAR','SUPERDEV')
        ELSE REPLACE(cancoes_nome,'%', NULL)
    END AS novo_nome
FROM
  SpotifyClone.cancoes
HAVING novo_nome IS NOT NULL
ORDER BY nome_musica DESC;