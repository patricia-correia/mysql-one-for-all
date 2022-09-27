DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      id_plano INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      plano_nome VARCHAR(50) NOT NULL,
      plano_valor DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
      id_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      usuario_nome VARCHAR(255) NOT NULL,
      idade INT NOT NULL,
      id_plano INT NOT NULL,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      id_artista INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      artista_nome VARCHAR(255) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albums(
      id_album  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      album_nome VARCHAR(255) NOT NULL,
      ano_lancamento YEAR NOT NULL,
      id_artista INT NOT NULL,
      FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      id_cancoes INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      cancoes_nome VARCHAR(255) NOT NULL,
      duracao_segundos INT NOT NULL,
      id_album INT NOT NULL,
      FOREIGN KEY (id_album) REFERENCES albums(id_album)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_reproducao(
      data_reproducao DATETIME NOT NULL,
      id_usuario INT NOT NULL,
      id_cancoes INT NOT NULL,
      FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
      FOREIGN KEY (id_cancoes) REFERENCES cancoes(id_cancoes),
      CONSTRAINT PRIMARY KEY (id_usuario, id_cancoes)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artistas(
      id_usuario INT NOT NULL,
      id_artista INT NOT NULL,
      FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
      FOREIGN KEY (id_artista) REFERENCES artistas(id_artista),
      CONSTRAINT PRIMARY KEY (id_usuario, id_artista)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (plano_nome, plano_valor)
  VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.usuarios (usuario_nome, idade, data_assinatura, id_plano)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-1-6', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-1-17', 2),
    ('Sandi Metz', 58, '2018-4-29', 2),
    ('Paulo Freire', 19, '2018-2-14', 3),
    ('Bell Hooks', 26, '2018-1-5', 3),
    ('Christopher Alexander', 85, '2019-6-5', 4),
    ('Judith Butler', 45, '2020-5-13', 4),
    ('Jorge Amado', 58, '2017-2-17', 4);

  INSERT INTO SpotifyClone.artistas (artista_nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albums (album_nome, ano_lancamento, id_artista)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.cancoes (cancoes_nome, duracao_segundos, id_album)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO''S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Dont''t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard''s Song' 244, 7),
    ('Feeling Good', 100, 8);
  
  INSERT INTO SpotifyClone.historico_reproducao (data_reproducao, id_usuario, id_cancoes)
  VALUES
    ('2022-2-28 10:45:55', 1, 8),
    ('2020-5-2 5:30:35', 1, 2),
    ('2020-3-6 11:22:33', 1, 10),
    ('2022-8-5 8:05:17', 2, 10),
    ('2020-1-2 7:40:33', 2, 7),
    ('2020-11-13 16:55:13', 3, 10),
    ('2020-12-5 18:38:30', 3, 2),
    ('2021-8-15 17:10:10', 4, 8),
    ('2022-1-9 1:44:33', 5, 8),
    ('2022-8-6 15:23:43', 5, 5),
    ('2017-1-24 0:31:17', 6, 7),
    ('2017-10-12 12:35:20', 6, 1),
    ('2011-12-15 22:30:49', 7, 4),
    ('2012-3-17 14:56:41', 8, 4),
    ('2022-12-13 21:14:22', 9, 9),
    ('2015-12-13 8:20:22', 10, 3);

  INSERT INTO SpotifyClone.seguindo_artistas (id_usuario, id_artista)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);