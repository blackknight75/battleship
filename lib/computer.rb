require './lib/board'
class Computer
  attr_accessor :computer_board

  def initialize
    @computer_board = Board.new
  end

  def generate_ship_position
    alpha = ["A", "B", "C", "D"].sample
    number = ["1","2","3","4"].sample
    alpha + number
  end

  def input_position_generator(possible_position)
    position_split = possible_position.chars
    position = Array.new
    convert_position_to_integers(position, position_split)
    column = position_split[1].to_i
    position << column
    position
  end

  def convert_position_to_integers(position, position_split)
    row = 0 if position_split[0] == "A"
    row = 1 if position_split[0] == "B"
    row = 2 if position_split[0] == "C"
    row = 3 if position_split[0] == "D"
    position << row
  end

  def validate_ship_position(split_position, ship_length, ship)
    key_to_validate = Array.new
    (ship[1].length).times do |index|
      #check orientation
      key_to_validate << @computer_board.rows[split_position[0]][(split_position[1] + index)]
    end
    validate_key(key_to_validate, (ship[1].length))
    place_ship_on_board(split_position, ship)
  end

  def place_ship_on_board(split_position, ship)
    (ship[1].length).times do |index|
      @computer_board.rows[split_position[0]][(split_position[1] + index)] = "S"
    end
  end

  def convert_position_to_strings(split_position)
    binding.pry
    row = "A" if split_position[0] == 0
    row = "B" if split_position[0] == 1
    row = "C" if split_position[0] == 2
    row = "D" if split_position[0] == 3
    converted_string_position = row + split_position[1].to_s
    converted_string_position
  end

  def validate_key(key_to_validate, ship_length)
    passkey = generate_passkey(ship_length)
    if key_to_validate == passkey
      #place ship on computer ship board
    else
      place_ships
    end
  end

  def generate_passkey(ship_length)
    key = Array.new
    ship_length.times do
      key.push("")
    end
    key
  end

  def place_position_on_ship(possible_position, ship)
    binding.pry
    incremented_string = String.new

    (ship[1].length).times do |index|
      if index == 0
        ship[1][index] = possible_position
      else index != 0
        incremented_string = possible_position.next
        ship[1][index] = incremented_string
      end
    end
  end

  def place_ships
    possible_position = generate_ship_position
    @computer_board.ships.ships.each do |ship|
      ship_length = ship[1].length
      split_position = input_position_generator(possible_position)
      validate_ship_position(split_position, ship_length, ship)
      place_position_on_ship(possible_position, ship)
    end
  end

  def orientation_generator
    ["horizontal", "vertical"].sample
  end
  #NOT BEING USED
  # def make_possible_ship_location(ship, ship_length, possible_position)
  #   possible_ship_position = Array.new
  #   orientation = orientation_generator
  #
  #   ship_length.times do |index|
  #     if
  #       possible_ship_position << possible_position
  #     elsif index != 0 && orientation == "horizontal"
  #       ship[1][index] = split_position[0] + (horizontal_position_incrementor(index, split_position))
  #     end
  #   end
  # end
    #WORKS FOR GENERATING SHIP POSITIONS PAST STARTING POSITION
  # def computer_place_ships
  #   starting_position = generate_ship_position
  #   orientation = "h"
  #   @computer_board.ships.ships.each do |ship|
  #     ship_length = ship[1].length
  #     split_position = starting_position.chars
  #     ship_length.times do |index|
  #       if index == 0
  #         ship[1][index] = starting_position
  #       elsif index != 0 && orientation == "h"
  #         ship[1][index] = split_position[0] + (rw_calculator(index, split_position))
  #       end
  #     end
  #     starting_position = generate_ship_position
  #   end

  def horizontal_position_incrementor(index, string_position)
    binding.pry
    if index == 1
      index.times do |i|
      string_position[1].next!
      end
    elsif index == 2
      (index - 1).times do |i|
        string_position[1].next!
      end
    elsif index == 3
      (index - 2).times do |i|
        string_position[1].next!
      end
    elsif index == 4
      (index - 3).times do |i|
        string_position[1].next!
      end

    end
    string_position[1]
  end

  # def shot_position_locator(row, column)
  #   #check for ship
  #   @computer_board.rows[row][column] = "H".rjust(2, " ")
  # end

  def generate_board
    puts @computer_board.columns
    puts @computer_board.rows.join
  end
end
