require('pry-byebug')
require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()

# create and save artist/s
artist1 = Artist.new({ 'name' => 'Pearl Jam',
  'bio' => 'Pearl Jam is an American rock band formed in Seattle, Washington, in 1990. Since its inception, the band\'s line-up has consisted of Eddie Vedder (lead vocals), Mike McCready (lead guitar), Stone Gossard (rhythm guitar) and Jeff Ament (bass). The band\'s fifth member is drummer Matt Cameron (also of Soundgarden), who has been with the band since 1998. Boom Gaspar (piano) has also been a session/touring member with the band since 2002.',
  'image' => '/images/artists/pearl_jam.jpg'
  })

artist2 = Artist.new({ 'name' => 'Arcane Roots',
  'bio' => 'Arcane Roots are a three-piece alternative rock band from Kingston Upon Thames, England. Founded by guitarist and vocalist Andrew Groves and former drummer Daryl Atkins, the band is known for their energetic live shows, and incorporating progressive music, math rock and indie rock into a popular song format.',
  'image' => '/images/artists/arcane_roots.jpg'
  })

artist3 = Artist.new({ 'name' => 'Pantera',
  'bio' => 'Pantera was an American heavy metal band from Arlington, Texas. The group was formed in 1981 by the Abbott brothers – drummer Vinnie Paul and guitarist Dimebag Darrell – along with lead vocalist Terry Glaze. Bassist Rex Brown joined the band the following year, replacing Tommy D. Bradford, who was the unofficial original.',
  'image' => '/images/artists/pantera.jpg'
  })

artist4 = Artist.new({ 'name' => 'Jimmy Eat World',
  'bio' => 'Jimmy Eat World is an American rock band from Mesa, Arizona, that formed in 1993. The band is composed of vocalist and lead guitarist Jim Adkins, rhythm guitarist and vocalist Tom Linton, bassist Rick Burch and drummer Zach Lind. As of October 2016, Jimmy Eat World have released nine studio albums, the last eight featuring the current lineup.',
  'image' => '/images/artists/jimmy_eat_world.png'
  })

artist5 = Artist.new({ 'name' => 'Alice In Chains',
  'bio' => 'Alice in Chains is an American rock band formed in Seattle, Washington, in 1987 by guitarist/vocalist Jerry Cantrell and drummer Sean Kinney, who then recruited bassist Mike Starr and lead vocalist Layne Staley. Mike Starr was replaced in 1993 by Mike Inez.',
  'image' => '/images/artists/alice_in_chains.jpg'
  })

artist6 = Artist.new({ 'name' => 'Sting',
  'bio' => 'Gordon Matthew Thomas Sumner, CBE (born 2 October 1951), better known by his stage name Sting, is an English musician, singer, songwriter and actor. He was the principal songwriter, lead singer, and bassist for the new wave rock band The Police from 1977 to 1986, and also launched a solo career in 1985.',
  'image' => '/images/artists/sting.jpeg'
  })

artist7 = Artist.new({ 'name' => 'Daft Punk',
  'bio' => 'Daft Punk are a French electronic music duo formed in 1993 by Guy-Manuel de Homem-Christo and Thomas Bangalter. The duo achieved significant popularity in the late 1990s as part of the French house movement and had continuous success in the years following, combining elements of house music with funk, techno, disco, rock and synthpop influences.'
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()
artist6.save()
artist7.save()


# create and save albums
album1 = Album.new({ 'title' => 'Ten', 'in_stock' => 0, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => "/images/albums/ten.jpg" })

album2 = Album.new({ 'title' => 'Vs.', 'in_stock' => 1, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/vs.jpg' })

album3 = Album.new({ 'title' => 'Vitalogy', 'in_stock' => 3, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/vitalogy.jpg' })

album4 = Album.new({ 'title' => 'No Code', 'in_stock' => 5, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/no_code.jpg' })

album5 = Album.new({ 'title' => 'Yield', 'in_stock' => 6, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/yield.jpg' })

album6 = Album.new({ 'title' => 'Binaural', 'in_stock' => 10, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/binaural.jpg' })

album7 = Album.new({ 'title' => 'Riot Act', 'in_stock' => 15, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/riot_act.jpg' })

album8 = Album.new({ 'title' => 'Pearl Jam', 'in_stock' => 16, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/pearl_jam.jpeg' })

album9 = Album.new({ 'title' => 'Backspacer', 'in_stock' => 5, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/backspacer.jpg' })

album10 = Album.new({ 'title' => 'Lightning Bolt', 'in_stock' => 0, 'artist_id' => artist1.id(), 'genre_id' => 16, 'artwork' => '/images/albums/lightning_bolt.jpg' })

album11 = Album.new({ 'title' => 'Blood and Chemistry', 'in_stock' => 2, 'artist_id' => artist2.id(), 'genre_id' => 16, 'artwork' => '/images/albums/blood_and_chemistry.jpeg' })

album12 = Album.new({ 'title' => 'Melancholia Hymns', 'in_stock' => 10, 'artist_id' => artist2.id(), 'genre_id' => 16, 'artwork' => '/images/albums/melancholia_hymns.jpg' })

album13 = Album.new({ 'title' => 'Cowboys From Hell', 'in_stock' => 0, 'artist_id' => artist3.id(), 'genre_id' => 16, 'artwork' => '/images/albums/cowboys_from_hell.jpg' })

album14 = Album.new({ 'title' => 'Unplugged', 'in_stock' => 20, 'artist_id' => artist5.id(), 'genre_id' => 8, 'artwork' => '/images/albums/unplugged.jpeg' })

album15 = Album.new({ 'title' => 'Left Fire', 'in_stock' => 8, 'artist_id' => artist2.id(), 'genre_id' => 16, 'artwork' => '/images/albums/left_fire.jpg' })

album16 = Album.new({ 'title' => '57TH & 9TH', 'in_stock' => 10, 'artist_id' => artist6.id(), 'genre_id' => 16, 'artwork' => '/images/albums/57th_and_9th.jpg' })

album17 = Album.new({ 'title' => 'The Last Ship', 'in_stock' => 4, 'artist_id' => artist6.id(), 'genre_id' => 16 })

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
album17.save()

binding.pry
nil
