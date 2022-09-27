DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.usuario(
      id_usuario INT PRIMARY KEY AUTO_INCREMENT,
      usuario_nome VARCHAR(50) NOT NULL,
      idade INT,
      plano_planos_id INT NOT NULL,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (plano_planos_id) REFERENCES plano(planos_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.plano(
      planos_id INT PRIMARY KEY AUTO_INCREMENT,
      plano_nome VARCHAR(45) NOT NULL,
      valor_planos DECIMAL(5,2) NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_reproducao(
      data_reproducao DATETIME,
      usuario_id_usuario INT NOT NULL,
      cancoes_id_cancao INT NOT NULL,
      FOREIGN KEY (usuario_id_usuario) REFERENCES usuario(id_usuario),
      FOREIGN KEY (cancoes_id_cancao) REFERENCES cancoes(id_cancao),
      CONSTRAINT PRIMARY KEY (usuario_id_usuario, cancoes_id_cancao)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artista(
      usuario_id_usuario INT NOT NULL,
      artista_id_artista INT NOT NULL,
      FOREIGN KEY (usuario_id_usuario) REFERENCES usuario(id_usuario),
      FOREIGN KEY (artista_id_artista) REFERENCES artista(id_artista),
      CONSTRAINT PRIMARY KEY (usuario_id_usuario, artista_id_artista)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      id_artista INT PRIMARY KEY AUTO_INCREMENT,
      artista_nome VARCHAR(45) NOT NULL,
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      id_album  INT PRIMARY KEY AUTO_INCREMENT,
      album_nome VARCHAR(45) NOT NULL,
      ano_lancamento INT NOT NULL,
      artista_id_artista INT NOT NULL,
      FOREIGN KEY (artista_id_artista) REFERENCES artista(id_artista)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      id_cancao INT PRIMARY KEY AUTO_INCREMENT,
      cancao_nome VARCHAR(45) NOT NULL,
      duracao_segundo INT,
      album_id_album INT NOT NULL,
      FOREIGN KEY (album_id_album) REFERENCES album(id_album)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.usuario (usuario_nome, idade, plano_planos_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 32, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

  INSERT INTO SpotifyClone.plano (plano_nome, valor_planos)
  VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
  
  INSERT INTO SpotifyClone.historico_reproducao (data_reproducao, usuario_id_usuario, cancoes_id_cancao)
  VALUES
    ('2022-02-28 10:45:55', 1, 8),
    ('2020-05-02 05:30:35', 1, 2),
    ('2020-03-06 11:22:33', 1, 10),
    ('2022-08-05 08:05:17', 2, 10),
    ('2020-01-02 07:40:33', 2, 7),
    ('2020-11-13 16:55:13', 3, 10),
    ('2020-12-05 18:38:30', 3, 2),
    ('2021-08-15 17:10:10', 4, 8),
    ('2022-01-09 01:44:33', 5, 8),
    ('2022-08-06 15:23:43', 5, 5),
    ('2017-01-24 00:31:17', 6, 7),
    ('2017-10-12 12:35:20', 6, 1),
    ('2011-12-15 22:30:49', 7, 4),
    ('2012-03-17 14:56:41', 8, 4),
    ('2022-12-13 21:14:22', 9, 9),
    ('2015-12-13 08:20:22', 10, 3);

  INSERT INTO SpotifyClone.seguindo_artista (usuario_id_usuario, artista_id_artista)
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
  
  INSERT INTO SpotifyClone.artista (artista_nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.album (album_nome, ano_lancamento, artista_id_artista)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QCCJFA?', 2003, 4),
    ('Somewhere far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.cancoes (cancao_nome, duracao_segundo, album_id_album)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO''S GROOVE ', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Dont''t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard''s Song' 244, 7),
    ('Feelin Good', 100, 8);
