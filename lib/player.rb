require './lib/board'
require './lib/validator'
class Player
  attr_accessor :board, :shot_board

  def initialize
    @board = Board.new
    @shot_board = Board.new
  end

  def place_ship(input_position, player_ship_orientation)
    @board.ships.ships.each do |ship|
      ship_position = input_position
      orientation = player_ship_orientation
      # ship_length = ship[1].length
      Validator.validate_player_ship_position(ship, board, ship_position, orientation)
      puts `clear`
      Phrases.battleship_banner
      Battleship.player_interface
      ship_position = gets.chomp.upcase
      orientation   = gets.chomp
      Phrases.position_error(ship_position)
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
    @shot_board.columns = @shot_board.columns[0..8]
    @shot_board.rows = @shot_board.rows[0..3]
  end

  def eight_by_eight
    @board.columns = @board.columns[0..16]
    @board.rows = @board.rows[0..7]
    @board.ships.ships = @board.ships.ships[0..2]
    @shot_board.columns = @shot_board.columns[0..16]
    @shot_board.rows = @shot_board.rows[0..7]
  end

  def twelve_by_twelve
    @board.columns = @board.columns
    @board.rows = @board.rows
    @board.ships.ships = @board.ships.ships
    @shot_board.columns = @shot_board.columns
    @shot_board.rows = @shot_board.rows
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
