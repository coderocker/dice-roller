require './dice.rb'
class DiceRoller
  attr_reader :no_of_dice, :scores, :total
  attr_accessor :dices
  def initialize(dices = [])
    raise ArgumentError unless dices.is_a?(Array)
    @dices = dices
  end

  def roll_all
    @scores = @dices.map do |dice|
      dice.roll
    end
    @total = @scores.sum
  end

  def show_results
    @dices.each do |dice|
      p "Dice with sides #{dice.sides} has score #{dice.last_score}"
    end
    p "Total Score #{@total}"
  end
end



loop do
  trap("INT") { abort("\nThanks for rolling!")}
  p "Rolls dices example:  4d3 2d5 1d4.."
  input = gets.chomp.to_s
  abort("Thanks for rolling!") if input == "exit"


  dice_inputs = input.split
  dices = dice_inputs.flat_map do |dice_input|
    no_of_dice, sides = dice_input.tr("^0-9", " ").split
    no_of_dice.to_i.times.map do |i|
      Dice.new(sides.to_i)
    end
  end
  dr = DiceRoller.new(dices)
  dr.roll_all
  dr.show_results
end
