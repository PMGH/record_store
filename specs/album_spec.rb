require('minitest/autorun')
require('minitest/rg')

require_relative('../models/album')
require_relative('../models/artist')
require_relative('../db/sql_runner')

class TestAlbum < MiniTest::Test

  def setup()
    Album.delete_all()
    Artist.delete_all()

    # create and save artist/s
    @artist1 = Artist.new( 'name' => 'Pearl Jam' )
    @artist1.save()

    # create and save albums
    @album1 = Album.new({ 'title' => 'Ten', 'in_stock' => 0, 'artist_id' => @artist1.id(), 'genre_id' => 16, 'artwork' => "/images/albums/ten.jpg", 'buy_price' => 5.00, 'original_sell_price' => 7.99 })

    @album2 = Album.new({ 'title' => 'Ten', 'in_stock' => 1, 'artist_id' => @artist1.id(), 'buy_price' => 5.00, 'original_sell_price' => 7.99 })

    @album3 = Album.new({ 'title' => 'Ten', 'in_stock' => 3, 'artist_id' => @artist1.id(), 'buy_price' => 5.00, 'original_sell_price' => 8, 'discount_multiplier' => 0.5 })

    @album4 = Album.new({ 'title' => 'Ten', 'in_stock' => 5, 'artist_id' => @artist1.id(), 'buy_price' => 5.00, 'original_sell_price' => 7.99 })

    @album5 = Album.new({ 'title' => 'Ten', 'in_stock' => 6, 'artist_id' => @artist1.id(), 'buy_price' => 5.00, 'original_sell_price' => 7.99 })

    @album6 = Album.new({ 'title' => 'Ten', 'in_stock' => 10, 'artist_id' => @artist1.id(), 'buy_price' => 5.00, 'original_sell_price' => 7.99 })

    @album7 = Album.new({ 'title' => 'Ten', 'in_stock' => 15, 'artist_id' => @artist1.id(), 'buy_price' => 5.00, 'original_sell_price' => 7.99 })

    @album8 = Album.new({ 'title' => 'Ten', 'in_stock' => 16, 'artist_id' => @artist1.id(), 'buy_price' => 5.00, 'original_sell_price' => 7.99 })

    @album9 = Album.new({ 'title' => 'Ten', 'in_stock' => 30, 'artist_id' => @artist1.id(), 'buy_price' => 5.00, 'original_sell_price' => 7.99 })

    @album1.save()
    @album2.save()
    @album3.save()
    @album4.save()
    @album5.save()
    @album6.save()
    @album7.save()
    @album8.save()
    @album9.save()
  end

  def test_title()
    expected = "Ten"

    actual = @album1.title()

    assert_equal(expected, actual)
  end

  def test_in_stock()
    expected = 0

    actual = @album1.in_stock()

    assert_equal(expected, actual)
  end

  def test_artist_id()
    expected = @artist1.id()

    actual = @album1.artist_id()

    assert_equal(expected, actual)


    expected = @artist1.id()

    actual = @album3.artist_id()

    assert_equal(expected, actual)
  end

  def test_set_stock_level__out_of_stock()
    # arrange
    expected = "Out of stock"
    # act
    actual = @album1.stock_level()
    # assert
    assert_equal(expected, actual)
  end

  def test_set_stock_level__low_stock()
    # arrange
    expected = "Low"

    # check lower extreme
    actual = @album2.stock_level()
    assert_equal(expected, actual)

    # check middle of range
    actual = @album3.stock_level()
    assert_equal(expected, actual)

    # check upper extreme
    actual = @album4.stock_level()
    assert_equal(expected, actual)
  end

  def test_set_stock_level__medium_stock()
    # arrange
    expected = "Medium"

    # check lower extreme
    actual = @album5.stock_level()
    assert_equal(expected, actual)

    # check middle of range
    actual = @album6.stock_level()
    assert_equal(expected, actual)

    # check upper extreme
    actual = @album7.stock_level()
    assert_equal(expected, actual)
  end

  def test_set_stock_level__high_stock()
    # arrange
    expected = "High"

    # check lower extreme
    actual = @album8.stock_level()
    assert_equal(expected, actual)

    # check other value in high range
    actual = @album9.stock_level()
    assert_equal(expected, actual)
  end

  def test_genre_id()
    expected = 16

    actual = @album1.genre_id()

    assert_equal(expected, actual)
  end

  def test_artwork()
    expected = "/images/albums/ten.jpg"

    actual = @album1.artwork()

    assert_equal(expected, actual)
  end

  def test_buy_price()
    expected = 5.00

    actual = @album2.buy_price()

    assert_equal(expected, actual)
  end

  def test_original_sell_price()
    expected = 7.99

    actual = @album2.original_sell_price()

    assert_equal(expected, actual)
  end

  def test_discount_multiplier__given()
    expected = 0.5

    actual = @album3.discount_multiplier()

    assert_equal(expected, actual)
  end

  def test_discount_multiplier__not_given()
    expected = 1

    actual = @album2.discount_multiplier()

    assert_equal(expected, actual)
  end

  def test_final_sell_price()
    expected = 4

    actual = @album3.final_sell_price()

    assert_equal(expected, actual)
  end

end
