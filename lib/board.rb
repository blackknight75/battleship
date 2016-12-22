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
end
