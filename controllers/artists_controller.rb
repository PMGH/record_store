require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/artist')

# add new artist
get '/big_als/artists/new' do
  erb( :"artists/new" )
end

# edit artist
get '/big_als/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb( :"artists/edit" )
end

# show artist
# get '/big_als/artist/:id' do
#   erb( :"artists/show" )
# end

# create new artist and commit to db
post '/big_als/artists/new' do
  artist = Artist.new(params)
  artist.save()
  erb( :"artists/create" )
end

post '/big_als/artists/:id' do
  artist = Artist.new(params)
  artist.update()
  erb ( :"artists/update" )
end
