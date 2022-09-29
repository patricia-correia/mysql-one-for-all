SELECT
  ROUND(MIN(planos.plano_valor), 2) AS `faturamento_minimo`,
  MAX(planos.plano_valor) AS `faturamento_maximo`,
  ROUND(AVG(planos.plano_valor), 2) AS `faturamento_medio`,
  ROUND(SUM(planos.plano_valor), 2) AS `faturamento_total`
FROM
  SpotifyClone.usuarios
INNER JOIN
  SpotifyClone.planos ON planos.id_plano = usuarios.id_plano;