SELECT
  cancoes.cancoes_nome AS `nome`,
  COUNT(historico_reproducao.id_cancoes) AS `reproducoes`
FROM
  SpotifyClone.cancoes
INNER JOIN
  SpotifyClone.historico_reproducao ON historico_reproducao.id_cancoes = cancoes.id_cancoes
INNER JOIN
  SpotifyClone.usuarios ON usuarios.id_usuario = historico_reproducao.id_usuario
INNER JOIN
  SpotifyClone.planos ON planos.id_plano = usuarios.id_plano
WHERE plano_nome = 'gratuito'
OR plano_nome = 'pessoal'
GROUP BY nome
ORDER BY nome ASC; 