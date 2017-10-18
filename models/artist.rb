require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_reader :id, :name, :bio, :image

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @bio = options['bio']
    @image = options['image']
  end

  # CRUD

  def save()
    # check if @image is nil/empty string or doesn't exist
    if (@image == nil || @image == '' || File.exist?("public#{@image}") == false)
      # set @image equal to default
      @image = '/images/no_image_available.jpeg'
    end
    # save an artist to db
    sql = "INSERT INTO artists (name, bio, image) VALUES ($1, $2, $3) RETURNING id;"
    # values (instance variables)
    values = [@name, @bio, @image]
    # run sql and return id
    results = SqlRunner.run(sql, "save_artist", values)
    # set id
    @id = results[0]['id'].to_i
  end

  def self.all()
    # get all artists
    sql = "SELECT * FROM artists ORDER BY name ASC;"
    # values
    values = []
    # run sql ad return all artists
    results = SqlRunner.run(sql, "get_artists", values)
    # map results (create new artist objects)
    return results.map { |artist| Artist.new(artist) }
  end

  def self.find(id)
    # find a specific artist
    sql = "SELECT * FROM artists WHERE id = $1;"
    # values (id passed into function as argument)
    values = [id]
    # run sql and return artist
    artist = SqlRunner.run(sql, "get_artist", values).first()
    # create new Artist object
    return Artist.new(artist)
  end

  def update()
    # check if @image is nil/empty string or doesn't exist
    if (@image == nil || @image == '' || File.exist?("public#{@image}") == false)
      # set @image equal to default
      @image = '/images/no_image_available.jpeg'
    end
    # update an artist in db
    sql = "UPDATE artists SET (name, bio, image) = ($1, $2, $3) WHERE id = $4;"
    # values (instance variables)
    values = [@name, @bio, @image, @id]
    # run update sql
    SqlRunner.run(sql, "update_artist", values)
  end

  def self.delete_all()
    # clear all artists from db (e.g. test data before go-live)
    sql = "DELETE FROM artists;"
    # values
    values = []
    # run delete_all sql
    SqlRunner.run(sql, "delete_artists", values)
  end

  def delete()
    # delete a specific artist from db
    sql = "DELETE FROM artists WHERE id = $1;"
    # values (instance @id)
    values = [@id]
    # run delete sql
    SqlRunner.run(sql, "delete_artist", values)
  end

  # Other behaviour

  def albums()
    # get all albums by this artist from db
    sql = "SELECT * FROM albums WHERE artist_id = $1 ORDER BY in_stock ASC;"
    # values (instance @id)
    values = [@id]
    # run albums sql
    albums = SqlRunner.run(sql, "get_artist_albums", values)
    # map albums (create new album objects)
    return albums.map { |album| Album.new(album) }
  end

end
