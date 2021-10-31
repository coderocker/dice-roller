class Dice
  attr_reader :sides, :last_score
  def initialize(sides = 1)
    raise ArgumentError unless sides.is_a?(Integer)
    @sides = sides == 0 ? 1 : sides
    @last_score = 0
  end

  def roll
    @last_score = rand(1..@sides.to_i)
  end
end
