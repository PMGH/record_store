require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

# require_relative('./controllers/albums_controller')
# require_relative('./controllers/artists_controller')
require_relative('./models/artist')
require_relative('./models/album')


get '/big_als' do
  @artists = Artist.all()
  erb( :index )
end
