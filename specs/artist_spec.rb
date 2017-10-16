require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../db/sql_runner')
require_relative('../models/artist')


class TestArtist < MiniTest::Test

  def setup()
    @artist1 = Artist.new({ 'name' => 'Pearl Jam',
      'bio' => 'Pearl Jam is an American rock band formed in Seattle, Washington, in 1990. Since its inception, the band\'s line-up has consisted of Eddie Vedder (lead vocals), Mike McCready (lead guitar), Stone Gossard (rhythm guitar) and Jeff Ament (bass). The band\'s fifth member is drummer Matt Cameron (also of Soundgarden), who has been with the band since 1998. Boom Gaspar (piano) has also been a session/touring member with the band since 2002.',
      'image' => '/images/pearl_jam.jpg'
      })
    @artist1.save()
  end

  def test_name()
    # arrange
    expected = "Pearl Jam"
    # act
    actual = @artist1.name()
    # assert
    assert_equal(expected, actual)
  end

  def test_bio()
    expected = 'Pearl Jam is an American rock band formed in Seattle, Washington, in 1990. Since its inception, the band\'s line-up has consisted of Eddie Vedder (lead vocals), Mike McCready (lead guitar), Stone Gossard (rhythm guitar) and Jeff Ament (bass). The band\'s fifth member is drummer Matt Cameron (also of Soundgarden), who has been with the band since 1998. Boom Gaspar (piano) has also been a session/touring member with the band since 2002.'

    actual = @artist1.bio()

    assert_equal(expected, actual)
  end

  def test_image()
    expected = '/images/pearl_jam.jpg'

    actual = @artist1.image()

    assert_equal(expected, actual)
  end

end
