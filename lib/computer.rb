require './lib/board'
class Computer
  attr_accessor :computer_board

  def initialize
    @computer_board = Board.new
  end

  def generate_ship_position
    alpha = ["A", "B", "C", "D"].sample
    number = ["1","2","3","4"].sample
    position = alpha + number
    @computer_board.input_position_generator(position)
    position
  end

  def computer_place_ships
    starting_position = generate_ship_position
    orientation = "h"
    @computer_board.ships.ships.each do |ship|
      ship_length = ship[1].length
      split_position = starting_position.chars
      ship_length.times do |index|
        if index == 0
          ship[1][index] = starting_position
        elsif index != 0 && orientation == "h"
          ship[1][index] = split_position[0] + (row_calculator(index, split_position))
        end
      end
      starting_position = generate_ship_position
    end
  end

  def row_calculator(index, split_position)
    if index == 1
      index.times do |i|
      split_position[1].next!
      end
    elsif index == 2
      (index - 1).times do |i|
        split_position[1].next!
      end
    elsif index == 3
      (index - 2).times do |i|
        split_position[1].next!
      end
    elsif index == 4
      (index - 3).times do |i|
        split_position[1].next!
      end

    end
    split_position[1]
  end

  # def shot_position_locator(first, second)
  #   #check for ship
  #   @computer_board.rows[first][second] = "H".rjust(2, " ")
  # end

  def generate_board
    puts @computer_board.columns
    puts @computer_board.rows.join
  end
end
