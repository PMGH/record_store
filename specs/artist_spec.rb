require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../db/sql_runner')
require_relative('../models/artist')


class TestArtist < MiniTest::Test

  def setup()
    @artist1 = Artist.new({'name' => 'Pearl Jam'})
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

end
