require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_accessor :title, :in_stock, :stock_level, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @in_stock = options['in_stock'].to_i
    @stock_level = set_stock_level()
    @artist_id = options['artist_id'].to_i
  end

  # CRUD

  def save()
    # save an album to db
    sql = "INSERT INTO albums (title, in_stock, stock_level, artist_id) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@title, @in_stock, @stock_level, @artist_id]
    results = SqlRunner.run(sql, "save_album", values)
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
    # update an album in db
    sql = "UPDATE albums SET (title, in_stock, stock_level, artist_id) = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@title, @in_stock, @stock_level, @artist_id, @id]
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

  # def artist()
  #   # get the artist of the album
  #   sql = "SELECT * FROM artists WHERE id = $1;"
  #   values = [@artist_id]
  #   artist = SqlRunner.run(sql, "get_album_artist", values).first()
  #   return Artist.new(artist)
  # end
  #
  # def out_of_stock()
  #   # get out of stock albums from db
  #   sql = "SELECT * FROM albums WHERE stock_level = $1;"
  #   values = ["Out of stock"]
  #   results = SqlRunner.run(sql, "get_out_of_stock", values)
  #   return results.map { |album| Album.new(album) }
  # end
  #
  # def low_stock()
  #   # get out of stock albums from db
  #   sql = "SELECT * FROM albums WHERE stock_level = $1;"
  #   values = ["Low"]
  #   results = SqlRunner.run(sql, "get_low_stock", values)
  #   return results.map { |album| Album.new(album) }
  # end
  #
  # def high_stock()
  #   # get out of stock albums from db
  #   sql = "SELECT * FROM albums WHERE stock_level = $1;"
  #   values = ["High"]
  #   results = SqlRunner.run(sql, "get_high_stock", values)
  #   return results.map { |album| Album.new(album) }
  # end

end
