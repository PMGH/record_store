DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  bio TEXT,
  image TEXT
);

CREATE TABLE albums(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  in_stock INT4,
  stock_level VARCHAR(20),
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  genre VARCHAR(255),
  artwork VARCHAR(255)
);
