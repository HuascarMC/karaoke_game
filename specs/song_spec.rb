require_relative('../song.rb')
require('minitest/autorun')
require('minitest/rg')

class TestSong < MiniTest::Test
  def setup
    @song01 = Song.new("Theme song", "Family Guy")
    @song02 = Song.new("Dancing Queen", "ABBA")
  end


end
