require './lib/board'
require './lib/validator'
class Computer
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def place_ship
    @board.ships.ships.each do |ship|
      Validator.validate_computer_ship_position(ship, board)
    end
  end

  def generate_board_based_on_difficulty(difficulty)
    if difficulty == "b" || difficulty == "beginner"
      four_by_four
    elsif difficulty == "i" || difficulty == "intermediate"
      eight_by_eight
    elsif difficulty == "h" || difficulty == "hard"
      twelve_by_twelve
    end
  end

  def four_by_four
    @board.columns = @board.columns[0..8]
    @board.rows = @board.rows[0..3]
    @board.ships.ships = @board.ships.ships[0..1]
  end

  def eight_by_eight
    @board.columns = @board.columns[0..16]
    @board.rows = @board.rows[0..7]
    @board.ships.ships = @board.ships.ships[0..2]
  end

  def twelve_by_twelve
    @board.columns = @board.columns
    @board.rows = @board.rows
    @board.ships.ships = @board.ships.ships
  end

  def generate_board
    puts @board.columns
    puts @board.rows.join
  end
end
