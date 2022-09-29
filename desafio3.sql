SELECT
  usuarios.usuario_nome AS `usuario`,
  COUNT(historico_reproducao.id_cancoes) AS `qt_de_musicas_ouvidas`,
  ROUND(SUM(cancoes.duracao_segundos) / 60, 2) AS `total_minutos`
FROM
  SpotifyClone.usuarios
INNER JOIN
  SpotifyClone.historico_reproducao ON historico_reproducao.id_usuario = usuarios.id_usuario
INNER JOIN
  SpotifyClone.cancoes ON cancoes.id_cancoes = historico_reproducao.id_cancoes
GROUP BY usuario
ORDER BY usuario ASC;