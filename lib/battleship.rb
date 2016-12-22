require 'pry'
require './lib/computer'
class Battleship
  attr_reader :computer_player

  def initialize
    @computer_player = Computer.new
  end
end
