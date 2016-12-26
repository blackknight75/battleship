require './lib/computer'
require './lib/battleship'
require './lib/phrases'
require 'pry'
class Battleship
  include Phrases
  attr_reader :computer_player

  def initialize
    @computer_player = Computer.new
    @player = Player.new
  end

    @input = ""
  def self.lines
    puts lines = "----------------------------------------"
  end

  def self.main_prompt
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    # Phrases.instructions
    input = gets.chomp
    if input == "play" || input == "p"
      Battleship.play
    elsif input == "instructions" || input == "i"
      #print instructions
      #main_prompt
    else
      Phrases.error
    end
  end

  def self.play
    Battleship.difficulty_options
    # Phrases.placing_ships_message
    Battleship.computer_place_ships
    Battleship.player_place_ship
  end

  def self.difficulty_options
    puts `clear`
    Phrases.battleship_banner
    Phrases.difficulty_options
    difficulty = gets.chomp
    if Phrases.available_difficulties.include?(difficulty)
      @computer_player= Computer.new
      @computer_player.generate_board_based_on_difficulty(difficulty)
    else
      puts "Invalid command. Try again."
      sleep 1
      Battleship.difficulty_options
    end
  end

  def self.computer_place_ships
    @computer_player.place_ship
  end

  def self.player_place_ship
    puts `clear`
    Phrases.battleship_banner
    Phrases.enter_player_position
    Battleship.lines
    @player.generate_board
    # battleship.human_player.generate_board
    Battleship.lines
    input = gets.chomp
    "Now input the orientation of the ship.
    H for horizontal or V for vertical"
    orientation = gets.chomp
  end

  Phrases.battleship_banner
  # Phrases.welcome_message
  Battleship.main_prompt
end
