require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/artist')

# add new artist
get '/big_als/artist/new' do
  erb( :"artists/new" )
end

# edit artist
# get '/big_als/artist/:id/edit' do
#   erb( :"artists/edit" )
# end

# show artist
# get '/big_als/artist/:id' do
#   erb( :"artists/show" )
# end

post '/big_als/artist/new' do
  artist = Artist.new(params)
  artist.save()
  erb( :"artists/create" )
end
