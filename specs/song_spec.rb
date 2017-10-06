require_relative('../song.rb')
require('minitest/autorun')
require('minitest/rg')

class TestSong < MiniTest::Test
  def setup
    @song01 = Song.new("Theme song", "Family Guy")
    @song02 = Song.new("Dancing Queen", "ABBA")
  end

  def test_song_name
    assert_equal("Theme song", @song01.name)
  end

  def test_song_author
    assert_equal("ABBA", @song02.author)
  end

end
