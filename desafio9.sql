SELECT
  COUNT(*) AS `quantidade_musicas_no_historico`
FROM
  SpotifyClone.usuarios
INNER JOIN
  SpotifyClone.historico_reproducao AS h ON h.id_usuario = usuarios.id_usuario
WHERE usuario_nome = 'Barbara Liskov';