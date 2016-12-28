require './lib/computer'
class Validator
  def self.generate_ship_position
    alpha = ["A", "B", "C", "D"].sample
    number = ["1","2","3","4"].sample
    alpha + number
  end

  def self.input_position_generator(possible_position)
    position_split = possible_position.chars
    position = Array.new
    Validator.convert_position_to_integers(position, position_split)
    column = position_split[1].to_i
    position << column
    position
  end

  def self.convert_position_to_integers(position, position_split)
    row = 0  if position_split[0] == "A"
    row = 1  if position_split[0] == "B"
    row = 2  if position_split[0] == "C"
    row = 3  if position_split[0] == "D"
    row = 4  if position_split[0] == "E"
    row = 5  if position_split[0] == "F"
    row = 6  if position_split[0] == "G"
    row = 7  if position_split[0] == "H"
    row = 8  if position_split[0] == "I"
    row = 9  if position_split[0] == "J"
    row = 10 if position_split[0] == "K"
    row = 11 if position_split[0] == "L"
    position << row
  end

  def self.validate_player_ship_position(ship, board, ship_position, player_ship_orientation)
    binding.pry
    key_to_validate = []
    split_position = Validator.input_position_generator(ship_position)
    Validator.orientation_direction(key_to_validate, split_position, player_ship_orientation, ship, board)
    Validator.validate_key_for_player(key_to_validate, ship, split_position, board, player_ship_orientation)
  end

  def self.validate_computer_ship_position(ship, board)
    key_to_validate = []
    split_position = Validator.input_position_generator(Validator.generate_ship_position)
    orientation = Validator.orientation_generator
    Validator.orientation_direction(key_to_validate, split_position, orientation, ship, board)
    Validator.validate_key_for_computer(key_to_validate, ship, split_position, board, orientation)
  end

  def self.place_ship_on_board(split_position, ship, board, orientation)
    (ship[1].length).times do |index|
      if orientation == "horizontal" || orientation == "h"
      board.rows[split_position[0]][split_position[1] + index] = ("S".rjust(2, " "))
      else orientation == "vertical" || orientation == "v"
        board.rows[split_position[0]+ index][split_position[1]] = ("S".rjust(2, " "))
      end
    end
  end

  def self.orientation_direction(key_to_validate, split_position, orientation, ship, board)
    (ship[1].length).times do |index|
      if orientation == "horizontal" || orientation == "h"
        Validator.build_horizontal_key_to_validate(key_to_validate, split_position, board, index)
      else orientation == "vertical" || orientation == "v"
        Validator.build_vertical_key_to_validate(key_to_validate, split_position, board, index)
        # if (board.rows[split_position[0] + 1]) == nil || (board.rows[split_position[1] + 1]) == nil
        #   key_to_validate << nil
        # elsif orientation == "horizontal"
        #   key_to_validate << board.rows[split_position[0]][(split_position[1] + index)]
        # elsif orientation == "vertical"
        #   key_to_validate << board.rows[split_position[0] + index][split_position[1]]
        # end
      end
    end
  end

  def self.build_horizontal_key_to_validate(key_to_validate, split_position, board, index)
    if (board.rows[split_position[1] + 1]) == nil
      key_to_validate << nil
    else
      key_to_validate << board.rows[split_position[0]][(split_position[1] + index)]
    end
  end

  def self.build_vertical_key_to_validate(key_to_validate, split_position, board, index)
    if (board.rows[split_position[0] + 1]) == nil
      key_to_validate << nil
    else
      key_to_validate << board.rows[split_position[0] + index][split_position[1]]
    end
  end

  def self.convert_position_to_strings(split_position)
    row = "A" if split_position[0] == 0
    row = "B" if split_position[0] == 1
    row = "C" if split_position[0] == 2
    row = "D" if split_position[0] == 3
    row = "E" if split_position[0] == 4
    row = "F" if split_position[0] == 5
    row = "G" if split_position[0] == 6
    row = "H" if split_position[0] == 7
    row = "I" if split_position[0] == 8
    row = "J" if split_position[0] == 9
    row = "K" if split_position[0] == 10
    row = "L" if split_position[0] == 11
    converted_string_position = row + split_position[1].to_s
    converted_string_position
  end

  def self.validate_key_for_computer(key_to_validate, ship, split_position, board, orientation)
    passkey = Validator.generate_passkey(ship)
    if key_to_validate == passkey
      Validator.place_ship_on_board(split_position, ship, board, orientation)
      Validator.place_position_on_ship(split_position, ship)
    else
      validate_computer_ship_position(ship, board)
    end
  end

  def self.validate_key_for_player(key_to_validate, ship, split_position, board, player_ship_orientation)
    passkey = Validator.generate_passkey(ship)
    if key_to_validate == passkey
      Validator.place_ship_on_board(split_position, ship, board)
      Validator.place_position_on_ship(split_position, ship)
    else
      puts "Invalid Ship Position. Try Again."
      ship_position = gets.chomp.upcase
      validate_player_ship_position(ship, board, ship_position, player_ship_orientation)
    end
  end

  def self.generate_passkey(ship)
    key = Array.new
    (ship[1].length).times do
      key.push("")
    end
    key
  end

  def self.place_position_on_ship(split_position, ship)
    string_position = Validator.convert_position_to_strings(split_position)
    incremented_string = string_position
    (ship[1].length).times do |index|
      if index == 0
        ship[1][index] = string_position
      else
        ship[1][index] = Validator.increment_string_position(incremented_string, string_position, index)
      end
    end
  end

  def self.increment_string_position(incremented_string, string_position, index)
    index.times do
      incremented_string = incremented_string.next
    end
    incremented_string
  end

  def self.orientation_generator
    ["horizontal", "vertical"].sample
  end
end
