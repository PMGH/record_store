require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/artist')

# index
# new
# show
# edit
# create
# update
# delete

# add new artist
get '/big_als/artists/new' do
  erb( :"artists/new" )
end

# show artist
# get '/big_als/artist/:id' do
#   erb( :"artists/show" )
# end

# edit artist
get '/big_als/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb( :"artists/edit" )
end

# create new artist and commit to db
post '/big_als/artists/new' do
  artist = Artist.new(params)
  artist.save()
  erb( :"artists/create" )
end

# update existing artist
post '/big_als/artists/:id' do
  artist = Artist.new(params)
  artist.update()
  erb ( :"artists/update" )
end

# delete existing artist
post '/big_als/artists/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete()
  erb ( :"artists/delete" )
end
