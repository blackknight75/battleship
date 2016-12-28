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
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp
  end
end
