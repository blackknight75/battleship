class Ships
  attr_accessor :ships

  def initialize
    @ships = [
      ["Destroyer", ["",""]], ["Cruiser", ["", "", ""]],
      ["Submarine", ["", "", ""]], ["Battleship", ["", "", "",""]],
      ["Carrier", ["", "", "","", ""]]
    ]
  end
end
