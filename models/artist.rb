require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # CRUD

  def save()
    # save an artist to db
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    results = SqlRunner.run(sql, "save_artist", values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    # get all artists
    sql = "SELECT * FROM artists;"
    values = []
    results = SqlRunner.run(sql, "get_artists", values)
    return results.map { |artist| Artist.new(artist) }
  end

  def self.find(id)
    # find a specific artist
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [id]
    artist = SqlRunner.run(sql, "get_artist", values).first()
    return Artist.new(artist)
  end

  def update()
    # update an artist in db
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, "update_artist", values)
  end

  def self.delete_all()
    # clear all artists from db (e.g. test data before go-live)
    sql = "DELETE FROM artists;"
    values = []
    SqlRunner.run(sql, "delete_artists", values)
  end

  def delete()
    # delete a specific artist from db
    sql = "DELETE FROM artists WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_artist", values)
  end

  # Other behaviour

  def albums()
    # get all albums by this artist from db
    sql = "SELECT * FROM albums WHERE artist_id = $1 ORDER BY in_stock ASC;"
    values = [@id]
    albums = SqlRunner.run(sql, "get_artist_albums", values)
    return albums.map { |album| Album.new(album) }
  end

end
