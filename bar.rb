class Bar
  attr_accessor :drinks, :till, :drinks_sold

  def initialize
    @drinks = {
      :tequila => 5,
      :rum => 3,
      :beer => 2,
      :vodka => 3
    }
    @till = 0
    @drinks_sold = 0
  end


end
