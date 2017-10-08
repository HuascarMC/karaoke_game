require_relative('../bar.rb')
require('minitest/autorun')
require('minitest/rg')

class TestBar < MiniTest::Test
  def setup
    @bar = Bar.new()
  end

  def test_drink
    assert_equal(5, @bar.drinks[:tequila])
  end
end
