require './lib/battleship'
require './lib/repl'
require './lib/phrases'
require './lib/board'
require './lib/computer'
require './lib/ships'
require 'pry'
class Repl
  include Phrases

  battleship = Battleship.new
  lines = "----------------------------------------"
  input = ""

  puts "-".center(64, '-')
  puts " _____                    _____     _   _   _         _   _
|   __|_ _ ___ ___ ___   | __  |___| |_| |_| |___ ___| |_|_|___
|__   | | | . | -_|  _|  | __ -| .'|  _|  _| | -_|_ -|   | | . |
|_____|___|  _|___|_|    |_____|__,|_| |_| |_|___|___|_|_|_|  _|
          |_|                                              |_|
"
  puts "-".center(64, '-')
  # battleship.welcome
  # Phrases.welcome_message
  # battleship.input_position_generator("B1")


  until input == "quit" || input == "q"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    # Phrases.instructions
    input = gets.chomp
    puts `clear`
    if input == "play" || input == "p"
      puts "Choose Difficulty."
      puts lines
      puts "(B)eginner: 4 x 4 and 2 ships"
      puts lines
      puts "(I)ntermediate: 8 x 8 and 3 ships(NOT WORKING)"
      puts lines
      puts "(H)ard: 12 x 12 and 4 ships(NOT WORKING)"
      difficulty = gets.chomp
      #if "B" load grid and ships for beginner difficulty
      #if "I" load grid and ships for intermediate difficulty
      #if "H" load grid and ships for Hard  difficulty
      puts `clear`
      puts "Computer is placing its ships."
        Phrases.thinking
        Phrases.thinking
        Phrases.thinking
        Phrases.thinking
        Phrases.thinking
        battleship.computer_player.computer_place_ships
      #computer place ships method
      sleep 2
      puts "Computer has finished placing ships"
      sleep 3
      puts `clear`
      puts "-".center(86, '-')
      puts "Now it's your turn. Enter the letter first and then number of the starting position."
      puts "-".center(86, '-')
      puts lines
      # battleship.human_player.generate_board
      puts lines
      input = gets.chomp
      "Now input the orientation of the ship.
       H for horizontal or V for vertical"
     else
    puts "Unrecognized command please try again."
    puts lines
     end
  end
end
