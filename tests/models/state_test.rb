require_relative "../test_helper"
require_relative "../../models/state"

class StateTest < Minitest::Test
  def test_state_initialize_with_valid_attributes
    state = State.new("id" => 21, "nome" => "Rio de Janeiro", "sigla" => "RJ")
    assert_equal "RJ", state.sigla
    assert_equal 21, state.id
  end
end
