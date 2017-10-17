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
