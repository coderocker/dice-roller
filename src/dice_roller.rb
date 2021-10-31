class DiceRoller
  attr_reader :no_of_dice, :dices, :scores, :total

  def initialize(no_of_dice = 1, sides =1)
    raise ArgumentError unless no_of_dice.is_a?(Integer)
    raise ArgumentError unless sides.is_a?(Integer)
    @no_of_dice = no_of_dice == 0 ? 1 : no_of_dice
    instanciate_dices
  end

  def roll_all
    @scores = @dices.map do |dice|
      dice.roll
    end
    @total = @scores.sum
  end

  def show_results
    p "all scores" + @scores.to_s
    p "total score" + @total
  end

  private
  def instanciate_dices
    @dices = []
    @no_of_dice.times do
      @dices.push(new Dice(sides))
    end
  end
end
