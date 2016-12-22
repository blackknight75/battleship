require './lib/battleship'
# require './lib/repl'
require './lib/phrases'
# require './lib/board'
# require './lib/computer'
# require './lib/ships'
require 'pry'
class Repl
  include Phrases
  attr_reader :battleship

    @battleship = Battleship.new
    @input = ""

  # Phrases.welcome_message
  def self.lines
    puts lines = "----------------------------------------"
  end

  def self.main_prompt
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp
    # Phrases.instructions
    if input == "play" || input == "p"
      Repl.play
    else
      Repl.error
    end
  end

  def self.computer_place_ships
    @battleship.computer_player.computer_place_ships
  end

  def self.play
    Repl.difficulty_options
    Phrases.placing_ships_message
    Repl.computer_place_ships
    Repl.player_place_ship
  end

  def self.difficulty_options
    puts `clear`
    Phrases.battleship_banner
    Phrases.difficulty_options
    difficulty = gets.chomp
    #if "B" load grid and ships for beginner difficulty
    #if "I" load grid and ships for intermediate difficulty
    #if "H" load grid and ships for Hard  difficulty
  end


  def self.player_place_ship
    puts `clear`
    Phrases.battleship_banner
    Phrases.enter_player_position
    Repl.lines
    # battleship.human_player.generate_board
    Repl.lines
    input = gets.chomp
    "Now input the orientation of the ship.
    H for horizontal or V for vertical"
    orientation = gets.chomp
  end


  Phrases.battleship_banner
  Repl.main_prompt
end
