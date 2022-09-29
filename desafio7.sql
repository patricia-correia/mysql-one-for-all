SELECT
  artistas.artista_nome AS `artista`,
  albums.album_nome AS  `album`,
  COUNT(seguindo_artistas.id_artista) AS `seguidores`
FROM
  SpotifyClone.artistas
INNER JOIN
  SpotifyClone.albums ON albums.id_artista = artistas.id_artista
INNER JOIN 
  SpotifyClone.seguindo_artistas ON seguindo_artistas.id_artista = albums.id_artista
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;