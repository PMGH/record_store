require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./controllers/albums_controller')
require_relative('./controllers/artists_controller')
require_relative('./models/artist')
require_relative('./models/album')


# get all artists and their albums
get '/big_als' do
  @artists = Artist.all()
  erb( :index )
end

# get all out of stock albums
get '/big_als/out_of_stock' do
  # get all artists
  @artists = Artist.all()
  # get all out of stock albums
  @oos_albums = Album.out_of_stock()
  # create empty array
  @oos_artists = []
  # for each out of stock album
  for album in @oos_albums
    # if the out of stock album array includes album's artist_id move to the next album (prevent duplicate artist entries)
    if @oos_albums.include?(album.artist_id())
      next
    else
      # if not, add the album's artist_id to the out of stock artist array
      @oos_artists << album.artist_id()
    end
  end
  erb( :"out_of_stock/index" )
end

# get all low stock albums
get '/big_als/low_stock' do
  @artists = Artist.all()
  @low_albums = Album.low_stock()
  @low_artists = []
  for album in @low_albums
    if @low_albums.include?(album.artist_id())
      next
    else
      @low_artists << album.artist_id()
    end
  end
  erb( :"low_stock/index" )
end

# get all high stock albums
get '/big_als/high_stock' do
  @artists = Artist.all()
  @high_albums = Album.high_stock()
  @high_artists = []
  for album in @high_albums
    if @high_albums.include?(album.artist_id())
      next
    else
      @high_artists << album.artist_id()
    end
  end
  erb( :"high_stock/index" )
end

# get all discounted albums
get '/big_als/discounted_stock' do
  @artists = Artist.all()
  @discounted_albums = Album.discounted()
  @discounted_artists = []
  for album in @discounted_albums
    if @discounted_albums.include?(album.artist_id())
      next
    else
      @discounted_artists << album.artist_id()
    end
  end
  erb( :"discounted_stock/index" )
end
