require_relative "../test_helper"
require_relative "../../models/state"

class StateTest < Minitest::Test
  def setup
    @state = State.new("id" => 21, "nome" => "Rio de Janeiro", "sigla" => "RJ")
  end

  def test_initialize_with_keys_as_symbols_or_string
    state_sym = State.new(id: 21, nome: "Rio de Janeiro", sigla: "RJ")
    assert_equal "RJ", state_sym.sigla
    assert_equal 21, state_sym.id
  end

  def test_state_initialize_with_valid_attributes
    assert_equal "RJ", @state.sigla
    assert_equal 21, @state.id
  end
end
