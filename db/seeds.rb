require('pry-byebug')
require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()

# create and save artist/s
artist1 = Artist.new({ 'name' => 'Pearl Jam' })

artist2 = Artist.new({ 'name' => 'Arcane Roots' })

artist3 = Artist.new({ 'name' => 'Pantera' })

artist4 = Artist.new({ 'name' => 'Jimmy Eat World' })

artist5 = Artist.new({ 'name' => 'Alice In Chains' })

artist6 = Artist.new({ 'name' => 'Sting' })

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()
artist6.save()


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

album11 = Album.new({ 'title' => 'Blood and Chemistry', 'in_stock' => 2, 'artist_id' => artist2.id() })

album12 = Album.new({ 'title' => 'Melancholia Hymns', 'in_stock' => 10, 'artist_id' => artist2.id() })

album13 = Album.new({ 'title' => 'Cowboys From Hell', 'in_stock' => 0, 'artist_id' => artist3.id() })

album14 = Album.new({ 'title' => 'Unplugged', 'in_stock' => 20, 'artist_id' => artist5.id() })

album15 = Album.new({ 'title' => 'Left Fire', 'in_stock' => 8, 'artist_id' => artist2.id() })

album16 = Album.new({ 'title' => '57TH & 9TH', 'in_stock' => 10, 'artist_id' => artist6.id() })

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
album13.save()
album14.save()
album15.save()
album16.save()

binding.pry
nil
