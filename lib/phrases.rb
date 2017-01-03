module Phrases

  def self.welcome_message
    `say -r 10 -v Ava "Welcome to SUPER Battleship!"`
  end

  def self.instructions
    `say -r 10 -v Ava "If you would like to start a new game..please type play
                      or the letter P........For game instructions type
                      instructions or the letter I........to give up and run
                      away like a scared little baby..type quit or the letter
                      Q......"`
  end

  def self.orientation_prompt
    `say -r 10 -v Ava "Type H for horizontal or V for vertical"`
  end

  def self.difficulty_options
    puts "Choose Difficulty."
    puts "-".center(40, '-')
    puts "(B)eginner: 4 x 4 and 2 ships"
    puts "-".center(40, '-')
    puts "(I)ntermediate: 8 x 8 and 3 ships(NOT WORKING)"
    puts "-".center(40, '-')
    puts "(H)ard: 12 x 12 and 4 ships(NOT WORKING)"
  end

  def self.available_difficulties
    ["beginner", "b", "intermediate", "i", "hard", "h"]
  end

  def self.thinking
    sleep 1
    puts "Thinking".center(40, '-')
  end

  def self.battleship_banner
    puts `clear`
      puts "=".center(72, '=')
      puts "     _____                    _____     _   _   _         _   _
    |   __|_ _ ___ ___ ___   | __  |___| |_| |_| |___ ___| |_|_|___
    |__   | | | . | -_|  _|  | __ -| .'|  _|  _| | -_|_ -|   | | . |
    |_____|___|  _|___|_|    |_____|__,|_| |_| |_|___|___|_|_|_|  _|
              |_|                                              |_|
    "
    puts "=".center(72, '=')
  end

  def self.placing_ships_message
    puts `clear`
    Phrases.battleship_banner
    puts "Computer is placing its ships."
    5.times { |x| Phrases.thinking }
    puts "Computer has finished placing ships"
  end

  def self.enter_player_position
    sleep 1
    puts "-".center(72, '-')
    puts "Now it's your turn.
    Enter the letter first and then number of the starting position."
    puts "-".center(72, '-')
  end

  def self.error
    puts `clear`
    Phrases.battleship_banner
    puts "Unrecognized command please try again."
    Battleship.lines
  end

  def self.position_error(ship_position)
    if Phrases.valid_positions.include?(ship_position)

    else
      puts "Invalid Postion. Try again."
      ship_position = gets.chomp.upcase
    end
  end

  def self.valid_positions
    ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12",
     "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12",
     "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12",
     "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12",
     "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12",
     "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
     "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12",
     "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
     "I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "I11", "I12",
     "J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11", "J12",
     "K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "K10", "K11", "K12",
     "L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10", "L11", "L12",
    ]
  end
end
