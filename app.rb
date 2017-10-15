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
  @artists = Artist.all()
  @oos_albums = Album.out_of_stock()
  @oos_artists = []
  for album in @oos_albums
    if @oos_albums.include?(album.artist_id())
      next
    else
      @oos_artists << album.artist_id()
    end
  end
  erb( :"out_of_stock/index" )
end
