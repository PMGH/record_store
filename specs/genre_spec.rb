require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../db/sql_runner')
require_relative('../models/genre')


class TestGenre < MiniTest::Test

  def test_self_all()
    # arrange
    expected = 18
    # act
    actual = Genre.all().length()
    # assert
    assert_equal(expected, actual)
  end

end
