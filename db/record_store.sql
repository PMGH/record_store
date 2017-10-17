DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  bio TEXT,
  image TEXT
);

CREATE TABLE genres(
  id SERIAL8 PRIMARY KEY,
  genre VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  in_stock INT4,
  stock_level VARCHAR(20),
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  genre INT8 REFERENCES genres(id),
  artwork VARCHAR(255)
);


-- populate genres table
INSERT INTO genres (genre) VALUES ('Alternative');
INSERT INTO genres (genre) VALUES ('Blues');
INSERT INTO genres (genre) VALUES ('Classical');
INSERT INTO genres (genre) VALUES ('Country');
INSERT INTO genres (genre) VALUES ('Dance');
INSERT INTO genres (genre) VALUES ('Electronic');
INSERT INTO genres (genre) VALUES ('Folk');
INSERT INTO genres (genre) VALUES ('Grunge');
INSERT INTO genres (genre) VALUES ('Hip-Hop / Rap');
INSERT INTO genres (genre) VALUES ('Instrumental');
INSERT INTO genres (genre) VALUES ('Jazz');
INSERT INTO genres (genre) VALUES ('Opera');
INSERT INTO genres (genre) VALUES ('Pop');
INSERT INTO genres (genre) VALUES ('R & B Soul');
INSERT INTO genres (genre) VALUES ('Reggae');
INSERT INTO genres (genre) VALUES ('Rock');
INSERT INTO genres (genre) VALUES ('Vocal');
INSERT INTO genres (genre) VALUES ('World');
