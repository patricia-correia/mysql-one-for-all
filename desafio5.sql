SELECT
  cancoes.cancoes_nome AS `cancao`,
  COUNT(*) AS `reproducoes`
FROM
  SpotifyClone.cancoes
INNER JOIN
  SpotifyClone.historico_reproducao ON historico_reproducao.id_cancoes = cancoes.id_cancoes
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;