require('pry-byebug')

require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()

# create and save artist/s
artist1 = Artist.new( 'name' => 'Pearl Jam' )
artist1.save()
artist2 = Artist.new( 'name' => 'Arcane Roots' )
artist2.save()

# create and save albums
album1 = Album.new({ 'title' => 'Ten', 'in_stock' => 0, 'artist_id' => artist1.id() })
album2 = Album.new({ 'title' => 'Vs.', 'in_stock' => 1, 'artist_id' => artist1.id() })
album3 = Album.new({ 'title' => 'Vitalogy', 'in_stock' => 3, 'artist_id' => artist1.id() })
album4 = Album.new({ 'title' => 'No Code', 'in_stock' => 5, 'artist_id' => artist1.id() })
album5 = Album.new({ 'title' => 'Yield', 'in_stock' => 6, 'artist_id' => artist1.id() })
album6 = Album.new({ 'title' => 'Binaural', 'in_stock' => 10, 'artist_id' => artist1.id() })
album7 = Album.new({ 'title' => 'Riot Act', 'in_stock' => 15, 'artist_id' => artist1.id() })
album8 = Album.new({ 'title' => 'Pearl Jam', 'in_stock' => 16, 'artist_id' => artist1.id() })
album9 = Album.new({ 'title' => 'Backspacer', 'in_stock' => 5, 'artist_id' => artist1.id() })
album10 = Album.new({ 'title' => 'Lightning Bolt', 'in_stock' => 0, 'artist_id' => artist1.id() })
album11 = Album.new({ 'title' => 'Blood and Chemistry', 'in_stock' => 2, 'artist_id' => artist1.id() })
album12 = Album.new({ 'title' => 'Melancholia Hymns', 'in_stock' => 10, 'artist_id' => artist1.id() })
album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()
album7.save()
album8.save()
album9.save()
album10.save()
album11.save()
album12.save()

binding.pry
nil
