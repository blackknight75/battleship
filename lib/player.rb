require './lib/board'
require './lib/validator'
class Player
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  #if "B" load grid and ships for beginner difficulty
  #if "I" load grid and ships for intermediate difficulty
  #if "H" load grid and ships for Hard  difficulty

  def place_ship
    @board.ships.ships.each do |ship|
      ship_length = ship[1].length
      Validator.validate_ship_position(ship, board)
    end
  end

  def generate_board_based_on_difficulty(difficulty)
    if difficulty == "b" || difficulty == "beginner"
      @board.columns = @board.columns[0..8]
      @board.rows = @board.rows[0..3]
      @board.ships.ships = @board.ships.ships[0..1]
    elsif difficulty == "i" || difficulty == "intermediate"
    elsif difficulty == "h" || difficulty == "hard"
    end
  end

  def generate_board
    puts @board.columns
    puts @board.rows.join
  end
end
