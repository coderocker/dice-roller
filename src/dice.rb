class Dice
  attr_reader :sides
  def initialize(sides = 1)
    raise ArgumentError unless sides.is_a?(Integer)
    @sides = sides == 0 ? 1 : sides
  end

  def roll
    rand(1..@sides.to_i)
  end
end
