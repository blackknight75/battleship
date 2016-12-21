require 'pry'
class Battleship
  attr_reader :computer_player

  def initialize
    # @phrases = Phrases.new
    @computer_player = Computer.new
  end
end
