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
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  in_stock INT4,
  stock_level VARCHAR(20),
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  genre_id INT8 REFERENCES genres(id),
  artwork VARCHAR(255),
  buy_price FLOAT8 NOT NULL,
  original_sell_price FLOAT8 NOT NULL,
  discount FLOAT8,
  final_sell_price FLOAT8,
  profit FLOAT8
);


-- populate genres table
INSERT INTO genres (name) VALUES ('Unknown');
INSERT INTO genres (name) VALUES ('Alternative');
INSERT INTO genres (name) VALUES ('Blues');
INSERT INTO genres (name) VALUES ('Classical');
INSERT INTO genres (name) VALUES ('Country');
INSERT INTO genres (name) VALUES ('Dance');
INSERT INTO genres (name) VALUES ('Electronic');
INSERT INTO genres (name) VALUES ('Folk');
INSERT INTO genres (name) VALUES ('Grunge');
INSERT INTO genres (name) VALUES ('Hip-Hop / Rap');
INSERT INTO genres (name) VALUES ('Instrumental');
INSERT INTO genres (name) VALUES ('Jazz');
INSERT INTO genres (name) VALUES ('Opera');
INSERT INTO genres (name) VALUES ('Pop');
INSERT INTO genres (name) VALUES ('R & B Soul');
INSERT INTO genres (name) VALUES ('Reggae');
INSERT INTO genres (name) VALUES ('Rock');
INSERT INTO genres (name) VALUES ('Vocal');
INSERT INTO genres (name) VALUES ('World');
