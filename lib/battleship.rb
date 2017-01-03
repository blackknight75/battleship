require './lib/computer'
require './lib/battleship'
require './lib/phrases'
require './lib/player'
require 'pry'
class Battleship
  include Phrases
  attr_reader :computer_player

  def initialize
    # @computer_player = Computer.new
    # @player = Player.new
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
      Battleship.main_prompt
    end
  end

  def self.play
    Battleship.difficulty_options
    # Phrases.placing_ships_message
    Battleship.computer_place_ships
    Battleship.player_place_ships
  end

  def self.difficulty_options
    puts `clear`
    Phrases.battleship_banner
    Phrases.difficulty_options
    difficulty = gets.chomp
    if Phrases.available_difficulties.include?(difficulty)
      @computer_player= Computer.new
      @player = Player.new
      @computer_player.generate_board_based_on_difficulty(difficulty)
      @player.generate_board_based_on_difficulty(difficulty)
    else
      puts "Invalid command. Try again."
      sleep 1
      Battleship.difficulty_options
    end
  end

  def self.computer_place_ships
    @computer_player.place_ship
  end

  def self.player_place_ships
    puts `clear`
    Phrases.battleship_banner
    Battleship.player_interface
    Phrases.enter_player_position
    player_ship_position = gets.chomp.upcase
    if Phrases.valid_positions.include?(player_ship_position)
      #sanitize input
      puts "Orientation: (H) for horizontal or (V) for vertical"
      Phrases.orientation_prompt
      player_ship_orientation = gets.chomp.downcase
      #sanitize input
      @player.place_ship(player_ship_position, player_ship_orientation)
    else
      puts "Invalid Postion. Try again."
      Battleship.player_place_ships
    end
  end

  def self.player_interface
    Battleship.lines
    puts "SHOT BOARD".center(40, " ")
    Battleship.lines
    @player.generate_shot_board
    Battleship.lines
    puts "======================================="
    Battleship.lines
    puts "SHIP BOARD".center(40, " ")
    Battleship.lines
    @player.generate_ship_board
    Battleship.lines
    @computer_player.generate_board
  end

  Phrases.battleship_banner
  # Phrases.welcome_message
  Battleship.main_prompt
end
