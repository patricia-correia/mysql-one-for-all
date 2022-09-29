SELECT
  usuarios.usuario_nome AS `usuario`,
IF(YEAR(MAX(historico_reproducao.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS `status_usuario`
FROM
  SpotifyClone.usuarios
INNER JOIN
  SpotifyClone.historico_reproducao ON historico_reproducao.id_usuario = usuarios.id_usuario
GROUP BY usuario
ORDER BY usuario ASC;