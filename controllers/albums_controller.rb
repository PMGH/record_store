require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/album')

get '/big_als/albums/new' do
  @artists = Artist.all()
  erb( :"albums/new" )
end

post '/big_als/albums/new' do
  album = Album.new(params)
  album.save()
  erb( :"albums/create" )
end
