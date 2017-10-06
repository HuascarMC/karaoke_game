require_relative('../bar.rb')
require('minitest/autorun')
require('minitest/rg')

class TestBar < MiniTest::Test
  def setup
    @bar = Bar.new()
  end


end
