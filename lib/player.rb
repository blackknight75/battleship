require './lib/board'
require './lib/validator'
class Player
  attr_accessor :board, :shot_board

  def initialize
    @board = Board.new
    @shot_board = Board.new
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
      @shot_board.columns = @shot_board.columns[0..8]
      @shot_board.rows = @shot_board.rows[0..3]
    elsif difficulty == "i" || difficulty == "intermediate"
    elsif difficulty == "h" || difficulty == "hard"
    end
  end

  def generate_ship_board
    puts @board.columns
    puts @board.rows.join
  end

  def generate_shot_board
    puts @shot_board.columns
    puts @shot_board.rows.join
  end
end
