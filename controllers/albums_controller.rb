require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/genre')

# index
# new
# show
# edit
# create
# update
# delete

# get new album form
get '/big_als/albums/new' do
  @genres = Genre.all()
  @artists = Artist.all()
  erb( :"albums/new" )
end

# show album
# get '/big_als/album/:id' do
#   erb( :"albums/show" )
# end

# get edit album form
get '/big_als/albums/:id/edit' do
  @genres = Genre.all()
  @artists = Artist.all()
  @album = Album.find(params['id'])
  erb( :"albums/edit" )
end

# create album and save to db
post '/big_als/albums/new' do
  album = Album.new(params)
  album.save()
  redirect to( '/big_als' )
end

# update album
post '/big_als/albums/:id' do
  album = Album.new(params)
  album.update()
  redirect to( '/big_als' )
end

post '/big_als/albums/:id/delete' do
  album = Album.find(params['id'])
  album.delete()
  redirect to( '/big_als' )
end
