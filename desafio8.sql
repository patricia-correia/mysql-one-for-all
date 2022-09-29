SELECT
  artistas.artista_nome AS `artista`,
  albums.album_nome AS `album`
FROM
  SpotifyClone.artistas
INNER JOIN
  SpotifyClone.albums ON albums.id_artista = artistas.id_artista
WHERE artista_nome = 'Elis Regina';