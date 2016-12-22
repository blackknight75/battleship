require './lib/ships'
class Board
  attr_reader :columns, :rows, :ships
  def initialize
    @columns = [". 1 2 3 4"]
    @rows    = [["a", "", "", "", "","\n"],
                ["b", "", "", "", "","\n"],
                ["c", "", "", "", "","\n"],
                ["d", "", "", "", ""]]
    @ships   = Ships.new
  end

  def input_position_generator(position)
    position_split = position.chars
    first = 0 if position_split[0] == "A"
    first = 1 if position_split[0] == "B"
    first = 2 if position_split[0] == "C"
    first = 3 if position_split[0] == "D"
    second = position_split[1].to_i
    store_position_for_ship(first, second)
  end

  def store_position_for_ship(first, second)
  end
end
