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
    row = 0 if position_split[0] == "A"
    row = 1 if position_split[0] == "B"
    row = 2 if position_split[0] == "C"
    row = 3 if position_split[0] == "D"
    position << row
  end

  def self.validate_ship_position(ship, board)
    key_to_validate = []
    split_position = Validator.input_position_generator(Validator.generate_ship_position)
    orientation = Validator.orientation_generator
    Validator.orientation_direction(key_to_validate, split_position, orientation, ship, board)
    Validator.validate_key(key_to_validate, ship, split_position, board)
  end

  def self.place_ship_on_board(split_position, ship, board)
    (ship[1].length).times do |index|
      board.rows[split_position[0]][split_position[1] + index] = ("S".rjust(2, " "))
    end
  end

  def self.orientation_direction(key_to_validate, split_position, orientation, ship, board)
    (ship[1].length).times do |index|
      if (board.rows[split_position[0] + 1]) == nil || (board.rows[split_position[1] + 1]) == nil
        key_to_validate << nil
      elsif orientation == "horizontal"
        key_to_validate << board.rows[split_position[0]][(split_position[1] + index)]
      elsif orientation == "vertical"
        key_to_validate << board.rows[split_position[0] + index][split_position[1]]
      end
    end
  end

  def self.convert_position_to_strings(split_position)
    row = "A" if split_position[0] == 0
    row = "B" if split_position[0] == 1
    row = "C" if split_position[0] == 2
    row = "D" if split_position[0] == 3
    converted_string_position = row + split_position[1].to_s
    converted_string_position
  end

  def self.validate_key(key_to_validate, ship, split_position, board)
    passkey = Validator.generate_passkey(ship)
    if key_to_validate == passkey
      Validator.place_ship_on_board(split_position, ship, board)
      Validator.place_position_on_ship(split_position, ship)
    else
      validate_ship_position(ship, board)
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
