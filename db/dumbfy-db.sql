DROP DATABASE IF EXISTS dumbfy;
CREATE DATABASE IF NOT EXISTS dumbfy;

CREATE TABLE dumbfy.artist(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE dumbfy.plan(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    plan_price DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE dumbfy.user (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id)
        REFERENCES dumbfy.plan (id)
)  ENGINE=INNODB;

CREATE TABLE dumbfy.album(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES dumbfy.artist (id)
) engine = InnoDB;

CREATE TABLE dumbfy.song (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    duration_seconds INT NOT NULL,
    release_year YEAR NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES dumbfy.album (id)
)  ENGINE=INNODB;

CREATE TABLE dumbfy.users_playback_history(
    played_at DATETIME NOT NULL,
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES dumbfy.user (id),
    FOREIGN KEY (song_id) REFERENCES dumbfy.song (id)
) engine = InnoDB;

CREATE TABLE dumbfy.followed_artists(
    artist_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (artist_id, user_id),
    FOREIGN KEY (artist_id) REFERENCES dumbfy.artist (id),
    FOREIGN KEY (user_id) REFERENCES dumbfy.user (id)
) engine = InnoDB;

INSERT INTO dumbfy.artist (name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO dumbfy.plan (name, plan_price)
VALUES
  ('free', 0),
  ('student', 5.99),
  ('individual', 6.99),
  ('family', 7.99);

INSERT INTO dumbfy.user (full_name, age, plan_id)
VALUES
  ('Barbara Liskov', 82, 1),
  ('Robert Cecil Martin', 58, 1),
  ('Ada Lovelace', 37, 4),
  ('Martin Fowler', 46, 4),
  ('Sandi Metz', 58, 4),
  ('Paulo Freire', 19, 2),
  ('Bell Hooks', 26, 2),
  ('Christopher Alexander', 85, 3),
  ('Judith Butler', 45, 3),
  ('Jorge Amado', 58, 3);

INSERT INTO dumbfy.album (title, artist_id)
VALUES
  ('Renaissance', 1),
  ('Jazz', 2),
  ('Hot Space', 2),
  ('Falso Brilhante', 3),
  ('Vento de Maio', 3),
  ('QVVJFA?', 4),
  ('Somewhere Far Beyond', 5),
  ('I Put A Spell On You', 6);

INSERT INTO dumbfy.song (name, duration_seconds, release_year, album_id)
VALUES
  ('BREAK MY SOUL', 279, 2022, 1),
  ('VIRGO\'S GROOVE', 369, 2022, 1),
  ('ALIEN SUPERSTAR', 116, 2022, 2),
  ('Don\'t Stop Me Now', 203, 1978, 1),
  ('Under Pressure', 152, 1982, 3),
  ('Como Nossos Pais', 105, 1998, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 2001, 5),
  ('Samba em Paris', 267, 2003, 6),
  ('The Bard\'s Song', 244, 2007, 7),
  ('Feeling Good', 100, 2012, 8);

INSERT INTO dumbfy.users_playback_history (played_at, user_id, song_id)
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
  ('2020-08-06 15:23:43', 5, 5),
  ('2017-01-24 00:31:17', 6, 7),
  ('2017-10-12 12:35:20', 6, 1),
  ('2011-12-15 22:30:49', 7, 4),
  ('2012-03-17 14:56:41', 8, 4),
  ('2022-02-24 21:14:22', 9, 9),
  ('2015-12-13 08:30:22', 10, 3);

INSERT INTO dumbfy.followed_artists (user_id, artist_id)
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

CREATE TABLE dumbfy.fav_songs(
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES dumbfy.user (id),
    FOREIGN KEY (song_id) REFERENCES dumbfy.song (id)
) engine = InnoDB;

INSERT INTO dumbfy.fav_songs (user_id, song_id)
VALUES
    (1, 3),
    (1, 6),
    (1, 10),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 4),
    (4, 7),
    (5, 2),
    (5, 10),
    (8, 4),
    (9, 7),
    (10, 3);
