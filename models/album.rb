require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_reader :id, :title, :in_stock, :stock_level, :artist_id, :genre_id, :artwork

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @in_stock = options['in_stock'].to_i
    @stock_level = set_stock_level()
    @artist_id = options['artist_id'].to_i
    @genre_id = options['genre_id']
    @artwork = options['artwork']
  end

  # CRUD

  def save()
    # check if @artwork is nil
    if (@artwork == nil || @artwork == '')
      # set @artwork equal to default value
      @artwork = '/images/no_image_available.jpeg'
    end
    # values (instance variables)
    values = [@title, @in_stock, @stock_level, @artist_id, @genre_id, @artwork]
    # save an album to db
    sql = "INSERT INTO albums (title, in_stock, stock_level, artist_id, genre_id, artwork) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;"
    # run sql and return id
    results = SqlRunner.run(sql, "save_album", values)
    # set @id equal to the returned id
    @id = results[0]['id'].to_i
  end

  def self.all()
    # get all albums
    sql = "SELECT * FROM albums;"
    values = []
    results = SqlRunner.run(sql, "get_albums", values)
    return results.map { |album| Album.new(album) }
  end

  def self.find(id)
    # find a specific album
    sql = "SELECT * FROM albums WHERE id = $1;"
    values = [id]
    album = SqlRunner.run(sql, "get_album", values).first()
    return Album.new(album)
  end

  def update()
    # check if @artwork is nil
    if (@artwork == nil || @artwork == '')
      # set @artwork equal to default value
      @artwork = '/images/no_image_available.jpeg'
    end
    # update an album in db
    sql = "UPDATE albums SET (title, in_stock, stock_level, artist_id, genre_id, artwork) = ($1, $2, $3, $4, $5, $6) WHERE id = $7;"
    values = [@title, @in_stock, @stock_level, @artist_id, @genre_id, @artwork, @id]
    SqlRunner.run(sql, "update_album", values)
  end

  def self.delete_all()
    # clear all albums from db (e.g. test data before go-live)
    sql = "DELETE FROM albums;"
    values = []
    SqlRunner.run(sql, "delete_albums", values)
  end

  def delete()
    # delete a specific album from db
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_album", values)
  end

  # Other behaviour

  def set_stock_level()
    # set stock level based on @in_stock value
    case @in_stock
    when 0
      return "Out of stock"
    when (1..5)
      return "Low"
    when (6..15)
      return "Medium"
    else
      return "High"
    end

  end

  def artist()
    # get the artist of the album
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    artist = SqlRunner.run(sql, "get_album_artist", values).first()
    return Artist.new(artist)
  end

  def self.out_of_stock()
    # get out of stock albums from db
    sql = "SELECT * FROM albums WHERE stock_level = $1;"
    values = ["Out of stock"]
    results = SqlRunner.run(sql, "get_out_of_stock", values)
    return results.map { |album| Album.new(album) }
  end

  def self.low_stock()
    # get out of stock albums from db
    sql = "SELECT * FROM albums WHERE stock_level = $1;"
    values = ["Low"]
    results = SqlRunner.run(sql, "get_low_stock", values)
    return results.map { |album| Album.new(album) }
  end

  def self.high_stock()
    # get out of stock albums from db
    sql = "SELECT * FROM albums WHERE stock_level = $1;"
    values = ["High"]
    results = SqlRunner.run(sql, "get_high_stock", values)
    return results.map { |album| Album.new(album) }
  end

  def genre()
    # get the album genre
    sql = "SELECT * FROM genres WHERE id = $1;"
    values = [@genre_id]
    genre = SqlRunner.run(sql, "get_genre", values).first()
    return Genre.new(genre)
  end

end
