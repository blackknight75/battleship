require './test/test_helper'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_can_instantiate_battleship
    battleship = Battleship.new
    assert_instance_of Battleship, battleship
  end
end
